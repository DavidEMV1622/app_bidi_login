// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../colors/colors.dart';

class UpperCaseTextFormatter extends TextInputFormatter{

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: capitalize(newValue.text),
      selection: newValue.selection
    );
  }
  // Metodo para dejar los textos en mayuscula
  String capitalize(String value){ 
    if (value.trim().isEmpty) return ""; // si esta vacio, que no haga nada
    return value.toUpperCase(); // de lo contrario, convierta los textos en mayuscula
  }
}




Widget titulo(String textoTitulo) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Text(
      textoTitulo,
      style: const TextStyle(fontSize: 48),
      textAlign: TextAlign.center,
    ),
  );
}

// Widget del Titulo principal
Widget tituloEncabezadoUno(String texto) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Text(
      texto,
      style: const TextStyle(
        fontSize: 100, 
        fontWeight: FontWeight.bold,
        /*fontFamily: ,*/
      ),
      textAlign: TextAlign.center, // Centrar un texto
    ),
  );
}

// Widget del Titulo principal
Widget tituloEncabezadoDos(String texto) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Text(
      texto,
      style: const TextStyle(
        fontSize: 38, 
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
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Text(
      texto,
      style: const TextStyle(
        fontSize: 24,
        color: CustomColors.colorNegro,
        fontWeight: FontWeight.bold,
        /*fontFamily: ,*/
      ),
      textAlign: TextAlign.center,
    ),
  );
}

// Widget del Subtitulo 2
Widget subtituloDos(String texto, double fontSizeText) {
  return SizedBox(
    child: Text(
      texto,
      style: TextStyle(
        fontSize: fontSizeText,
        color: CustomColors.colorVerdeOscuroFuerte,
        fontWeight: FontWeight.bold,
        fontFamily: "Gilroy_Bold",
      ),
      textAlign: TextAlign.center,
    ),
  );
}

// Widget del texto Etiqueta
Widget textoEtiqueta(String texto, Color colorText) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10),
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

// Widget del texto Etiqueta
Widget textoEtiquetaTwo(String texto, double fontSizeText) {
  return SizedBox(
    child: Text(
      texto,
      style: TextStyle(
        color: CustomColors.colorNegro,
        fontSize: fontSizeText, 
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.start,
    ),
  );
}

// Widget del texto Cuerpo
Widget textoCuerpo(String texto) {
  return Text(
    texto,
    style: const TextStyle(
      color: CustomColors.colorNegro,
      fontSize: 24,
      //fontFamily: ,
    ),
    textAlign: TextAlign.center,
  );
}

// Widget del texto Cuerpo
Widget textoCuerpoTwo(String texto, double fontSizeText) {
  return SizedBox(
    child: Text(
      texto,
      style: TextStyle(
        color: CustomColors.colorNegro,
        fontSize: fontSizeText,
      ),
      textAlign: TextAlign.start,
    ),
  );
}

// Widget del texto Cuerpo
Widget textColorSize(String texto, double fontSizeText, Color colorText) {
  return SizedBox(
    child: Text(
      texto,
      style: TextStyle(
        color: colorText,
        fontSize: fontSizeText,
      ),
      textAlign: TextAlign.start,
    ),
  );
}