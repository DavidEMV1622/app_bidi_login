// ignore: unused_import
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:provider/provider.dart';

// "User" representacion de los datos a manejar en la API (DTO) 
/* class User {
  String username;
  String password;

  User({required this.username, required this.password});

  // Metodo para revertir el formato json a objeto User
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json["username"],
      password: json["password"],
    );
  }

  // Metodo para convertir el objeto User a formato json
  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "password": password,
    };
  }
} */

// Metodo Post para obtener el Token
// "Future<int>" devuelve la respuesta en codigo http de la API
Future<int> pruebaAccesoToken(String email, String password, BuildContext context) async {
  final dio = Dio();

  Map<String, dynamic> toJson() {
    return {
      "username": email,
      "password": password,
    };
  }

  const String userAuthUrl = "http://localhost:8080/user/auth/"; // URL Web

  //const String userAuthUrl = "http://10.0.2.2:8080/user/auth/"; // URL android
  
  try {
    // Realizando peticion post del "User" (objeto) y enviandolo al servidor en formato JSON
    final response = await dio.post(
      userAuthUrl,
      data: toJson()
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

    context.read<TokenProvider>().guardarToken(token); // metodo para guardar el token 
    context.read<TokenProvider>().guardarDecodedToken(decodedToken); // metodo para guardar el token desencriptado en el provider
 
    return response.statusCode!; // Retorna la respuesta de la petición http

  } on DioException catch (e) { // Excepciones para manejar los errores
    return e.response!.statusCode!;
  }
}

class TokenProvider with ChangeNotifier {

  String isToken = ""; 
  Map<String, dynamic> isDecodedToken = <String, dynamic>{};

  String get myToken => this.isToken;
  Map<String, dynamic> get myTokenDecoded => this.isDecodedToken;

  void guardarToken(String token) {
    this.isToken = token;
    notifyListeners();
  }

  void guardarDecodedToken(Map<String, dynamic> tokenDecoded) {
    this.isDecodedToken = tokenDecoded;
    notifyListeners();
  }


  // Metodo para obtener el "sub" del usuario (id)
  String getSubUsernameID() {
    return myTokenDecoded["sub"];
  }

  // Metodo para obtener el "nombre de usuario"
  String getPreferredUsername() {
    return myTokenDecoded["preferred_username"];
  }
}