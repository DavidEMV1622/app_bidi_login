import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageMethods {
  // Creación del almacenamiento
  final storage = const FlutterSecureStorage();

  // Nombre de cada llave
  final String _keyEmailLogin = 'emailLogin';
  final String _keyPassWordLogin = 'passwordLogin';

  final String _keyIsNotices = 'isNotices';

  //List<String> newListEmail = [];


  

  Future setEmailStorage(String emailLogin) async {
    await storage.write(key: "${emailLogin}", value: emailLogin);
  }

  // Metodo get para obtener el email del usuario
  Future <bool> getEmailStorage(String emailContentForm) async {
    bool isFound = false;

    final allStorageKeyAndValue = await storage.readAll(); /* Lee todo el contenido del almacenamiento local 
                                                          "storage" (mapeo del storage) */
    for (var entradaMapeo in allStorageKeyAndValue.entries) { /* Recorre el mapeo del storage usando la funcion
                                                            "entries" para obtener el par de entradas de la clave 
                                                            valor (key, value) */
      print("Llave valor: ${entradaMapeo.key}, contenido de la llave: ${entradaMapeo.value}");

      if (entradaMapeo.key == emailContentForm) {
        isFound = true;
      }
    } 
    return isFound;

    // return almacenamiento.forEach((key, value) { 
    //   print("Llave valor: ${key}, Valor de la llave: ${value}");
    // });
  }

  
  
  
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

}