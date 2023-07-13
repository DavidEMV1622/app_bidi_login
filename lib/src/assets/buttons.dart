

import 'package:flutter/material.dart';

import '../colors/colors.dart';
import '../pages/Password_page.dart';
import '../pages/Registrar_page.dart';

// ---- Widget para el boton de inicio de sesion ----
Widget boton_orange(String textoBoton, Color Variable) {
  return Container(
    decoration: BoxDecoration(
      color: Variable, // Color del input

      borderRadius: BorderRadius.circular(10),
    ),
    child: MaterialButton(
      minWidth: double.infinity, // Ancho del boton
      height: 60, // Largo del botoncircular(10.0)

      onPressed: () {}, // Animación al presionar

      //color: Color.fromRGBO(255, 182, 0,
      //  1), // Color del boton por medio de la clase "CustomColors"

      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),

      // Agregar texto dentro del boton
      child: Text(
        textoBoton,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget boton_White(String textoBoton, Color colorBox, double widthBorder, context) {
  return Container(
    decoration: BoxDecoration(
      color: colorBox, // Color del input
      border: Border.all(width: widthBorder),
      borderRadius: BorderRadius.circular(10),
    ),
    child: MaterialButton(
      minWidth: double.infinity, // Ancho del boton
      height: 60, // Largo del botoncircular(10.0)

      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RegisterPage()),
        );
      }, // Animación al presionar

      //color: Color.fromRGBO(255, 182, 0,
      //  1), // Color del boton por medio de la clase "CustomColors"

      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),

      // Agregar texto dentro del boton
      child: Text(
        textoBoton,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

// ---- Widget para un boton transparente para los links ----
  Widget buttonLink(String textoLink, context) {
    return TextButton(
      onPressed: () {
        /*
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
        */
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
          color: CustomColors.colorVerdePantano, // Color del texto
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

class BotonCambio  extends StatelessWidget {
  
  // Definir los parametros a utilizar
  final String textoLink;
  final Color textoColor;

  // Agregar los parametros
  const BotonCambio ({super.key, required this.textoLink, required this.textoColor,});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        /*
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
        */
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
          color: textoColor, // Color del texto
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}