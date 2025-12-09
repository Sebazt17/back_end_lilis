from django.contrib import admin
from django.urls import path, include
from catalogo import views as catalogo_views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    path('accounts/', include('accounts_lilis.urls')),
    path('proveedores/', include('proveedores.urls')),
    path('mantenedores/', catalogo_views.mantenedores, name="mantenedores"),
    path('inventario/', include(('inventario.urls', 'inventario'), namespace='inventario')),

    # --- NUEVA RUTA API (EVA 4) ---
    # Esto habilita: /api/productos, /api/token, etc.
    path('api/', include('api.urls')),

    # --- RUTA PARA LOGIN EN NAVEGADOR (DRF) ---
    # Esto agrega el botón de "Log in" en la esquina de la API visual
    path('api-auth/', include('rest_framework.urls')),

    path('', include('catalogo.urls')),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)