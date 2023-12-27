# app_credibanco_login

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
sampls, guidance on mobile development, and a full API reference.


historias de Usuario.

----------------------------------------H--E--C--H--A--S---------------------------------------------

BM-1601 => Creacion de login / DAVID (Refactor colors = jesus) (falta validacion)
BM-1602 => Creacion de Register / JESUS (falta validacion)
BM-1603 => Creacion de Editar Usuario / JESUS (falta validacion)
BM-1604 => ENVIO DE CORREO / JESUS (falta validacion)
BM-1605 => ESCRIBIR UTP / DAVID (falta validacion)
BM 1607 => mostrar datos del usuario / DAVID (falta validacion)
BM 1610 => Cambio de contraseña (falta validacion)
BM 1613 => integracion de imagenes
BM 1614 => integracion de nuevos input (REGISTER/EDITAR)
BM-1611=> validaciones en formularios.
BM-1615=> Creacion de pop-ups.
BM 1612 => drop bar.
BM-1616=> Optimizar los botones.
BM 1617 => widget Bolsillo y pantalla de Bolsillos.
BM 1618 => Redisenio de vistas de pantallas 
BM 1621 => Consumo del Rest de users
--------------------------------------POR--HACER--------------------------------------------

BM 1608 => Menu lateral
BM 1609 => Opcion de envio de otp







------------------------------En--- P--R--O..D--U--C--C--I--O--N-----------------------------

BM 1606 => Pagina de aterrisaje
BM 1620 => Pagina de Movimientos
BM 1619 => Pantalla de editar y crear bolsillos.
BM-1621-sub => Agregar imagen del dispositivo y motrarla en el avatar



-------------------------------------- VALIDACIONES A TENER EN CUENTA --------------------------------------------
1) Correo: validar que tenga el arroba y dependiendo de la nacionalidad puede finalizar como .com, .co, .edu.co, entre otros.
    Y hacer que se valide si el correo existe o no (CONSUMIR API).
2) Contraseña: validar que la contraseña tiene que tener como minimo un caracter especial, valores númericos, una letra en mayuscula y en minuscula,

3) Nombre y Apellido: validar que tenga permitido escribir solo letras (no numeros y no caracteres especiales ni espacios).
4) Telefono: validar que se pueda escribir valores númericos y un limite de 10 digitos.

5) Contraseña y Confirmar Contraseña: va hacer lo mismo que la validacion de Contraseña, solo que hay que crear una validacion para poder comparar si son iguales (hacer solo la comparacion).

6) OTP: Validar si el codigo de 6 digitos es invalido o codigo expirado.