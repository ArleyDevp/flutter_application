# Taller Flutter: Login y Registro

Aplicación móvil de ejemplo con un flujo interactivo de autenticación simulado
en memoria, sin conexión a un backend.

## Requisitos

- Flutter 3.47.2
- Dart 3.13.2

La versión mínima de Dart también está indicada en `pubspec.yaml`.

## Ejecutar

Desde la carpeta del proyecto:

```bash
flutter pub get
flutter run
```

## Flujo incluido

- Inicio de sesión y registro con validación de correo y campos obligatorios.
- Recuperación de contraseña, verificación de código y creación de contraseña
  nueva.
- Contraseñas con control para mostrar u ocultar y validación de requisitos.
- Correo compartido entre pantallas y mostrado en Home.
- Acciones de Google y Apple simuladas con un mensaje de funcionalidad no
  disponible.

Los datos del usuario se mantienen durante la ejecución usando `AppData`; no se
guardan de forma permanente.
