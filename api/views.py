from rest_framework import viewsets
from rest_framework.permissions import IsAuthenticated
from catalogo.models import Producto
from inventario.models import MovimientoInventario
from .serializers import ProductoSerializer, MovimientoSerializer

# --- IMPORTANTE: Aquí importamos las reglas que creamos ---
from .permissions import EsAdministrador, EsOperadorInventario, EsAuditor

class ProductoViewSet(viewsets.ModelViewSet):
    queryset = Producto.objects.all()
    serializer_class = ProductoSerializer
    
    # --- AQUÍ ESTÁ LA CLAVE ---
    # Si esta línea solo dice [IsAuthenticated], cualquiera puede borrar.
    # Al agregar EsOperadorInventario, activamos la prohibición de borrar.
    permission_classes = [IsAuthenticated, EsOperadorInventario] 

class MovimientoViewSet(viewsets.ModelViewSet):
    queryset = MovimientoInventario.objects.all()
    serializer_class = MovimientoSerializer
    
    # Reglas para la transacción
    permission_classes = [IsAuthenticated, EsOperadorInventario]

    def perform_create(self, serializer):
        serializer.save(usuario=self.request.user)