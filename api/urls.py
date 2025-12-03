from django.urls import path, include
from rest_framework.routers import DefaultRouter
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
)
from .views import ProductoViewSet, MovimientoViewSet

# El Router crea automáticamente las URLs como: /productos/ y /productos/5/
router = DefaultRouter()
router.register(r'productos', ProductoViewSet)
router.register(r'movimientos', MovimientoViewSet)

urlpatterns = [
    # Rutas automáticas de los ViewSets
    path('', include(router.urls)),
    
    # Rutas OBLIGATORIAS para la autenticación JWT (Según Pauta)
    path('token/', TokenObtainPairView.as_view(), name='token_obtain_pair'), # Para hacer Login
    path('token/refresh/', TokenRefreshView.as_view(), name='token_refresh'), # Para refrescar sesión
]