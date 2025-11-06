from django.contrib import admin
from proveedores.models import Region, Proveedor, ProveedorProducto


@admin.register(Region)
class RegionAdmin(admin.ModelAdmin):
    list_display = ['id', 'nombre', 'codigo']
    search_fields = ['nombre', 'codigo']
    ordering = ['nombre']


@admin.register(Proveedor)
class ProveedorAdmin(admin.ModelAdmin):
    list_display = [
        'id',
        'razon_social',
        'rut_nif',
        'nombre_fantasia',
        'email',
        'telefono',
        'region',
        'estado',
        'fecha_registro'
    ]
    list_filter = ['estado', 'region', 'pais']
    search_fields = ['razon_social', 'rut_nif', 'nombre_fantasia', 'email']
    ordering = ['razon_social']



@admin.register(ProveedorProducto)
class ProveedorProductoAdmin(admin.ModelAdmin):
    list_display = [
        'id',
        'proveedor',
        'producto',
        'costo',
        'lead_time_dias',
        'preferente'
    ]
    list_filter = ['proveedor', 'preferente']
    search_fields = ['proveedor__razon_social', 'producto__nombre']
    ordering = ['proveedor']
