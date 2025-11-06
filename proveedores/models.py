from django.db import models
from django.utils import timezone

class Region(models.Model):
    nombre = models.CharField(max_length=50, verbose_name='Nombre Región')
    codigo = models.CharField(max_length=5, unique=True, verbose_name='Código Región')

    def __str__(self):
        return self.nombre

    class Meta:
        db_table = 'region'
        verbose_name = 'Región'
        verbose_name_plural = 'Regiones'
        ordering = ['nombre']


class Proveedor(models.Model):
    rut_nif = models.CharField(max_length=20, unique=True, verbose_name='RUT / NIF')
    razon_social = models.CharField(max_length=255, verbose_name='Razón Social')
    nombre_fantasia = models.CharField(max_length=255, blank=True, null=True, verbose_name='Nombre Fantasía')

    email = models.EmailField(verbose_name='Correo Electrónico')
    telefono = models.CharField(max_length=30, blank=True, null=True)
    sitio_web = models.CharField(max_length=255, blank=True, null=True)

    direccion = models.CharField(max_length=255, blank=True, null=True)
    ciudad = models.CharField(max_length=128, blank=True, null=True)
    pais = models.CharField(max_length=64, default='Chile',editable=False)

    condiciones_pago = models.CharField(max_length=50, default='Contado', verbose_name='Condiciones de Pago')
    moneda = models.CharField(max_length=8, default='CLP')
    contacto_principal_nombre = models.CharField(max_length=120, blank=True, null=True)
    contacto_principal_email = models.EmailField(blank=True, null=True)
    contacto_principal_telefono = models.CharField(max_length=30, blank=True, null=True)
    estado = models.CharField(max_length=10, choices=[('ACTIVO', 'Activo'), ('BLOQUEADO', 'Bloqueado')], default='ACTIVO')
    observaciones = models.TextField(blank=True, null=True)
    fecha_registro = models.DateTimeField(default=timezone.now)

    region = models.ForeignKey(Region, on_delete=models.SET_NULL, null=True, related_name='proveedores')

    def __str__(self):
        return f"{self.razon_social} ({self.rut_nif})"

    class Meta:
        db_table = 'proveedor'
        verbose_name = 'Proveedor'
        verbose_name_plural = 'Proveedores'
        ordering = ['razon_social']


class ProveedorProducto(models.Model):
    proveedor = models.ForeignKey(Proveedor, on_delete=models.CASCADE)
    producto = models.ForeignKey('catalogo.Producto', on_delete=models.CASCADE)
    costo = models.DecimalField(max_digits=18, decimal_places=6)
    lead_time_dias = models.PositiveIntegerField(default=7)
    min_lote = models.DecimalField(max_digits=18, decimal_places=6, default=1)
    descuento_pct = models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True)
    preferente = models.BooleanField(default=False)

    def __str__(self):
        return f"{self.proveedor.razon_social} → {self.producto.nombre}"

    class Meta:
        db_table = 'proveedor_producto'
        verbose_name = 'Producto por Proveedor'
        verbose_name_plural = 'Productos por Proveedor'
        unique_together = ('proveedor', 'producto')
