import 'package:flutter/material.dart';

// Widget del Titulo principal
Widget tituloEncabezadoUno(String texto_Titulo) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Text(
      texto_Titulo,
      style: TextStyle(
        fontSize: 48, 
        fontWeight: FontWeight.bold,
        /*fontFamily: ,*/),
      textAlign: TextAlign.center,
    ),
  );
}

// Widget del Subtitulo 1
Widget subtituloUno(String textoSubtitulo) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Text(
      textoSubtitulo,
      style: TextStyle(
        fontSize: 24, 
        //fontWeight: FontWeight.bold,
        /*fontFamily: ,*/),
      textAlign: TextAlign.center,
    ),
  );
}
