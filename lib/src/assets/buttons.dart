import 'package:flutter/material.dart';
import '../colors/colors.dart';
import '../pages/Password_page.dart';
import '../pages/Registrar_page.dart';

// ---- Widget para el boton de inicio de sesion ----

class BtnPrimaery extends StatelessWidget {
  //CREACION DE PARAMETROS / VARIABLES
  final String textButton;
  final Color colorBox;
  final BoxBorder? border;
  final void Function()? onPressed;
  const BtnPrimaery(
      {super.key,
      required this.textButton,
      required this.colorBox,
      this.border,
      this.onPressed});

  //IMPLEMENTACION DE VARIABLES
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorBox, // Color del input
        border: border,
        borderRadius: BorderRadius.circular(10),
      ),
      child: MaterialButton(
        minWidth: double.infinity, // Ancho del boton
        height: 60, // Largo del botoncircular(10.0)

        onPressed: onPressed, // Animación al presionar

        //color: Color.fromRGBO(255, 182, 0,
        //  1), // Color del boton por medio de la clase "CustomColors"

        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),

        // Agregar texto dentro del boton
        child: Text(
          textButton,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class BotonLink extends StatelessWidget {
  //CREACION DE PARAMETROS / VARIABLES
  final String textoLink;
  final void Function()? onPressed;
  const BotonLink({super.key, required this.textoLink, this.onPressed});

  //IMPLEMENTACION DE VARIABLES
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              Colors.transparent) // Define el fondo transparente
          ),
      child: Text(
        textoLink, // Agrega el texto,
        style: TextStyle(
          color: Colors.transparent, // Color del texto
          fontSize: 12,

          shadows: [
            const Shadow(
                offset: Offset(0, -2), color: CustomColors.colorVerdePantano)
          ], // Tamaño del texto

          decoration: TextDecoration.underline,
          decorationStyle: TextDecorationStyle.solid,
          decorationColor: CustomColors.colorVerdePantano,
          decorationThickness: 1,
        ),
      ),
    );
  }
}

// ---- Widget para un boton transparente para los links ----
 /* Widget buttonLink(String textoLink, context) {
    return TextButton(
      onPressed: () {
        
        // Condición para manejar los cambios de pantalla
        if (textoLink == "Olvide mi contraseña") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PasswordPage()),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RegisterPage()),
          );
        }
        
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PasswordPage()),
        );
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              Colors.transparent) // Define el fondo transparente
          ),
      child: Text(
        textoLink, // Agrega el texto
        style: TextStyle(
          fontSize: 18, // Tamaño del texto
          color: CustomColors.colorLink, // Color del texto
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }*/
