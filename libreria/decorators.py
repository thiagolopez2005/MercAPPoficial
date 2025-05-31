from functools import wraps
from django.shortcuts import redirect
from django.http import HttpResponseForbidden
from django.shortcuts import redirect
from django.contrib import messages

def admin_required(view_func=None, login_url=None, error_url=None):
    def decorator(view_func):
        @wraps(view_func)
        def _wrapped_view(request, *args, **kwargs):
            # Verifica si el usuario está autenticado
            if not request.user.is_authenticated:
                if login_url:
                    return redirect(login_url)
                return HttpResponseForbidden("No tienes permisos para acceder a esta página.")

            # Verifica si el usuario tiene el rol de administrador
            if request.user.role != 'admin':
                if error_url:
                    return redirect(error_url)
                return HttpResponseForbidden("No tienes permisos para acceder a esta página.")
            
            return view_func(request, *args, **kwargs)
        return _wrapped_view

    if view_func:
        return decorator(view_func)
    return decorator



def verificar_rol_requerido(role_requerido):
    def decorator(view_func):
        def _wrapped_view(request, *args, **kwargs):
            # Verifica si el usuario tiene el atributo 'role'
            if not hasattr(request.user, 'role') or request.user.role != role_requerido:
                messages.error(request, "❌ No tienes permisos para ingresar a esta sección.")
                return redirect('error_403')  # Redirige a una página de error personalizada
            return view_func(request, *args, **kwargs)
        return _wrapped_view
    return decorator



from functools import wraps
from django.http import JsonResponse
from .models import RegistroActividad

def registrar_actividad_json(accion, detalle_func):
    """
    Decorador para manejar JsonResponse y registrar actividad.
    :param accion: Acción a registrar en RegistroActividad.
    :param detalle_func: Función que genera el detalle dinámico para el registro.
    """
    def decorator(view_func):
        @wraps(view_func)
        def _wrapped_view(request, *args, **kwargs):
            try:
                # Ejecuta la vista decorada
                response = view_func(request, *args, **kwargs)

                # Si la respuesta es un JsonResponse con éxito, registra la actividad
                if isinstance(response, JsonResponse) and response.status_code == 200:
                    detalle = detalle_func(request, *args, **kwargs)
                    RegistroActividad.objects.create(
                        usuario=request.user,
                        accion=accion,
                        detalle=detalle
                    )
                return response
            except Exception as e:
                # Manejo de errores y respuesta JSON
                return JsonResponse({'success': False, 'error': str(e)}, status=500)
        return _wrapped_view
    return decorator

from functools import wraps
from django.contrib import messages
from django.shortcuts import redirect

def Rcontraseña(mensaje, redireccion_url):
    """
    Decorador para agregar un mensaje especial y redirigir a una URL específica.
    :param mensaje: Mensaje que se mostrará como alerta.
    :param redireccion_url: URL a la que se redirigirá después de mostrar el mensaje.
    """
    def decorator(view_func):
        @wraps(view_func)
        def _wrapped_view(request, *args, **kwargs):
            response = view_func(request, *args, **kwargs)
            if response.status_code == 200:  # Si la vista se ejecuta correctamente
                messages.success(request, mensaje)
                return redirect(redireccion_url)
            return response
        return _wrapped_view
    return decorator

from functools import wraps
from libreria.models import RegistroActividad, Producto

def registrar_agregado_carrito(view_func):
    @wraps(view_func)
    def _wrapped_view(request, producto_id, *args, **kwargs):
        response = view_func(request, producto_id, *args, **kwargs)
        # Solo registrar si la acción fue exitosa y el usuario está autenticado
        if request.user.is_authenticated and request.method == "POST" and response.status_code in (200, 302):
            try:
                producto = Producto.objects.get(id=producto_id)
                cantidad = request.POST.get('cantidad', 1)
                RegistroActividad.objects.create(
                    usuario=request.user,
                    accion="Agregado al carrito",
                    detalle=f"Agregó {cantidad} unidad(es) de '{producto.nombre}' al carrito."
                )
            except Exception as e:
                # Puedes loguear el error si lo deseas
                pass
        return response
    return _wrapped_view

from functools import wraps
from django.contrib import messages

def Base_datos(success_msg=None, error_msg=None):
    def decorator(view_func):
        @wraps(view_func)
        def _wrapped_view(request, *args, **kwargs):  # <-- acepta *args, **kwargs
            try:
                response = view_func(request, *args, **kwargs)
                if success_msg and getattr(response, 'status_code', 200) in (200, 302):
                    messages.success(request, success_msg)
                return response
            except Exception as e:
                if error_msg:
                    messages.error(request, f"{error_msg}: {str(e)}")
                raise
        return _wrapped_view
    return decorator