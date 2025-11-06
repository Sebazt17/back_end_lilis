from django.urls import path
from django.contrib.auth import views as auth_views
from . import views

urlpatterns = [
    path('', views.landing, name='landing'),               
    path('catalogo/', views.catalogo, name='catalogo'),
    path('subcatalogo/<str:categoria>/', views.subcatalogo, name='subcatalogo'),
    path('logout/', auth_views.LogoutView.as_view(), name='logout'),
    path('detalle/<str:producto>/', views.detalle_producto, name='detalle_producto'),

    path('mantenedores/', views.mantenedores, name='mantenedores'),
    path('mantenedor_agregar_producto/', views.MantenedorAgregarProducto, name='mantenedor_agregar_producto'),
    path('crear_producto/', views.crear_producto, name='crear_producto'),
    path('mostrar_todos_productos/', views.mostrar_todos_productos, name='mostrar_todos_productos'),
    path('productos/editar/<int:id>/', views.editar_producto, name='editar_producto'),
    path('productos/eliminar/<int:id>/', views.eliminar_producto, name='eliminar_producto'),
]
