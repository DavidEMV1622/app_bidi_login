import 'package:flutter/material.dart';

// Widget del Titulo principal
Widget tituloEncabezadoUno(String texto) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Text(
      texto,
      style: TextStyle(
        fontSize: 48, 
        fontWeight: FontWeight.bold,
        /*fontFamily: ,*/
      ),
      textAlign: TextAlign.center, // Centrar un texto
    ),
  );
}

// Widget del Subtitulo 1
Widget subtituloUno(String texto) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Text(
      texto,
      style: TextStyle(
        fontSize: 24, 
        //fontWeight: FontWeight.bold,
        /*fontFamily: ,*/),
      textAlign: TextAlign.center,
    ),
  );
}

// Widget del texto Etiqueta
Widget textoEtiqueta(String texto, Color colorText) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Text(
      texto,
      style: TextStyle(
        color: colorText,
        fontSize: 30, 
        fontWeight: FontWeight.bold,
        //fontFamily: ,
      ),
      textAlign: TextAlign.center,
    ),
  );
}

// Widget del texto Cuerpo
Widget textoCuerpo(String texto, Color colorText) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Text(
      texto,
      style: TextStyle(
        color: colorText,
        fontSize: 30, 
        fontWeight: FontWeight.bold,
        //fontFamily: ,
      ),
      textAlign: TextAlign.center,
    ),
  );
}