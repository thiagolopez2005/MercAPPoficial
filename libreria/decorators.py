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