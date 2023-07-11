import 'package:flutter/material.dart';

import '../colors/colors.dart';

// ---- Widget para el boton de inicio de sesion ----
Widget boton(String textoBoton, Color Variable) {
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
