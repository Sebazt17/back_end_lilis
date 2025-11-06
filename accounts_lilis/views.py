from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from django.contrib.auth import login as auth_login, authenticate
from django.views import View
from django.http import JsonResponse
from django.contrib.auth.decorators import login_required, user_passes_test
from .models import Usuario
from .forms import RegisterForm, UsuarioAdminForm


class RegisterView(View):
    template_name = "accounts_lilis/register.html"

    def get(self, request):
        form = RegisterForm()
        return render(request, self.template_name, {"form": form})

    def post(self, request):
        form = RegisterForm(request.POST)
        if form.is_valid():
            user = form.save()
            messages.success(request, "✅ Registro exitoso. ¡Bienvenido/a!")
            auth_login(request, user)
            return redirect("landing")
        messages.error(request, "❌ Revisa los errores del formulario.")
        return render(request, self.template_name, {"form": form})


def permiso_admin(user):
    return user.is_authenticated and user.rol == "ADMIN"


@login_required
@user_passes_test(permiso_admin)
def usuario_listar(request):
    usuarios = Usuario.objects.all().order_by("id")
    return render(request, "mantenedores/usuarios/usuarios_listar.html", {"usuarios": usuarios})


@login_required
@user_passes_test(permiso_admin)
def usuario_agregar(request):
    form = UsuarioAdminForm(request.POST or None)
    if request.method == "POST":
        if form.is_valid():
            form.save()
            messages.success(request, "✅ Usuario creado correctamente.")
            return redirect("accounts_lilis:usuario_listar")
        messages.error(request, "❌ Revisa los errores del formulario.")
    return render(request, "mantenedores/usuarios/usuarios_agregar.html", {"form": form})


@login_required
@user_passes_test(permiso_admin)
def usuario_editar(request, id):
    usuario = get_object_or_404(Usuario, id=id)
    form = UsuarioAdminForm(request.POST or None, instance=usuario)

    form.fields.pop("password1")
    form.fields.pop("password2")

    if usuario.username == "admin_principal":
        form.fields["rol"].disabled = True
        form.fields["estado"].disabled = True

    if request.method == "POST" and form.is_valid():

        if usuario.username == "admin_principal":
            usuario.first_name = form.cleaned_data["first_name"]
            usuario.last_name = form.cleaned_data["last_name"]
            usuario.email = form.cleaned_data["email"]
            usuario.save()
        else:
            form.save()

        messages.success(request, "✅ Usuario modificado correctamente.")
        return redirect("accounts_lilis:usuario_listar")

    return render(request, "mantenedores/usuarios/usuarios_editar.html", {
        "form": form,
        "usuario": usuario
    })



@login_required
@user_passes_test(permiso_admin)
def usuario_eliminar(request, id):
    usuario = get_object_or_404(Usuario, id=id)

    if usuario.username == "admin_principal":
        messages.error(request, "🚫 No puedes eliminar al administrador principal.")
        return redirect("accounts_lilis:usuario_listar")

    usuario.delete()
    messages.success(request, "✅ Usuario eliminado.")
    return redirect("accounts_lilis:usuario_listar")


def login_personalizado(request):
    if request.method == "POST":
        username = request.POST.get("username")
        password = request.POST.get("password")
        user = authenticate(request, username=username, password=password)
        if user is not None:
            auth_login(request, user)
            messages.success(request, f"✅ Bienvenido {user.username}!")
            if user.rol == "ADMIN":
                return redirect("mantenedores")
            return redirect("landing")
        messages.error(request, "❌ Usuario o contraseña incorrectos")
    return render(request, "accounts_lilis/login.html")


def check_email(request):
    email = request.GET.get("email")
    exists = Usuario.objects.filter(email=email).exists()
    return JsonResponse({"exists": exists})
