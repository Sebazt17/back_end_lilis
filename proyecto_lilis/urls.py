from django.contrib import admin
from django.urls import path, include
from catalogo import views as catalogo_views  

urlpatterns = [
    path('admin/', admin.site.urls),
    path('accounts/', include('accounts_lilis.urls')),
    path('proveedores/', include('proveedores.urls')),
    path('mantenedores/', catalogo_views.mantenedores, name="mantenedores"),

    path('', include('catalogo.urls')),
]
