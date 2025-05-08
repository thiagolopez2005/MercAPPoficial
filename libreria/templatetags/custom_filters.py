from django import template

register = template.Library()

@register.filter
def get_user_name(usuario):
    if usuario:
        return usuario.get_full_name() or usuario.nombre
    return "Sistema"