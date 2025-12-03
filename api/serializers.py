from rest_framework import serializers
from catalogo.models import Producto, Categoria
from inventario.models import MovimientoInventario

# --- Serializador de Ayuda (para que se vea el nombre de la categoría y no solo el número) ---
class CategoriaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Categoria
        fields = ['id', 'nombre']

# --- Serializador Principal: PRODUCTO ---
class ProductoSerializer(serializers.ModelSerializer):
    # Campo extra para leer el nombre de la categoría fácilmente
    categoria_nombre = serializers.ReadOnlyField(source='categoria.nombre')

    class Meta:
        model = Producto
        fields = '__all__'
        # Esto traerá todos los campos: sku, nombre, precio_venta, stock_minimo, etc.

# --- Serializador de Transacción: MOVIMIENTO DE INVENTARIO ---
class MovimientoSerializer(serializers.ModelSerializer):
    # Campos extra para lectura (nombres en vez de IDs)
    producto_nombre = serializers.ReadOnlyField(source='producto.nombre')
    usuario_nombre = serializers.ReadOnlyField(source='usuario.username')
    
    class Meta:
        model = MovimientoInventario
        fields = '__all__'
        # El usuario no se pide al crear, se pone automático en la vista
        read_only_fields = ('usuario', 'creado_en')