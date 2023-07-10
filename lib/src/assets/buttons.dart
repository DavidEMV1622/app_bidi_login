import 'package:flutter/material.dart';

import '../colors/colors.dart';

// ---- Widget para el boton de inicio de sesion ----
  Widget boton( String textoBoton) {
    return MaterialButton(
      /*
      minWidth: 161, // Ancho del boton
      height: 60, // Largo del boton
      */
      onPressed: () {}, // Animación al presionar
      color: CustomColors.colorButton, // Color del boton por medio de la clase "CustomColors" 
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),

      // Agregar texto dentro del boton
      child: Text(
        textoBoton,
        style: TextStyle( color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold,
        ),
      ),
    );
  }