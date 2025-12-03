from rest_framework import permissions

class EsAdministrador(permissions.BasePermission):
    """
    Permiso total: Solo para ADMIN o Superusuarios.
    """
    def has_permission(self, request, view):
        return bool(
            request.user and 
            request.user.is_authenticated and 
            (request.user.is_superuser or request.user.rol == 'ADMIN')
        )

class EsOperadorInventario(permissions.BasePermission):
    """
    Equivalente al rol 'Doctor' de la pauta.
    - Puede VER (GET)
    - Puede CREAR (POST)
    - Puede EDITAR (PUT/PATCH)
    - NO PUEDE ELIMINAR (DELETE) - Eso es solo para Admin.
    """
    def has_permission(self, request, view):
        if not request.user.is_authenticated:
            return False

        # El ADMIN siempre tiene pase libre
        if request.user.rol == 'ADMIN' or request.user.is_superuser:
            return True
            
        # Roles operativos que pueden "hacer cosas" (según tu permisos.py)
        roles_permitidos = ['OPER_INVENTARIO', 'OPER_COMPRAS', 'OPER_VENTAS']

        if request.user.rol in roles_permitidos:
            # Si intenta BORRAR, le decimos que NO (Falso)
            if view.action == 'destroy':
                return False
            # Para todo lo demás (Crear, Editar, Ver), le decimos SÍ
            return True
            
        return False

class EsAuditor(permissions.BasePermission):
    """
    Equivalente al rol 'Enfermera' de la pauta.
    - Solo permite métodos seguros (GET, HEAD, OPTIONS).
    """
    def has_permission(self, request, view):
        if not request.user.is_authenticated:
            return False
            
        # El ADMIN siempre pasa
        if request.user.rol == 'ADMIN' or request.user.is_superuser:
            return True

        # Si el método es seguro (solo lectura)
        if request.method in permissions.SAFE_METHODS:
            # Permitimos entrar a los que solo pueden mirar
            roles_visualizadores = ['AUDITOR', 'ANALISTA_FIN', 'OPER_PRODUCCION']
            return request.user.rol in roles_visualizadores
            
        return False