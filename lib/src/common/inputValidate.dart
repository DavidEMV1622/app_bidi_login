// ---- Menipular cada estructura de validación ----

// Funcion para validar la estructura del rfc
validateRFC(String rfc) {
  // especifica la estructura que se necesita en el input "RFC"
  String expRegular = r'^([A-Z]{3,4}(\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01]))([A-Z\d]{2}(?:[A\d]))?)$';
  // Clase para validar la expresion regular
  return RegExp(expRegular).hasMatch(rfc);
}

// Funcion para validar la estructura del email
validateEmail(String email) {
  String expRegular = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  return RegExp(expRegular).hasMatch(email);
}

// Funcion para validar la estructura del numero de telefono
validatePhoneNumber(String phoneNumber) {
  String expRegular = r'^(?:[+0]9)?[0-9]{10,15}$';
  return RegExp(expRegular).hasMatch(phoneNumber);
}

// Funcion para validar la estructura del codigo postal
validateZipCode(String zipCode) {
  String expRegular = r'^[0-9]{5}(?:-[0-9]{4})?$';
  return RegExp(expRegular).hasMatch(zipCode);
}