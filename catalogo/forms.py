from django import forms
from django.core.exceptions import ValidationError
from .models import Categoria, Producto
import re

# Validators
def solo_numeros(value):
    if not re.match(r'^\d+$', value):
        raise ValidationError('Este campo solo puede contener números.')

class CategoriaForm(forms.ModelForm):
    nombre = forms.CharField(
        max_length=50,
        required=True,
        widget=forms.TextInput(attrs={
            'class': 'form-control',
            'placeholder': 'Ingrese nombre de la categoría'
        })
    )

    class Meta:
        model = Categoria
        fields = ['nombre']

    def clean_nombre(self):
        nombre = self.cleaned_data.get('nombre', '').strip()
        if not nombre:
            raise ValidationError('El nombre de la categoría es obligatorio.')
        if len(nombre) < 3:
            raise ValidationError('El nombre de la categoría debe tener al menos 3 caracteres.')
        return nombre

class ProductoForm(forms.ModelForm):
    nombre = forms.CharField(
        max_length=100,
        required=True,
        widget=forms.TextInput(attrs={
            'class': 'form-control',
            'placeholder': 'Ingrese nombre del producto'
        })
    )
    ingredientes = forms.CharField(
        required=True,
        widget=forms.Textarea(attrs={
            'class': 'form-control',
            'rows': 3,
            'placeholder': 'Ingrese los ingredientes del producto'
        })
    )
    tiempo_produccion = forms.CharField(
        required=True,
        widget=forms.TextInput(attrs={
            'class': 'form-control',
            'placeholder': 'Ej: 120 minutos'
        })
    )
    descripcion = forms.CharField(
        required=True,
        widget=forms.Textarea(attrs={
            'class': 'form-control',
            'rows': 3,
            'placeholder': 'Ingrese descripción del producto'
        })
    )
    imagen = forms.CharField(
        required=False,
        widget=forms.TextInput(attrs={
            'class': 'form-control',
            'placeholder': 'Nombre de archivo o URL de la imagen'
        })
    )
    categoria = forms.ModelChoiceField(
        queryset=Categoria.objects.all(),
        required=True,
        widget=forms.Select(attrs={'class': 'form-select'})
    )

    class Meta:
        model = Producto
        fields = ['nombre', 'ingredientes', 'tiempo_produccion', 'descripcion', 'imagen', 'categoria']

    def clean_nombre(self):
        nombre = self.cleaned_data.get('nombre', '').strip()
        if len(nombre) < 3:
            raise ValidationError('El nombre debe tener al menos 3 caracteres.')
        return nombre

    def clean_tiempo_produccion(self):
        tiempo = self.cleaned_data.get('tiempo_produccion', '').strip()
        # Permitimos formato "número + espacio + unidad" (ej: "2 horas" o "120 min")
        if not re.match(r'^\d+\s?(horas|hora|minutos|min)?$', tiempo):
            raise ValidationError('Formato inválido. Ej: "2 horas" o "120 min".')
        return tiempo
