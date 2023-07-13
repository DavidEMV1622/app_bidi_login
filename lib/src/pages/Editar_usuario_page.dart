import 'package:flutter/material.dart';
import '../assets/fuentesText/fuentes.dart';
import '../assets/input.dart';
import '../assets/titulo.dart';
import '../colors/colors.dart';

class UpdateUserPage extends StatefulWidget {
  const UpdateUserPage({super.key});
  @override
  State<UpdateUserPage> createState() => _UpdateUserPageState();
}

class _UpdateUserPageState extends State<UpdateUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra principal de navegación "AppBar"
      appBar: AppBar(
        backgroundColor: CustomColors
            .colorBlanco, // Color del AppBar por medio de la clase "CustomColors"
      ),

      // ---- Cuerpo o contenido de la aplicación "body" ----
      body: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 40.0,
          ),
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                tituloEncabezadoUno("Editar Usuario"),
                inputText("Nombre:"),
                inputText("Apellido:"),
                inputText("Correo:"),
                inputText("Telefono:"),
                inputText("Contraseña:"),
                inputText("Confirmar contraseña:"),
              ],
            )
          ]),
    );
  }
}
