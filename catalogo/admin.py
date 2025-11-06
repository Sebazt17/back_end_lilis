from django.contrib import admin
from catalogo.models import Categoria, Producto


@admin.register(Categoria)
class CategoriaAdmin(admin.ModelAdmin):
    list_display = ['id', 'nombre']
    search_fields = ['nombre']
    ordering = ['nombre']


@admin.register(Producto)
class ProductoAdmin(admin.ModelAdmin):
    list_display = [
        'id',
        'sku',
        'nombre',
        'categoria',
        'precio_venta',
        'stock_minimo',
        'control_por_lote',
        'perishable'
    ]
    list_filter = ['categoria', 'perishable', 'control_por_lote']
    search_fields = ['nombre', 'sku', 'descripcion']
    ordering = ['nombre']
