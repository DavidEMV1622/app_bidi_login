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
    bool isFound = false; // "true" encontro la llave valor, "false" se no encontro la llave valor 

    final allStorageKeyAndValue = await storage.readAll(); /* Lee todo el contenido del almacenamiento local 
                                                          "storage" (mapeo del storage) */
    for (var entradaMapeo in allStorageKeyAndValue.entries) { /* Recorre el mapeo del storage y usando la funcion
                                                            "entries" para obtener el par de entradas de la clave 
                                                            valor (key, value) */
      // Imprime la llave y el valor de la llave
      print("Llave valor: ${entradaMapeo.key}, contenido de la llave: ${entradaMapeo.value}");

      if (entradaMapeo.key == "userLogin$emailContentForm") { /* Si encontro la llave */
        isFound = true; /* Variable "isFound" a "true"  */
      }
    } 
    return isFound; // Retorna que encontro o no la llave valor


    /* ESTE COMENTADO ES OTRA MANERA DE HACERLO, ES IGUAL AL "for" SOLO QUE SE UTILIZA UN "for.Each" */
    // bool isFound = false;

    // final allStorageKeyAndValue = await storage.readAll();
    
    // allStorageKeyAndValue.forEach((key, value) {
    //   //Imprime la llave y el valor de la llave
    //   print('Llave valor: $key, Contenido de la llave: $value');

    //   if (key == "userLogin${emailContentForm}") {
    //     isFound = true;
    //   }
    //   print('Key: $key, Value: $value');
    // });

    // return isFound;


    /* ESTE COMENTADO ES OTRA MANERA DE HACERLO ENVES DE CICLOS, SE UTILIZA UNA FUNCION PROPIA DEL PAQUETE 
    LLAMADO "constrantisKey" */
    // bool isFound = false;

    // final allStorageKeyAndValue = await storage.readAll();

    // if (allStorageKeyAndValue.containsKey("userLogin$emailContentForm")) {
    //   return isFound = true;
    // } else {
    //   return isFound;
    // }
  }
}