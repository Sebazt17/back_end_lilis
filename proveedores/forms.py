from django import forms
from django.core.exceptions import ValidationError
from .models import Proveedor, Region
from django.core.validators import URLValidator
import re


def validar_rut_nif(value):
    if len(value.strip()) < 8 or len(value.strip()) > 20:
        raise ValidationError("El RUT/NIF debe tener entre 8 y 20 caracteres.")

    if not re.match(r'^[0-9kK\.\-]+$', value):
        raise ValidationError("Formato inválido. Solo números, puntos y guiones.")


def validar_telefono(value):
    if not re.match(r'^\d+$', value):
        raise ValidationError("El teléfono solo debe contener números.")

    if len(value) < 9 or len(value) > 15:
        raise ValidationError("El teléfono debe tener entre 9 y 15 dígitos.")


def validar_nombre(value):
    if len(value.strip()) < 3:
        raise ValidationError("Debe tener mínimo 3 caracteres.")

    if len(value.strip()) > 255:
        raise ValidationError("Ha excedido el máximo permitido (255 caracteres).")


def validar_moneda(value):
    if len(value) != 3:
        raise ValidationError("Debe tener exactamente 3 letras (ej: CLP, USD).")

    if not value.isalpha():
        raise ValidationError("Solo debe contener letras (ej: CLP).")



class ProveedorForm(forms.ModelForm):
    pais = forms.CharField(
        required=False,
        initial="Chile",
        disabled=True,
        widget=forms.TextInput(attrs={"class": "form-control"})
    )

    rut_nif = forms.CharField(
        required=True,
        validators=[validar_rut_nif],
        widget=forms.TextInput(attrs={
            "class": "form-control",
            "placeholder": "Ej: 11.111.111-1"
        })
    )

    razon_social = forms.CharField(
        required=True,
        validators=[validar_nombre],
        widget=forms.TextInput(attrs={
            "class": "form-control",
            "placeholder": "Razón social completa"
        })
    )

    nombre_fantasia = forms.CharField(
        required=False,
        validators=[validar_nombre],
        widget=forms.TextInput(attrs={
            "class": "form-control",
            "placeholder": "Opcional"
        })
    )

    email = forms.EmailField(
        required=True,
        widget=forms.EmailInput(attrs={
            "class": "form-control",
            "placeholder": "correo@empresa.cl"
        })
    )

    telefono = forms.CharField(
        required=False,
        validators=[validar_telefono],
        widget=forms.TextInput(attrs={
            "class": "form-control",
            "placeholder": "Sólo números"
        })
    )

    sitio_web = forms.CharField(
        required=False,
        widget=forms.TextInput(attrs={
            "class": "form-control",
            "placeholder": "https://www.ejemplo.cl"
        })
    )

    direccion = forms.CharField(
        required=False,
        widget=forms.TextInput(attrs={
            "class": "form-control",
            "placeholder": "Calle 123, Oficina 45"
        })
    )

    ciudad = forms.CharField(
        required=False,
        widget=forms.TextInput(attrs={
            "class": "form-control",
            "placeholder": "La Serena"
        })
    )

    condiciones_pago = forms.CharField(
        required=True,
        widget=forms.TextInput(attrs={
            "class": "form-control",
            "placeholder": "Contado / Crédito / 30 días"
        })
    )

    moneda = forms.CharField(
        required=True,
        validators=[validar_moneda],
        widget=forms.TextInput(attrs={
            "class": "form-control",
            "placeholder": "CLP / USD"
        })
    )

    observaciones = forms.CharField(
        required=False,
        widget=forms.Textarea(attrs={
            "class": "form-control",
            "rows": 3,
            "placeholder": "Comentarios (opcional)"
        })
    )

    class Meta:
        model = Proveedor
        fields = [
            "rut_nif", "razon_social", "nombre_fantasia",
            "email", "telefono", "sitio_web",
            "direccion", "ciudad", "region",
            "condiciones_pago", "moneda",
            "contacto_principal_nombre", "contacto_principal_email",
            "contacto_principal_telefono",
            "estado", "observaciones"
        ]

        widgets = {
            "region": forms.Select(attrs={"class": "form-select"}),
            "contacto_principal_nombre": forms.TextInput(attrs={"class": "form-control"}),
            "contacto_principal_email": forms.EmailInput(attrs={"class": "form-control"}),
            "contacto_principal_telefono": forms.TextInput(attrs={"class": "form-control"}),
            "estado": forms.Select(attrs={"class": "form-select"}),
        }


    def clean_email(self):
        email = self.cleaned_data.get("email")

        qs = Proveedor.objects.filter(email=email)
        if self.instance.pk:
            qs = qs.exclude(pk=self.instance.pk)

        if qs.exists():
            raise ValidationError("Ya existe un proveedor registrado con este correo.")

        return email

    def clean_sitio_web(self):
        sitio = self.cleaned_data.get("sitio_web")
        if sitio:
            validate_url = URLValidator()
            try:
                validate_url(sitio)
            except:
                raise ValidationError("Debe ingresar una URL válida.")
        return sitio

    def clean_rut_nif(self):
        rut = self.cleaned_data.get("rut_nif")

        qs = Proveedor.objects.filter(rut_nif=rut)
        if self.instance.pk:
            qs = qs.exclude(pk=self.instance.pk)

        if qs.exists():
            raise ValidationError("Ya existe un proveedor con este RUT/NIF.")

        return rut