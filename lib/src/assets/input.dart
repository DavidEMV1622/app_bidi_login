import 'package:flutter/material.dart';

// ---- Widget para el campo de texto "Correo" ----
Widget inputText(String textoCorreo) {
  return Container(
    // Permite definir el diseño de la caja de texto "BoxDecoration"
    decoration: BoxDecoration(
      color: Color.fromRGBO(217, 217, 217, 1), // Color del input
      borderRadius:
          BorderRadius.circular(10.0), // Define los bordes redondeados
      border: Border.all(
        // Define el grosor y color de borde
        color: Colors.black,
        width: 1.0,
      ),
    ),
    // Espaciado entre el borde y el contenido
    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
    //margin: EdgeInsets.symmetric(horizontal: 10.0),

    // Uso de un input (Campo de texto)
    child: TextField(
        style: TextStyle(fontSize: 25), // Tamanio del texto
        decoration: InputDecoration.collapsed(
          /* Quita la linea que viene por 
                                                  defecto en el input "InputDecoration.collapsed" */
          hintText: textoCorreo, // Place holder en el input
        )),
    /*
          height: 40.0,
          width: 1000.0,
          */
    margin: EdgeInsets.symmetric(
      horizontal: 0,
      vertical: 5,
    ),
  );
}
