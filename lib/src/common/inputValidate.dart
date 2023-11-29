// ignore_for_file: file_names
// ---------- Menipular cada estructura de validación ----------
// Funcion para validar la estructura del rfc

import 'package:flutter/services.dart';
import 'enumValidate.dart';

// Funcion para validar la estructura del nombre
validateName(String name) {
  // especifica la estructura que se necesita en el input "RFC"
  String expRegular = r'^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]{3,50}$';
  // Clase para validar la expresion regular
  return RegExp(expRegular).hasMatch(name);
}

// Funcion para validar la estructura del email
validateEmail(String email) {
  String expRegular = r'^\S+@(?:[a-zA-Z0-9-]+\.(?:com|co|edu|org|edu\.co|io|us|ac|ad|af|ag|al|am|an|ao|aq|as|at|au|aw|ax|az|ba|bb|bd|be|bf|bg|bh|bi|bj|bl|bm|bn|bo|br|bq|bs|bt|bv|bw|by|bz|ca|cc|cd|cf|cg|ch|ci|ck|cl|cm|cn|cr|cs|cu|cv|cw|cx|cy|cz|dd|de|dj|dk|dm|do|dz|ec|ee|eg|eh|er|es|et|eu|fi|fj|fk|fm|fo|fr|ga|gb|gg|gh|gi|gl|gm|gn|gp|gq|gr|gs|gt|gu|gw|gy|hk|hm|hr|ht|hu|id|ie|il|im|in|io|iq|ir|is|it|je|jm|jo|ke|kg|kh|ki|kn|kp|kr|kw|ky|kz|la|lb|lc|li|lk|lr|ls|lt|lu|lv|ly|ma|mc|md|me|mf|mg|mh|mk|ml|mm|mn|mo|mp|mq|mr|mt|mu|mv|mw|mx|my|mz|na|nc|ne|nf|ng|ni|nl|no|np|nr|nu|nz|om|pa|pe|pf|pg|ph|pk|pl|pm|pn|pr|ps|pt|pw|py|qa|re|ro|rs|ru|rw|sa|sb|sc|sd|se|sg|sh|si|sj|sk|sl|sm|sn|so|sr|ss|st|su|sv|sx|sy|sz|tc|td|tf|tg|th|tl|tm|tn|to|tp|tr|tt|tv|tw|tz|ua|ug|uk|um|us|uy|uz|va|vc|ve|vg|vi|vn|vu|wf|ws|ye|yt|yu|za|zm|zr|zw))$';
  return RegExp(expRegular).hasMatch(email);
}

// Funcion para validar la estructura del numero de telefono
validatePhoneNumber(String phoneNumber) {
  String expRegular = r'^(?:[+0]9)?[0-9]{10,15}$';
  return RegExp(expRegular).hasMatch(phoneNumber);
}

// Funcion para validar la estructura del numero de telefono
validatePassword(String password) {
  String expRegular = '^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@\$!%*?&_.^#<>\\[\\]{}\\(\\)\\/\\\\|~`+=:,;\u0027"¡¿])[A-Za-z\\d@\$!%*?&_.^#<>\\[\\]{}\\(\\)\\/\\\\|~`+=:,;\u0027"¡¿]+\$';
  return RegExp(expRegular).hasMatch(password);
}

// Funcion para validar la estructura del numero de telefono
validateCodeOTP(String codeOTP) {
  String expRegular = r'^(?:[+0]9)?[0-9]{1,1}$';
  return RegExp(expRegular).hasMatch(codeOTP);
}

// Funcion para definir el formato de los puntos decimales en los numeros
String formatNumber(int number) {
  String parts = number.toString(); // divide parte entera y parte decimal
  RegExp expRegular = RegExp(r'\B(?=(\d{3})+(?!\d))'); // expresion regular para buscar grupo de tres valores

  parts = parts.replaceAll(expRegular, '.'); // Agrega entre los grupos de tres valores enteros (parts[0])
                                             //un "."
  //print(parts);

  return parts;
}

// --------------------------------------------------------------------
// ---------- Clase para validar formularios ----------
class ValidateFormulations {
  // Funcion para manejar la cantidad de caracteres del input
  static int? validateMaxLength(ValidateText? validateText) {
    // Uso de un switch
    switch (validateText) {

      case ValidateText.phoneNumber:
        return 15;

      case ValidateText.email:
        return 65;

      case ValidateText.codeOTP:
        return 1;

      default: // si no se da ninguno de los casos, no se manda una longitud
        return null;
    }
  }

  // Funcion para manejar el tipo de caracter del input
  static TextInputFormatter validateinputFormatters(ValidateText? validateText) {
    switch(validateText){
      case ValidateText.name:
        return FilteringTextInputFormatter.allow(
            RegExp(r'[a-zA-Z]+')); // maneja solo letras mayusculas y minusculas
      
      case ValidateText.lastname:
        return FilteringTextInputFormatter.allow(
            RegExp(r'[a-zA-Z]+')); // maneja solo letras mayusculas y minusculas

      case ValidateText.phoneNumber:
        return FilteringTextInputFormatter.digitsOnly; // maneja solo numeros
      
      case ValidateText.codeOTP:
        return FilteringTextInputFormatter.digitsOnly; // maneja solo numeros

      default: // si no se da ninguno de los casos
        return FilteringTextInputFormatter
            .singleLineFormatter; // maneja cualquier caracter
    }
  }
}