// ignore_for_file: file_names

/* // "User" representacion de los datos a manejar en la API (DTO) 
import 'package:app_credibanco_login/src/Back-end/Dto/Token.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:provider/provider.dart';

class User {
  String? id;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? password;

  User({
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.password,
    });

  // Metodo para revertir el formato json a objeto User
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      username: json["username"],
      email: json["email"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      password: json["password"],
    );
  }

  // Metodo para convertir el objeto User a formato json
  // Metodo para obtener el Token JSON
  Map<String, dynamic> toJsonToken() {
    return {
      "username": email,
      "password": password,
    };
  }

  // Metodo para crear el usuario JSON
  Map<String, dynamic> toJsonCreate() {
    return {
      "username": username,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "enabled": true,
      "attributes": {
          "cel": 1212121212,
      },
      "credentials": [
          {
              "type": "password",
              "value": password
          }
      ]
    };
  }

  // Metodo para acctualizar el usuario JSON
  Map<String, dynamic> toJsonUpdate() {
    return {
      "email": email,
      "username": username,
      "firstName": firstName,
      "lastName": lastName
    };
  }

  // Metodo para actualizar la contrasenia del usuario JSON
  Map<String, dynamic> toJsonUpdatePassword() {
    return {
      "type":"password",
      "temporary":false,
      "value":password,
    };
  }
}

Future<int> AccesoToken(String email, String password, BuildContext context) async {
  
  User user = User(email: email, password: password);

  final dio = Dio();

  //const String userAuthUrl = "http://localhost:8080/user/auth/"; // URL Web

  const String userAuthUrl = "http://10.0.2.2:8080/user/auth/"; // URL android
  
  try {
    // Realizando peticion post del "User" (objeto) y enviandolo al servidor en formato JSON
    final response = await dio.post(
      userAuthUrl,
      data: user.toJsonToken()
    );
    
    final token = response.data["access_token"]; /* En la variable se define el tipo 
                                                de respuesta a mostrar, en este caso
                                                se especifica que en la respuesta solo
                                                me muestre el token*/
    print("Token: $token"); // imprime el token

    print("");

    print("*******************************************************");
    print("********************************************************");
    Map<String, dynamic> decodedToken = Jwt.parseJwt(token);
    print(decodedToken);
    print("");
    String decodedEmail = decodedToken["email"];
    print(decodedEmail);
    print("");
    DateTime? expiryDate = Jwt.getExpiryDate(token);
    print(expiryDate);
    print(response.statusCode);
    print("******************************************************");
    print("*****************************************************");
    print("");

    context.read<TokenProviderprueba>().guardarToken(token); // metodo para guardar el token 
    context.read<TokenProviderprueba>().guardarDecodedToken(decodedToken); // metodo para guardar el token desencriptado en el provider
 
    return response.statusCode!; // Retorna la respuesta de la petición http

  } on DioException catch (e) { // Excepciones para manejar los errores
    return e.response!.statusCode!;
  }
}

class TokenProviderprueba with ChangeNotifier {

  String isToken = ""; 
  Map<String, dynamic> isDecodedToken = <String, dynamic>{};

  String get myToken => this.isToken;
  Map<String, dynamic> get myTokenDecoded => this.isDecodedToken;

  void guardarToken(String token) {
    this.isToken = token;
    print("Token provider: $token");
    notifyListeners();
  }

  void guardarDecodedToken(Map<String, dynamic> tokenDecoded) {
    this.isDecodedToken = tokenDecoded;
    notifyListeners();
  }
} */