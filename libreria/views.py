from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from django.shortcuts import render, redirect, get_object_or_404
from .forms import ProductoForm
from django.contrib.auth import authenticate, login
from libreria.backends import CustomClienteBackend
from .forms import CustomUserCreationForm, CustomAuthenticationForm, CustomUserChangeForm,EditarPerfilClienteForm
from .models import CustomUser 
from django.contrib import messages
from .forms import ProveedorForm
from .models import Factura, Proveedor
from django.core.signing import TimestampSigner, BadSignature, SignatureExpired
from django.template.loader import render_to_string
from django.utils.html import strip_tags
from django.core.mail import EmailMultiAlternatives
from django.contrib.auth.hashers import make_password
from django.urls import reverse
from .forms import CustomClienteCreationForm
from .forms import FacturaForm
import os
from django.core.exceptions import ValidationError
from xhtml2pdf import pisa
from libreria.backends import CustomClienteBackend
from django.http import HttpResponse, Http404
from django.conf import settings
from datetime import datetime
import subprocess
from django.contrib.auth.password_validation import validate_password
from decimal import Decimal
from .models import Producto, Order, OrderProduct,ResumenCompra, CustomCliente,RegistroActividad
from django.http import HttpResponse
from django.template.loader import get_template
from libreria.decorators import admin_required
from libreria.decorators import verificar_rol_requerido


# ----------------------------------
#---- REGISTRO PARA EL ADMINISTRADOR Y EMPLEADO
#------------------------------------
def register_view(request):
    if request.method == 'POST':
        form = CustomUserCreationForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)  # No guardes el usuario aún
            user.username = form.cleaned_data['cec']  # Asigna el valor de 'cec' al campo 'username'
            user.save()  # Guarda el usuario con el campo 'username' actualizado
            return redirect('login')
    else:
        form = CustomUserCreationForm()
    return render(request, 'accounts/formulario.html', {'form': form})

#--------------------------------------------
# REGISTRO PARA LOS CLIENTES 
#-------------------------------------------

def register_cliente(request):
    if request.method == 'POST':
        form = CustomClienteCreationForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)  # No guardes el usuario aún
            user.username = form.cleaned_data['CC']  # Asigna el valor de 'CC' al campo 'username'
            user.save()  # Guarda el usuario
            form.save()

            return redirect('login')  # Redirige al login después de registrar
    else:
        form = CustomClienteCreationForm()
    return render(request, 'accounts/registro_cliente.html', {'form': form})

#------------------------------------------------------------------
# -------------------LOGEO PARA EL ADMINITSARDOR Y EMPLEADO---------------------------
# AQUI CUANDO INGRESE EL USUARIO POR SU ROL, SEA ENVIADO A SU RESPECTIVO DASHBOARD
#-------------------------------------------------------------------------

def login_view(request):
    error_message = ''
    if request.method == 'POST':
        cec = request.POST.get('cec')  #AQUI EN INGRESARA POR SU CC
        password = request.POST.get('password')
        role = request.POST.get('role')
        user = authenticate(request, username=cec, password=password)
        
        if user is not None:
            if user.role != role:
                error_message = 'El rol seleccionado no coincide con el de tu cuenta.'
            else:
                login(request, user)
                if role == 'admin':
                    return redirect('dashboard')  # Redirige al panel de administración
                elif role == 'emple':
                    return redirect('vista_emple')
        else:
            error_message = 'CC o contraseña incorrectos.'
    form = CustomAuthenticationForm()
    return render(request, 'accounts/AdminEmpleClient.html', {'form': form, 'error_message': error_message})


#------------------------------------------------------
# LOGEO DEL CLIENTE
# AQUI EL CLIENTE SE LOGEA, SE CREO UN ARCHIVO LLAMDA BACKENDS.PY PARA VALIDAR QUE EL USUARIO ESTA REGISTRADO ,EN LA BASE DE DATOS Y QUE SU ROL ES CLIENTE, SI NO LO ES NO SE LE PERMITE EL ACCESO
#----------------------------------------------------

def login_cliente_view(request):
    error_message = ''
    if request.method == 'POST':
        CC = request.POST.get('CC')  #AQUI EL CLIENTE INGRESA POR EL CC
        password = request.POST.get('password')

        # Autenticar al cliente
        user = authenticate(request, username=CC, password=password) #AQUI VALIDAMOS SI ESTA REGISTADO EN LA BD

        if user is not None:
            # Verificar si el usuario es un cliente
            if hasattr(user, 'roleCliente') and user.roleCliente == 'user':
                login(request, user)
                return redirect('Productos')  # Redirige a la vista de productos
            else:
                error_message = 'No tienes permisos de cliente.'
        else:
            error_message = 'Credenciales inválidas.'
    return render(request, 'accounts/AdminEmpleClient.html', {'error_message': error_message})

# -----------------------------------------------------
#AQUI PODEMOS EDITAR EL PERFIL DEL ADMIN O EMPLEADO
#-------------------------------------------------------

def editar_perfil(request):
    user = request.user  # Usuario autenticado
    if request.method == 'POST':
        # Actualizar los datos del usuario
        user.nombre = request.POST.get('first_name', user.nombre)
        user.apellido = request.POST.get('last_name', user.apellido)
        user.email = request.POST.get('email', user.email)
        user.telefono = request.POST.get('telefono', user.telefono)
        user.save()  # Guarda los cambios en la base de datos
        return redirect('dashboard') 
    return render(request, 'accounts/editar_perfin.html', {'user': user})

#------------------------------------------------
#AQUI EL CLIENTE SERA REGISTRADO DESDE EL PANEL ADMINM
#--------------------------------------------
@verificar_rol_requerido('admin')
@admin_required(login_url="/accounts/login/")
def register_cliente_view(request):
    if request.method == 'POST':
        form = CustomClienteCreationForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)  # No guardes el usuario aún
            user.username = form.cleaned_data['CC']  # Asigna el valor de 'CC' al campo 'username'
            user.save()  # Guarda el usuario
            form.save()

            # Registrar la actividad
            RegistroActividad.objects.create(
                usuario=request.user,  # Usuario que realiza el registro
                accion="Registro de cliente",
                detalle=f"Se registró un nuevo cliente: {user.username}"
            )

            return redirect('login')  # Redirige al login después de registrar
    else:
        form = CustomClienteCreationForm()
    return render(request, 'accounts/registro_cliente1.html', {'form': form})

# vista tabla de los datos del cliente

def listar_clientes(request):
    clientes = CustomCliente.objects.all()
    return render(request, 'accounts/clientes.html', {'clientes': clientes})

@verificar_rol_requerido('admin')
@admin_required(login_url="/accounts/login/")
def editar_cliente(request, cliente_id):
    cliente = get_object_or_404(CustomCliente, id=cliente_id)
    if request.method == 'POST':
        form = EditarPerfilClienteForm(request.POST, instance=cliente)
        if form.is_valid():
            form.save()
            messages.success(request, f"El perfil de {cliente.nombre} {cliente.apellido} ha sido actualizado con éxito.")
            return redirect('listar_clientes')  # Redirige a la lista de clientes
        else:
            messages.error(request, "Por favor corrige los errores en el formulario.")
    else:
        form = EditarPerfilClienteForm(instance=cliente)

    return render(request, 'accounts/editar_perfil_cliente.html', {'form': form, 'cliente': cliente})

# --------------------------------------------------------------------
#CERRAR CESION DE AMBOS LOGEOS, AQUI EL EMPELADO , ADMIN Y CLIENTE CIERRAN SESION, SE REDIRECCIONA A LA PRINCIPAL
#--------------------------------------------------------------------
def logout_view(request):
    logout(request)
    return redirect('Principal')

# ------------------ VISTAS DE CADA HTML EXTERNO (VISTAS CLIENTES) ----------------------

def home(request):
    return render(request, 'accounts/Principal.html')

def inventario(request):
    productos = Producto.objects.all() #AQUI VISUALIZA LOS PORDUCTOS GUARDADOS EN EL HMTL PORDUCTOS2
    return render(request, 'accounts/inventario.html', {'productos': productos})

def Principal(request):
    return render(request, 'accounts/Principal.html')

def Nosotros(request):
    return render(request, 'accounts/Nosotros.html')

def Servicios(request):
    return render(request, 'accounts/Servicios.html')

def index(request):
    return render(request, 'accounts/Principal.html')

def terminos(request):
    return render(request, 'accounts/terminos_condiciones.html')

def error_403(request):
    return render(request, 'accounts/error_403.html', {
        'error_message': 'No tienes permisos para acceder a esta página.'
    })

# -------------------------------------------------------
#VISTA DEL ADMINISTRADOR
#------------------------------------------------
@verificar_rol_requerido('admin')
@admin_required(login_url="/accounts/login/") #AQUI USAMOS EL LOGIN_REQUIRER PARA TEMAS DE SEGUIDAD, NO DEJA INGRESAR AL PANEL A MENOS DE QUE QUE ESTE LOGEADO
def dashboard_view(request):
    actividades = RegistroActividad.objects.order_by('-timestamp')[:10]  # Últimas 10 actividades
    for actividad in actividades:
        if actividad.usuario:
            actividad.usuario_nombre = actividad.usuario.nombre  # Usar el atributo 'nombre'
        else:
            actividad.usuario_nombre = "Sistema"

    productos_count = Producto.objects.count()
    cuentas = CustomUser.objects.all()
    clientes = CustomCliente.objects.all()
    proveedores = Proveedor.objects.all()

    return render(request, 'accounts/dashboard.html', {
        'cuentas': cuentas,
        'productos_count': productos_count,
        'clientes': clientes,
        'proveedor': proveedores,
        'actividades': actividades
    })
# --------------------------------------------------------
#VISTA EMPELADO
# AQUI EL EMPLEADO PUEDE VER LOS PRODUCTOS QUE SE ENCUENTRAN EN EL INVENTARIO
#----------------------------------------------------
@login_required(login_url="/accounts/login/")
def vista_emple(request):
    productos = Producto.objects.all()  # Recupera todos los productos
    context = {
        'productos': productos,
    }
    return render(request, 'accounts/vista_emple.html')
# -------------------------------------------
# REGISTRO DE LOS PROVEEDORES 
# -------------------------------------------

def listar_proveedores(request):
    proveedores = Proveedor.objects.all()
    return render(request, 'accounts/proveedores.html', {'proveedores': proveedores})

@verificar_rol_requerido('admin')
@admin_required(login_url="/accounts/login/")
def registrar_proveedor(request):
    if request.method == 'POST':
        form = ProveedorForm(request.POST)
        if form.is_valid():
            proveedor = form.save()
            # Registrar la actividad
            RegistroActividad.objects.create(
                usuario=request.user,
                accion="Registro de proveedor",
                detalle=f"Se registró un nuevo proveedor: {proveedor.nombre} {proveedor.apellido}"
            )
            return redirect('listar_proveedor')
    else:
        form = ProveedorForm()
    return render(request, 'accounts/registrar_proveedores.html', {'form': form})

@verificar_rol_requerido('admin')
@admin_required(login_url="/accounts/login/", error_url="/error_403/")
def inhabilitar_proveedor(request, id):
    proveedor = get_object_or_404(Proveedor, id=id)
    proveedor.activo = False
    proveedor.save()
    # Registrar la actividad
    RegistroActividad.objects.create(
        usuario=request.user,
        accion="Inhabilitación de proveedor",
        detalle=f"Se inhabilitó al proveedor: {proveedor.nombre} {proveedor.apellido}"
    )
    return redirect('listar_proveedor')

@admin_required(login_url="/accounts/login/", error_url="/error_403/")
def habilitar_proveedor(request, id):
    proveedor = get_object_or_404(Proveedor, id=id)
    proveedor.activo = True
    proveedor.save()
    # Registrar la actividad
    RegistroActividad.objects.create(
        usuario=request.user,
        accion="Habilitación de proveedor",
        detalle=f"Se habilitó al proveedor: {proveedor.nombre} {proveedor.apellido}"
    )
    return redirect('listar_proveedor')  # Asegúrate de que el nombre coincide con el definido en urls.py

@admin_required(login_url="/accounts/login/", error_url="/error_403/")
def editar_proveedor(request, id):
    proveedor = get_object_or_404(Proveedor, id=id)
    if request.method == 'POST':
        form = ProveedorForm(request.POST, instance=proveedor)
        if form.is_valid():
            form.save()
            return redirect('listar_proveedor')  # Redirige al dashboard después de guardar
    else:
        form = ProveedorForm(instance=proveedor)
    return render(request, 'accounts/editar_proveedor.html', {'form': form, 'proveedor': proveedor})

#---------------------------------------------
#  VISTAS PARA LA ADMINISTRACION DE CUENTAS ,AQUI SE MUESTRAN LOS USUARIOS REGISTRADOS EN EL SISTEMA, 
#SE PUEDEN EDITAR, ACTIVAR, DESACTIVAR Y ELIMINAR
#----------------------------------------------
def trabajadores(request):
    cuentas = CustomUser.objects.all()
    return render(request, 'accounts/Trabajadores.html', {'cuentas': cuentas})

@admin_required(login_url="/accounts/login/", error_url="/error_403/")
def editar_cuenta(request, id):
    # Obtén el usuario correspondiente al ID
    cuenta = get_object_or_404(CustomUser, id=id)
    if request.method == 'POST':
        form = CustomUserChangeForm(request.POST, instance=cuenta)
        if form.is_valid():
            form.save()
            return redirect('dashboard')  # Redirige al dashboard después de guardar
    else:
        form = CustomUserChangeForm(instance=cuenta)
    return render(request, 'accounts/editar_cuenta.html', {'form': form, 'cuenta': cuenta})

def activar_cuenta(request, id):
    """
    Activa la cuenta estableciendo el campo is_active a True.
    """
    cuenta = get_object_or_404(CustomUser, id=id)
    cuenta.is_active = True
    cuenta.save()
    return redirect('trabajadores')

def desactivar_cuenta(request, id):
    """
    Desactiva la cuenta estableciendo el campo is_active a False.
    """
    cuenta = get_object_or_404(CustomUser, id=id)
    cuenta.is_active = False
    cuenta.save()
    return redirect('listar_registros')

@admin_required(login_url="/accounts/login/", error_url="/error_403/")
def eliminar_cuenta(request, id):
    cuenta = get_object_or_404(CustomUser, id=id)
    if request.method == "POST":
        # Registrar la actividad antes de eliminar
        RegistroActividad.objects.create(
            usuario=request.user,
            accion="Eliminación de cuenta",
            detalle=f"Se eliminó la cuenta del usuario: {cuenta.nombre} {cuenta.apellido}"
        )
        cuenta.delete()
        return redirect('dashboard')
    return render(request, 'accounts/confirmar_eliminar_cuenta.html', {'cuenta': cuenta})

#----------------------------------------
#---------------- PRODUCTOS --------------
#----------------------------------------
@verificar_rol_requerido('admin')
@admin_required(login_url="/accounts/login/")
def productos2(request):
    if request.method == "POST":
        form = ProductoForm(request.POST, request.FILES)
        if form.is_valid():
            producto = form.save()  # Guarda el producto y obtiene la instancia
            # Registrar la actividad
            RegistroActividad.objects.create(
                usuario=request.user,  # Usuario que realiza el registro
                accion="Registro de producto",
                detalle=f"Se agregó un nuevo producto: {producto.nombre}"
            )
            return redirect('productos2')
    else:
        form = ProductoForm()
    # Filtrar productos por categoría
    frutas = Producto.objects.filter(tipoproducto='frutas')
    verduras = Producto.objects.filter(tipoproducto='verduras')
    tuberculos = Producto.objects.filter(tipoproducto='tuberculos')
    hortalizas = Producto.objects.filter(tipoproducto='hortalizas')
    # Combina todos los datos en un solo diccionario
    context = {
        'form': form,
        'frutas': frutas,
        'verduras': verduras,
        'tuberculos': tuberculos,
        'hortalizas': hortalizas,
        'productos': Producto.objects.all(),  # Recupera todos los productos
    }
    return render(request, 'accounts/productos2.html', context)


def productos(request):
    imagenes_publicadas = Producto.objects.filter(publicado=True)
    return render(request, 'accounts/Productos.html', {'imagenes_publicadas': imagenes_publicadas})  # Pasa los productos al contexto

#AQUI AGREGAMOS UN NUEVO PRODUCTO DESDE EL PANEL DE ADMIN
@verificar_rol_requerido('admin')
@admin_required(login_url="/accounts/login/", error_url="/error_403/")
def agregar_producto(request):
    if request.method == 'POST':
        imagen = request.FILES.get('imagen')
        nombre = request.POST.get('nombre')
        descripcion = request.POST.get('descripcion')
        origen = request.POST.get('origen')
        unidad = request.POST.get('unidad')
        precio = request.POST.get('precio')
        if imagen and descripcion and origen and unidad and precio and nombre:
            producto = Producto.objects.create(
                imagen=imagen,
                nombre=nombre,
                descripcion=descripcion,
                origen=origen,
                unidad=unidad,
                precio=precio,
            )
            # Registrar la actividad
            RegistroActividad.objects.create(
                usuario=request.user,
                accion="Registro de producto",
                detalle=f"Se agregó un nuevo producto: {producto.nombre}"
            )
            return JsonResponse({
                'imagen_url': producto.imagen.url,
                'id': producto.id,
                'nombre': producto.nombre,
                'descripcion': producto.descripcion,
                'origen': producto.origen,
                'unidad': producto.unidad,
                'precio': str(producto.precio),
            })
        else:
            return JsonResponse({'error': 'Todos los campos son obligatorios'}, status=400)
    return JsonResponse({'error': 'Método no permitido'}, status=405)

@verificar_rol_requerido('admin')
@admin_required(login_url="/accounts/login/", error_url="/error_403/")
def crear_producto(request):
    if request.method == 'POST':
        form = ProductoForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('productos2')
        else:
            return JsonResponse({'error': form.errors}, status=400)
    return JsonResponse({'error': 'Método no permitido'}, status=405)

@verificar_rol_requerido('admin')
@admin_required(login_url="/accounts/login/", error_url="/error_403/")#EN ESTA PARTE SUBIMOS EL PRODUCTO, TOMANDO RELACION CON LA FUNCION DE AGREGAR_PRODUCTO
def subir_imagen(request):
    if request.method == "POST":
        form = ProductoForm(request.POST, request.FILES)
        if form.is_valid():
            producto = form.save()  # Guarda el producto y obtiene la instancia
            # Registrar la actividad
            RegistroActividad.objects.create(
                usuario=request.user,  # Usuario que realiza el registro
                accion="Registro de producto",
                detalle=f"Se agregó un nuevo producto: {producto.nombre}"
            )
            return redirect('productos2')  # Redirige a la vista de productos2
    else:
        form = ProductoForm()
    return render(request, 'accounts/subir_imagen.html', {'form': form})


#AQUI PODEMOS PUBLICAR O NO PUBICAR UN PRODUCTO DESDE DEL PANEL ADMIN
@verificar_rol_requerido('admin')
def publicar_producto(request, productoId):
    if request.method == 'POST':
        imagen = get_object_or_404(Producto, id=productoId)
        imagen.publicado = True
        imagen.save()
        return JsonResponse({'success': True})
    return JsonResponse({'success': False})

@verificar_rol_requerido('admin')
def quitar_publicidad(request, productoId):
    if request.method == 'POST':
        imagen = get_object_or_404(Producto, id=productoId)
        imagen.publicado = False
        imagen.save()
        return JsonResponse({'success': True})
    return JsonResponse({'success': False})


 #AQUI PODEMOS EDITAR LOS DATOS DEL PRODUCTO AGREGADO   @verificar_rol_requerido('admin')
@verificar_rol_requerido('admin')
@admin_required(login_url="/accounts/login/", error_url="/error_403/")
def editar_producto(request, producto_id):
    producto = get_object_or_404(Producto, id=producto_id)
    if request.method == "POST":
        form = ProductoForm(request.POST, request.FILES, instance=producto)

        if form.is_valid():
            print("Formulario válido. Guardando cambios...")
            form.save()
            return redirect('productos2')
        else:
            print("Errores en el formulario:", form.errors)
    else:
        form = ProductoForm(instance=producto)
    return render(request, 'accounts/editar_producto.html', {'form': form})




#-----------------AQUI VISUALIZA LOS PRODUCTOS EN EL INVENTARIO-----

def obtener_productos_json(request):
    productos = Producto.objects.all().values('nombre', 'descripcion', 'unidad', 'medida', 'stock')  # Obtiene los campos específicos
    return JsonResponse(list(productos), safe=False)

@verificar_rol_requerido('admin')
@admin_required(login_url="/accounts/login/")
def editar_inven(request, producto_id):
    producto = get_object_or_404(Producto, id=producto_id)
    if request.method == "POST":
        form = ProductoForm(request.POST, request.FILES, instance=producto)
        if form.is_valid():
            form.save()
            return redirect('inventario')
    else:
        form = ProductoForm(instance=producto)
    return render(request, 'accounts/editarinve.html', {'form': form})


@verificar_rol_requerido('admin')
@admin_required(login_url="/accounts/login/")
def habilitar_producto(request, producto_id):
    producto = get_object_or_404(Producto, id=producto_id)
    producto.habilitado = True
    producto.save()
    messages.success(request, f"El producto '{producto.nombre}' ha sido habilitado con éxito.")
    return redirect(request.META.get('HTTP_REFERER', 'inventario'))
@verificar_rol_requerido('admin')
@admin_required(login_url="/accounts/login/")
def inhabilitar_producto(request, producto_id):
    producto = get_object_or_404(Producto, id=producto_id)
    producto.habilitado = False
    producto.save()
    messages.success(request, f"El producto '{producto.nombre}' ha sido habilitado con éxito.")
    return redirect(request.META.get('HTTP_REFERER', 'inventario'))
# -------------------------------------------
# REGISTRO DE LOS RECIBOS DE LOS PRODUCTOS EN EL BACKEND
# --------------------------------------------
@verificar_rol_requerido('admin')
@admin_required(login_url="/accounts/login/")

def crear_factura(request):
    if request.method == 'POST':
        form = FacturaForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('factura')
    else:
        form = FacturaForm()
    return render(request, 'accounts/crear_factura.html', {'form': form})
@admin_required(login_url="/accounts/login/")

@verificar_rol_requerido('admin')
@admin_required(login_url="/accounts/login/")
def factura(request):
    # Obtén todas las facturas registradas
    facturas = Factura.objects.all()
    return render(request, 'accounts/Factura.html', {'facturas': facturas})

@verificar_rol_requerido('admin')
@admin_required(login_url="/accounts/login/")

def editar_factura(request, numero_factura):
    # Obtén la factura correspondiente al número
    factura = get_object_or_404(Factura, numero_factura=numero_factura)

    if request.method == 'POST':
        form = FacturaForm(request.POST, request.FILES, instance=factura)
        if form.is_valid():
            form.save()
            return redirect('factura')  # Redirige a la lista de facturas
    else:
        form = FacturaForm(instance=factura)

    return render(request, 'accounts/editar_factura.html', {'form': form, 'factura': factura})

def inhabilitar_factura(request, numero_factura):
    factura = get_object_or_404(Factura, numero_factura=numero_factura)
    factura.habilitada = False
    factura.save()
    return redirect('factura')

def habilitar_factura(request, numero_factura):
    factura = get_object_or_404(Factura, numero_factura=numero_factura)
    factura.habilitada = True
    factura.save()
    return redirect('factura')


#------------------------------------------
#AGREGAR PRODUCTOS AL CARRITO
#--------------------------------------
def carrito(request):
    # Verifica si el usuario ha iniciado sesión
      # Verifica si el usuario ha iniciado sesión
    if not request.user.is_authenticated:
        return render(request, 'accounts/error_404.html', {
            'error_message': 'Debes iniciar sesión para acceder al carrito.',
            'productos_url': 'Productos',
            'login_url': 'login'
        })
        

    # Depuración: Imprime el usuario y su relación con CustomCliente
    print(f"Usuario autenticado: {request.user}")
    print(f"Es cliente: {hasattr(request.user, 'customcliente')}")
    
    try:
        cliente = CustomCliente.objects.get(username=request.user.username)
    except CustomCliente.DoesNotExist:
        return render(request, 'accounts/error_404.html', {
            'error_message': 'Debes ingresar como cliente para acceder al carrito.',
            'productos_url': 'Productos',
            'login_url': 'login'
        })


    # Obtén la orden activa del cliente
    order = Order.objects.filter(user=request.user, is_active=True).first()

    # Si no hay una orden activa, crea una nueva
    if not order:
        order = Order.objects.create(user=request.user)

    # Calcula el total, IVA y total con IVA
    total = order.get_total_price()
    iva = total * Decimal('0.19')
    total_con_iva = total + iva

    return render(request, 'accounts/Carrito.html', {
        'order': order,
        'total': total,
        'iva': iva,
        'total_con_iva': total_con_iva
    })

@login_required(login_url="/accounts/login/")
def actualizar_cantidad(request, order_product_id):
    try:
        order_product = get_object_or_404(OrderProduct, id=order_product_id)
        nueva_cantidad = int(request.POST.get('cantidad', 1))

        # Verificar si hay suficiente stock
        if nueva_cantidad > order_product.product.stock:
            return JsonResponse({'error': f"No hay suficiente stock para el producto '{order_product.product.nombre}'."}, status=400)

        if nueva_cantidad > 0:
            order_product.quantity = nueva_cantidad
            order_product.save()
            return JsonResponse({'success': f"La cantidad de '{order_product.product.nombre}' se actualizó a {nueva_cantidad}."})
        else:
            return JsonResponse({'error': "La cantidad debe ser mayor a 0."}, status=400)

    except Http404:
        return JsonResponse({'error': "Producto no encontrado en el carrito."}, status=404)
    except ValueError:
        return JsonResponse({'error': "Cantidad inválida."}, status=400)


def agregar_al_carrito(request, producto_id):
    # Verifica si el usuario está autenticado
    if not request.user.is_authenticated:
        # Agrega un mensaje de error
        messages.error(request, "Oh, salió un error. Debes iniciar sesión para agregar productos al carrito.")
        return redirect('Productos')  # Redirige a la página de productos
    
    if hasattr(request.user, 'role') and request.user.role in ['emple', 'admin']:
        # Mensaje de error para empleados o administradores
        messages.error(request, "❌ No tienes permisos para ingresar al carrito.")
        return redirect('Productos')
    # Obtén el producto
    producto = get_object_or_404(Producto, id=producto_id)
    cantidad = request.POST.get('cantidad', 1)

    try:
        cantidad = int(cantidad)
        if cantidad < 1:
            cantidad = 1
    except ValueError:
        cantidad = 1
        
    if cantidad > producto.stock:
        return JsonResponse({'error': f"No hay suficiente stock para el producto '{producto.nombre}'."}, status=400)

    # Obtén o crea una orden activa para el usuario
    order, created = Order.objects.get_or_create(user=request.user, is_active=True)

    # Verifica si el producto ya está en el carrito
    order_product, created = OrderProduct.objects.get_or_create(order=order, product=producto)
    if not created:
        order_product.quantity += cantidad  # Incrementa la cantidad si ya existe
    else:
        order_product.quantity = cantidad  # Establece la cantidad inicial
    order_product.save()

    # Agrega un mensaje de éxito
    messages.success(request, f"{producto.nombre} se agregó al carrito.")
    return redirect('Carrito')

# --------------------------------------------------
# VISTA PARA LA GENERACION DE VALIDACION DE COMPRAS DESDE EL CARRITO
# --------------------------------------------

from django.core.mail import send_mail


@login_required
def finalizar_compra(request):
    order = Order.objects.filter(user=request.user, is_active=True).first()

    if not order or not order.orderproduct_set.exists():
        # Si el carrito está vacío, pasa un indicador al contexto
        return render(request, 'accounts/Carrito.html', {
            'order': order,
            'total': 0,
            'iva': 0,
            'total_con_iva': 0,
            'carrito_vacio': True  # Indicador para mostrar la alerta
        })

    total = order.get_total_price()
    iva = total * Decimal('0.19')
    total_con_iva = total + iva

    # Guardar el resumen de la compra
    compra = ResumenCompra.objects.create(
        cliente=request.user,
        total=total,
        iva=iva,
        total_con_iva=total_con_iva
    )
    
    for order_product in order.orderproduct_set.all():
        producto = order_product.product
        if order_product.quantity > producto.stock:
            messages.error(request, f"No hay suficiente stock para el producto '{producto.nombre}'.")
            return redirect('carrito')

    # Asociar los productos al resumen de compra y reducir el stock
    for order_product in order.orderproduct_set.all():
        compra.orderproduct_set.add(order_product)

        # Reducir el stock del producto
        producto = order_product.product
        producto.stock -= order_product.quantity
        producto.save()

    # Marcar la orden como inactiva
    order.is_active = False
    order.save()

    messages.success(request, "Compra finalizada con éxito.")
    # Redirigir a la vista detalle_compra con el ID de la compra
    return redirect('detalle_compra', compra_id=compra.id)


@login_required(login_url="/accounts/login/")
def detalle_compra(request, compra_id):

    compra = get_object_or_404(ResumenCompra, id=compra_id)
    order_products = compra.orderproduct_set.all()  # Obtén los productos asociados
    return render(request, 'accounts/detalle_compra.html', {'compra': compra, 'order_products': order_products})

@login_required
def generar_pdf(request, compra_id):
    compra = get_object_or_404(ResumenCompra, id=compra_id)
    template = get_template('accounts/pdf_resumen.html')
    context = {'compra': compra, 'orderproduct_set': compra.orderproduct_set.all()}  # Pass orderproduct_set to the context
    html = template.render(context)
    response = HttpResponse(content_type='application/pdf')
    response['Content-Disposition'] = f'attachment; filename="resumen_compra_{compra.id}.pdf"'
    pisa_status = pisa.CreatePDF(html, dest=response)
    if pisa_status.err:
        return HttpResponse('Error al generar el PDF', status=500)
    return response

def validacion_compras(request):
    compras = ResumenCompra.objects.all()
    return render(request, 'accounts/validacion_compras.html', {'compras': compras})
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt

# @csrf_exempt
@login_required
def marcar_pagada(request, compra_id):
    compra = get_object_or_404(ResumenCompra, id=compra_id)
    compra.pagada = True
    compra.save()
    return JsonResponse({'success': True, 'message': 'La compra se marcó como pagada.'})

# @csrf_exempt
@login_required
def marcar_no_pagada(request, compra_id):
    compra = get_object_or_404(ResumenCompra, id=compra_id)
    compra.pagada = False
    compra.save()
    return JsonResponse({'success': True, 'message': 'La compra se marcó como no pagada.'})

# ---------------------------------
# VISTA PARA LA RECUPERACION DE CONTRASEÑA
# ---------------------------------

def recu_contra(request):
    if request.method == 'POST':
        email = request.POST.get('email')
        
        try:
            user = CustomUser.objects.get(email=email)
        except CustomUser.DoesNotExist:
            messages.error(request, "El correo ingresado no está registrado.")
            return render(request, 'accounts/recuperar_contraseña.html')
        
        recovery_email = user.email

        signer = TimestampSigner()
        token = signer.sign(str(user.pk))
        
        reset_url = request.build_absolute_uri(reverse('cambia_con', args=[token]))
        
        html_message = render_to_string('accounts/msg_correo.html', {
            'username': user.username,  
            'reset_url': reset_url,       
            'site_name': 'MERCAPP',
        })
        
        subject = "Recuperación de contraseña"
        text_message = strip_tags(html_message)
        
        try:
            email = EmailMultiAlternatives(
                subject=subject,                      
                body=text_message,                     
                from_email=settings.DEFAULT_FROM_EMAIL, 
                to=[recovery_email]                     
            )
            email.encoding = 'utf-8'
            email.send()
            messages.success(request, "Este enlace tiene una duracion de 1h.")
            return redirect("login")
        except Exception as e:
            messages.error(request, f"Error al enviar el correo: {str(e)}")
            return render(request, 'accounts/recuperar_contraseña.html')
        
    return render(request, 'accounts/recuperar_contraseña.html')

def cambia_con(request, token):
    signer = TimestampSigner()
    try:
        user_id = signer.unsign(token, max_age=3600)
        usuario = get_object_or_404(CustomUser, pk=user_id)
    except (BadSignature, SignatureExpired):
        messages.error(request, "El enlace de recuperación es inválido o ha expirado.")
        return redirect("recuperar_contraseña")
    
    if request.method == 'POST':
        new_password = request.POST.get('new_password')
        confirm_password = request.POST.get('confirm_password')
        
        if not new_password or not confirm_password:
            messages.error(request, "Todos los campos son obligatorios.")
            return render(request, 'accounts/cambia_contraseña.html')

        if new_password != confirm_password:
            messages.error(request, "Las contraseñas no coinciden.")
            return render(request, 'accounts/cambia_contraseña.html')

        try:
            validate_password(new_password, usuario)  # Valida la contraseña
        except ValidationError as e:
            messages.error(request, e.messages[0])  # Muestra el primer error
            return render(request, 'accounts/cambia_contraseña.html')

        usuario.password = make_password(new_password)
        usuario.save()
        
        messages.success(request, "La contraseña se ha cambiado correctamente.")
        return redirect("login")
    
    return render(request, 'accounts/cambia_contraseña.html')


# Ruta donde se almacenarán las copias de seguridad
BACKUP_DIR = os.path.join(settings.BASE_DIR, 'backups')

@verificar_rol_requerido('admin')
@admin_required(login_url="/accounts/login/")
def crear_copia_seguridad(request):
    if request.method == 'POST':
        if not os.path.exists(BACKUP_DIR):
            os.makedirs(BACKUP_DIR)
        backup_name = f"backup_{datetime.now().strftime('%Y%m%d_%H%M%S')}.sql"
        backup_path = os.path.join(BACKUP_DIR, backup_name)

        # Ruta completa al ejecutable de mysqldump
        mysqldump_executable = r"C:\laragon\bin\mysql\mysql-8.0.30-winx64\bin\mysqldump.exe"

        # Comando para crear la copia de seguridad
        command = [
            mysqldump_executable,
            '-u', 'root',
            '--databases', 'mercapp'
        ]

        try:
            with open(backup_path, 'w') as output_file:
                result = subprocess.run(command, stdout=output_file, stderr=subprocess.PIPE, text=True)

            if result.returncode != 0:
                print(f"Error al crear la copia de seguridad: {result.stderr}")
                return HttpResponse(f"Error al crear la copia de seguridad: {result.stderr}", status=500)

            return redirect('copias_seguridad')
        except Exception as e:
            return HttpResponse(f"Error inesperado: {str(e)}", status=500)
        
@verificar_rol_requerido('admin')
@admin_required(login_url="/accounts/login/")
def listar_copias_seguridad(request):
    if not os.path.exists(BACKUP_DIR):
        os.makedirs(BACKUP_DIR)
    backups = [
        {'id': i, 'name': f, 'created_at': datetime.fromtimestamp(os.path.getctime(os.path.join(BACKUP_DIR, f))).strftime('%Y-%m-%d %H:%M:%S')}
        for i, f in enumerate(os.listdir(BACKUP_DIR))
    ]
    return render(request, 'accounts/Copias_seguidad.html', {'backups': backups})

def descargar_copia_seguridad(request, backup_id):
    try:
        backups = os.listdir(BACKUP_DIR)
        backup_file = backups[int(backup_id)]
        backup_path = os.path.join(BACKUP_DIR, backup_file)
        with open(backup_path, 'rb') as f:
            response = HttpResponse(f.read(), content_type='application/octet-stream')
            response['Content-Disposition'] = f'attachment; filename="{backup_file}"'
            return response
    except (IndexError, FileNotFoundError):
        raise Http404("Copia de seguridad no encontrada.")
    
@verificar_rol_requerido('admin')
@admin_required(login_url="/accounts/login/")
def eliminar_copia_seguridad(request, backup_id):
    try:
        backups = os.listdir(BACKUP_DIR)
        backup_file = backups[int(backup_id)]
        backup_path = os.path.join(BACKUP_DIR, backup_file)
        os.remove(backup_path)
        return redirect('copias_seguridad')
    except (IndexError, FileNotFoundError):
        raise Http404("Copia de seguridad no encontrada.")

import shutil


@admin_required(login_url="/accounts/login/")
def restaurar_copia_seguridad(request, backup_id):
    try:
        # Obtén la lista de archivos en la carpeta de backups
        backups = os.listdir(BACKUP_DIR)
        backup_file = backups[int(backup_id)]  # Usa el backup_id como índice
        full_path = os.path.join(BACKUP_DIR, backup_file)

        if not os.path.exists(full_path):
            messages.error(request, "❌ Archivo no encontrado en la carpeta de backups.")
            return redirect('copias_seguridad')

        if request.method == 'POST':
            # Localiza mysql.exe
            mysql_cmd = shutil.which('mysql') or settings.MYSQL_PATH
            if not mysql_cmd or not os.path.exists(mysql_cmd):
                messages.error(request, "❌ No se encontró mysql. Agrega su carpeta al PATH o define MYSQL_PATH en settings.py.")
                return redirect('copias_seguridad')

            # Configuración de la base de datos
            db = settings.DATABASES['default']
            cmd = [
                mysql_cmd,
                '-u', db['USER'],
                f"--password={db['PASSWORD']}",
                db['NAME']
            ]

            try:
                # Ejecuta el comando para restaurar la base de datos
                with open(full_path, 'rb') as inp:
                    result = subprocess.run(cmd, stdin=inp, stderr=subprocess.PIPE, text=True)

                if result.returncode != 0:
                    err = result.stderr
                    messages.error(request, f"❌ Error restaurando la base de datos: {err}")
                    return redirect('copias_seguridad')

                # Mensaje de éxito
                messages.success(request, "✅ Tu base de datos ha sido restaurada correctamente.")
                return redirect('copias_seguridad')

            except Exception as e:
                # Manejo de errores inesperados
                messages.error(request, f"❌ Error inesperado: {str(e)}")
                return redirect('copias_seguridad')

        # Si es una solicitud GET, muestra una página de confirmación
        return render(request, 'accounts/confirmar_restauracion.html', {'backup_id': backup_id, 'backup_file': backup_file})

    except (IndexError, FileNotFoundError):
        messages.error(request, "❌ Copia de seguridad no encontrada.")
        return redirect('copias_seguridad')
@verificar_rol_requerido('admin')
@admin_required(login_url="/accounts/login/")

def confirmar_restauracion(request, backup_id):
    try:
        # Obtén la lista de archivos en la carpeta de backups
        backups = os.listdir(BACKUP_DIR)
        backup_file = backups[int(backup_id)]  # Usa el backup_id como índice
        return render(request, 'accounts/confirmar_restauracion.html', {'backup_id': backup_id, 'backup_file': backup_file})
    except (IndexError, FileNotFoundError):
        messages.error(request, "❌ Copia de seguridad no encontrada.")
        return redirect('copias_seguridad')