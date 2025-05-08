# libreria/utils.py
from django.contrib.auth.models import User
from .models import RegistroActividad

def registrar_actividad_signal(usuario: User = None, accion: str = "", detalle: str = ""):
    """Registra una actividad en el log desde una señal."""
    RegistroActividad.objects.create(usuario=usuario, accion=accion, detalle=detalle)