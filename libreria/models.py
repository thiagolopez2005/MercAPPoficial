from django.contrib.auth.models import AbstractUser, BaseUserManager, Group, Permission
from django.db import models
from django.conf import settings
from django.utils import timezone

# --------------------- MANAGER PARA CustomUser ---------------------
class CustomUserManager(BaseUserManager):
    def create_user(self, cec, email, password=None, **extra_fields):
        if not cec:
            raise ValueError('El campo CEC es obligatorio')
        if not email:
            raise ValueError('El campo Email es obligatorio')
        email = self.normalize_email(email)
        user = self.model(cec=cec, email=email, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, cec, email, password=None, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)
        extra_fields.setdefault('is_active', True)

        if not extra_fields.get('is_staff'):
            raise ValueError('El superusuario debe tener is_staff=True.')
        if not extra_fields.get('is_superuser'):
            raise ValueError('El superusuario debe tener is_superuser=True.')

        return self.create_user(cec, email, password, **extra_fields)

# --------------------- USUARIO ADMIN Y EMPLEADO ---------------------
class CustomUser(AbstractUser):
    ROLE_CHOICES = (
        ('admin', 'Administrador'),
        ('emple', 'Empleado'),
    )

    role = models.CharField(max_length=10, choices=ROLE_CHOICES, default='emple')
    email = models.EmailField(unique=True)
    cec = models.CharField(max_length=10, unique=True)
    nombre = models.CharField(max_length=250)
    apellido = models.CharField(max_length=250)
    telefono = models.CharField(max_length=10, blank=True, null=True)
    status = models.CharField(max_length=20, default='No activo')
    username = models.CharField(max_length=150, blank=True, null=True, unique=False)

    # 👇 Agregado para evitar conflictos
    groups = models.ManyToManyField(
        Group,
        related_name='customuser_set',
        blank=True
    )
    user_permissions = models.ManyToManyField(
        Permission,
        related_name='customuser_permissions',
        blank=True
    )

    USERNAME_FIELD = 'cec'
    REQUIRED_FIELDS = ['nombre', 'email']

    objects = CustomUserManager()

    def __str__(self):
        return self.cec

# --------------------- CLIENTE SIN AUTENTICACIÓN ADMIN ---------------------
class CustomCliente(AbstractUser):
    ROLE_CHOICES = (
        ('user', 'Usuario'),
    )
    roleCliente = models.CharField(max_length=10, choices=ROLE_CHOICES, default='user')
    email = models.EmailField(unique=True)
    telefono = models.CharField(max_length=10, blank=True, null=True)
    CC = models.CharField(max_length=10, blank=False, null=False, unique=True)
    nombre = models.CharField(max_length=250, blank=False, null=False)
    apellido = models.CharField(max_length=250, blank=False, null=False)

    # 👇 Agregado para evitar conflictos
    groups = models.ManyToManyField(
        Group,
        related_name='customcliente_set',
        blank=True
    )
    user_permissions = models.ManyToManyField(
        Permission,
        related_name='customcliente_permissions',
        blank=True
    )

    USERNAME_FIELD = 'username'
    REQUIRED_FIELDS = ['CC', 'email', 'nombre', 'apellido']

    def __str__(self):
        return self.CC

# --------------------- MEDIDA Y PRODUCTO ---------------------
class Medida(models.Model):
    nombre = models.CharField(max_length=50, unique=True)

    def __str__(self):
        return self.nombre

class Producto(models.Model):
    TIPOS_PRODUCTO_CHOICES = [
        ('frutas', 'Frutas'),
        ('verduras', 'Verduras'),
        ('tuberculos', 'Tubérculos'),
        ('hortalizas', 'Hortalizas'),
    ]

    imagen = models.ImageField(upload_to='productos/')
    nombre = models.CharField(max_length=100)
    descripcion = models.TextField()
    origen = models.CharField(max_length=100)
    unidad = models.FloatField()
    stock = models.IntegerField()
    precio = models.DecimalField(max_digits=10, decimal_places=0)
    publicado = models.BooleanField(default=True)
    medida = models.ForeignKey(Medida, on_delete=models.PROTECT)
    tipoproducto = models.CharField(max_length=20, choices=TIPOS_PRODUCTO_CHOICES, default='frutas')
    habilitado = models.BooleanField(default=True)

    def __str__(self):
        return self.nombre

# --------------------- PROVEEDOR ---------------------
class Proveedor(models.Model):
    nombre = models.CharField(max_length=100)
    apellido = models.CharField(max_length=100)
    telefono = models.CharField(max_length=15)
    correo = models.EmailField(unique=True)
    activo = models.BooleanField(default=True)

    def __str__(self):
        return f"{self.nombre} {self.apellido}"

# --------------------- FACTURA ---------------------
class Factura(models.Model):
    imagen = models.ImageField(upload_to='facturas/', null=True, blank=True)
    descripcion = models.TextField()
    numero_factura = models.AutoField(primary_key=True)
    fecha_publicacion = models.DateTimeField(default=timezone.now)
    habilitada = models.BooleanField(default=True)
    proveedor = models.ForeignKey(Proveedor, on_delete=models.CASCADE, null=True, blank=True)

    def __str__(self):
        return f"Factura #{self.numero_factura} - {self.descripcion[:50]}"

# --------------------- REGISTRO DE ACTIVIDAD ---------------------
class RegistroActividad(models.Model):
    usuario = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.SET_NULL, null=True, blank=True)
    timestamp = models.DateTimeField(auto_now_add=True)
    accion = models.CharField(max_length=255)
    detalle = models.TextField(blank=True, null=True)

    class Meta:
        ordering = ['-timestamp']

    def __str__(self):
        return f"{self.timestamp.strftime('%Y-%m-%d %H:%M:%S')} - {self.usuario.nombre if self.usuario else 'Sistema'} - {self.accion}"

# --------------------- PEDIDO Y CARRITO ---------------------
class Order(models.Model):
    user = models.ForeignKey(CustomCliente, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    is_active = models.BooleanField(default=True)
    pagada = models.BooleanField(default=False)

    def get_total_price(self):
        return sum(item.get_total_price() for item in self.orderproduct_set.all())

    def __str__(self):
        return f"Orden #{self.id} - Usuario: {self.user.CC} - Activa: {self.is_active}"

class OrderProduct(models.Model):
    order = models.ForeignKey(Order, on_delete=models.PROTECT)
    product = models.ForeignKey(Producto, on_delete=models.PROTECT)
    quantity = models.PositiveIntegerField(default=1)

    def get_total_price(self):
        return self.product.precio * self.quantity

# --------------------- RESUMEN DE COMPRA ---------------------
class ResumenCompra(models.Model):
    cliente = models.ForeignKey(CustomCliente, on_delete=models.CASCADE)
    total = models.DecimalField(max_digits=10, decimal_places=1)
    iva = models.DecimalField(max_digits=10, decimal_places=1)
    total_con_iva = models.DecimalField(max_digits=10, decimal_places=1)
    fecha_compra = models.DateTimeField(auto_now_add=True)
    orderproduct_set = models.ManyToManyField(OrderProduct)
    pagada = models.BooleanField(default=False)
    metodo_pago = models.CharField(max_length=20, blank=True, null=True)
    referencia_pago = models.CharField(max_length=8, blank=True, null=True)
    forma_entrega = models.CharField(max_length=20, blank=True, null=True)
    direccion_entrega = models.CharField(max_length=255, blank=True, null=True)

    def __str__(self):
        return f'Compra de {self.cliente.CC} - {self.fecha_compra}'
