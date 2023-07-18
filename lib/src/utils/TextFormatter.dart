import 'package:flutter/services.dart';

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