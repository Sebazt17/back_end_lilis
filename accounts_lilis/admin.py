from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import Usuario


@admin.register(Usuario)
class UsuarioAdmin(UserAdmin):

    list_display = [
        "username",
        "email",
        "first_name",     
        "last_name",      
        "rol",
        "estado",
        "area",
        "ultimo_acceso",
    ]

    list_filter = ["rol", "estado", "area", "mfa_habilitado"]
    search_fields = ["username", "email", "first_name", "last_name"]
    ordering = ["username"]

    fieldsets = (
        (None, {"fields": ("username", "password")}),
        ("Información Personal", {
            "fields": ("first_name", "last_name", "email", "telefono"),
        }),
        ("Estado y Acceso", {
            "fields": ("rol", "estado", "mfa_habilitado", "area"),
        }),
        ("Permisos", {
            "fields": (
                "is_active",
                "is_staff",
                "is_superuser",
                "groups",
                "user_permissions",
            )
        }),
        ("Fechas importantes", {
            "fields": ("last_login", "date_joined", "ultimo_acceso"),
        }),
        ("Observaciones", {"fields": ("observaciones",)}),
    )

    add_fieldsets = (
        (None, {
            "classes": ("wide",),
            "fields": (
                "username",
                "email",
                "first_name",      
                "last_name",       
                "password1",
                "password2",
                "rol",
                "estado",
                "area",
            ),
        }),
    )
