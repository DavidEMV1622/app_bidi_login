import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../colors/colors.dart';

class UpperCaseTextFormatter extends TextInputFormatter{

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // TODO: implement formatEditUpdate
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




Widget titulo(String texto_Titulo) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Text(
      texto_Titulo,
      style: TextStyle(fontSize: 48),
      textAlign: TextAlign.center,
    ),
  );
}

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
        color: CustomColors.colorGris_1,
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
  return Text(
    texto,
    style: TextStyle(
      color: colorText,
      fontSize: 25,
      fontWeight: FontWeight.bold,
      //fontFamily: ,
    ),
    textAlign: TextAlign.center,
  );
}