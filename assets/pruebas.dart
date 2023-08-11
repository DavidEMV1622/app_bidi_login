import 'package:app_credibanco_login/src/common/inputValidate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../lib/src/colors/colors.dart';
import 'package:app_credibanco_login/src/common/enumValidate.dart';
import '../lib/src/utils/TextFormatter.dart';

class buttonPruebas extends StatelessWidget {
  final Color colorButton;
  final String textButton;
  final Border? bordButton;
  final BoxDecoration fdfd;

  const buttonPruebas(
      {super.key,
      required this.colorButton,
      required this.textButton,
      this.bordButton,
      required this.fdfd});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration() = fdfd,
      child: Text(textButton),
      height: 25,
    );
  }
}

// Clase para inputs con validaciones
class TextFieldBase extends StatelessWidget {

  String text; // texto del input
  TextEditingController controller; // controlar cada input
  ValidateText? validateText; // Tipo de validacion a utilizar
  bool? isEmptyInput; // Esta vacio el input o no

  TextFieldBase(this.text, this.controller, {this.validateText, this.isEmptyInput=false});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [

        Text(text), // textp encima del input
        
        // input para manejar correctamente las validaciones necesarias
        TextFormField(
          controller: controller, // maneja cada input a utilizar
          maxLength: validateMaxLength(), // Cantidad de caracteres que tiene el input
          inputFormatters: [validateinputFormatters()], // Tipo de dato del input
          validator: (String? value) { /* Valida si la estructura del input es
                                         correcta */
            return validateStructure(value); // retorna si la estructura esta bien escrita
          },
        )

      ],
    );
  }

  // Funcion para manejar la cantidad de caracteres del input
  validateMaxLength() {
    // Uso de un switch
    switch(validateText){
      
      case ValidateText.phoneNumber:
        return 10;
      
      case ValidateText.email:
        return 65;

      default: // si no se da ninguno de los casos, no se manda una longitud
        return null;
    
    }
  }

  // Funcion para manejar el tipo de caracter del input
  validateinputFormatters() {
    // Uso de un switch
    switch(validateText){

      case ValidateText.phoneNumber:
        return FilteringTextInputFormatter.digitsOnly; // maneja solo numeros
      
      default: // si no se da ninguno de los casos
        return FilteringTextInputFormatter.singleLineFormatter; // maneja cualquier caracter
    
    }
  }

  // Funcion para manejar la estructura del contenido del input
  validateStructure(String? value) {
    // Condicion si el campo es o no requerido 
    if(isEmptyInput! && value!.isEmpty) {
      return "El campo $text es requerido";
    } else {
      // Uso de un switch
      switch(validateText){
        /*
        case ValidateText.rfc:
          return validateRFC(value!)? null : message("RFC");
        */
        case ValidateText.phoneNumber:
          return validatePhoneNumber(value!)? null : message("número de telefono");
        
        case ValidateText.email:
          return validateEmail(value!)? null : message("email");
        /*
        case ValidateText.zipCode:
          return validateZipCode(value!)? null : message("codigo postal");
*/
        default: // si no se da ninguno de los casos, no se muestra un mensaje
          return null;
      
      }
    }
  }

  // Funcion para mostrar el mismo mensaje de error
  message(String textMessage) => "La estructura del $textMessage es inccorrecta";
}

