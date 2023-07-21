// ---------- Menipular cada estructura de validación ----------
// Funcion para validar la estructura del rfc
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../colors/colors.dart';
import '../utils/TextFormatter.dart';
import 'enumValidate.dart';

validateRFC(String rfc) {
  // especifica la estructura que se necesita en el input "RFC"
  String expRegular = r'^([A-Z]{3,4}(\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01]))([A-Z\d]{2}(?:[A\d]))?)$';
  // Clase para validar la expresion regular
  return RegExp(expRegular).hasMatch(rfc);
}
// Funcion para validar la estructura del codigo postal
validateZipCode(String zipCode) {
  String expRegular = r'^[0-9]{5}(?:-[0-9]{4})?$';
  return RegExp(expRegular).hasMatch(zipCode);
}



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

// --------------------------------------------------------------------
// ---------- Funciones para validar formularios ----------
// Funcion para manejar la cantidad de caracteres del input
/*
validateMaxLength() {
  // Uso de un switch
  switch(validateText){
    case ValidateText.rfc:
      return 13;
    
    case ValidateText.phoneNumber:
      return 10;
    
    case ValidateText.email:
      return 65;
    
    case ValidateText.zipCode:
      return 5;

    default: // si no se da ninguno de los casos, no se manda una longitud
      return null;
  
  }
}

// Funcion para manejar el tipo de caracter del input
validateinputFormatters() {
  // Uso de un switch
  switch(widget.validateText){
    case ValidateText.rfc:
      return UpperCaseTextFormatter(); // deja el texto en mayuscula y acepta cualquier caracter
    
    case ValidateText.phoneNumber:
      return FilteringTextInputFormatter.digitsOnly; // maneja solo numeros
    
    case ValidateText.zipCode:
      return FilteringTextInputFormatter.digitsOnly; // maneja solo numeros

    default: // si no se da ninguno de los casos
      return FilteringTextInputFormatter.singleLineFormatter; // maneja cualquier caracter
  
  }
}

// Funcion para manejar la estructura del contenido del input
validateStructure(String? value) {
  // Condicion si el campo es o no requerido 
  //if(widget.isEmptyInput! && value!.isEmpty) {
  if(value!.length == 0) {
    setState(() {
      hasError = "Error"; // Establecer hasError en true si el campo está vacío
    });
    return "El campo es requerido llenarlo";
  } else {
    // Uso de un switch
    switch(widget.validateText){
      case ValidateText.rfc:
        return validateRFC(value)? null : message("RFC");
      
      case ValidateText.phoneNumber:
        return validatePhoneNumber(value)? null : setState(() {
          message("número de telefono");
    });
      
      case ValidateText.email:
        return validateEmail(value)? 
        setState(() {
          hasError = "Correct"; // Establecer hasError en false si el campo está aprobado
        }) : 
        message("email");
        // ignore: dead_code
        setState(() {
          hasError = "Error"; // Establecer hasError en true si el campo no cumple con la estructura
        });
      
      case ValidateText.zipCode:
        return validateZipCode(value)? null : message("codigo postal");

      default: // si no se da ninguno de los casos, no se muestra mensaje
        return null;
    }
  }
}

// Funcion para mostrar el mismo mensaje de error
message(String textMessage) => "La estructura del $textMessage es inccorrecta";

// Funcion para cambiar el color del borde del formulario
_miColor(String hasError) {
  if (hasError == "Error"){
    return Colors.red;
  
  } else if (hasError == "Correct") {
    return Colors.green;
  
  } else if (hasError == "Base") {
    return CustomColors.colorNegro;
  }
}
// Funcion para cambiar el borde del formulario
_miBorde(String hasError) {
  if (hasError == "Error"){
    return 2.5;
  
  } else if (hasError == "Correct") {
    return 2.5;
  
  } else if (hasError == "Base") {
    return 1.0;
  }
}
*/