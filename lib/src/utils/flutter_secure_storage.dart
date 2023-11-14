import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageMethods {
  // Creación del almacenamiento
  final storage = const FlutterSecureStorage();

  // Nombre de cada llave
  final String _keyEmailLogin = 'emailLogin';
  final String _keyPassWordLogin = 'passwordLogin';

  final String _keyIsNotices = 'isNotices';

  
  // Metodo set para asignar email
  Future setEmailLogin(String emailLogin) async {
    await storage.write(key: _keyEmailLogin, value: emailLogin);
  }

  // Metodo set para asignar contrasenia
  Future setPasswordLogin(String passwordLogin) async {
    await storage.write(key: _keyPassWordLogin, value: passwordLogin);
  }

  // Metodo get para obtener el email del usuario
  Future <String?> getEmailLogin() async {
    return await storage.read(key: _keyEmailLogin);
  }

  // Metodo get para obtener la contrasenia del usuario
  Future <String?> getPasswordLogin() async {
    return await storage.read(key: _keyPassWordLogin);
  } 


  Future setIsNotices(bool isNotices) async {
    await storage.write(key: _keyIsNotices, value: isNotices.toString());
  }
  Future<bool?> getIsNotices() async {
    var isNoticesValue = await storage.read(key: _keyIsNotices);
    return isNoticesValue == 'true';
  }

  // Metodo set para asignar la llave del correo del propio usuario
  Future setEmailStorage(String emailLogin) async {
    await storage.write(key: "userLogin$emailLogin", value: emailLogin);
  }

  // Metodo get para obtener la llave valor del email del usuario y recorrerlas llaves valor
  Future <bool> getEmailStorage(String emailContentForm) async {

    /* Se utiliza la funcion "read" para que lea uno por uno las "key" para buscar el email */
    return await storage.read(key: "userLogin$emailContentForm") != null ? true : false;
  }
}