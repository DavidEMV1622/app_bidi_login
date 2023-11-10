import 'dart:convert';

import 'package:dio/dio.dart';


class User {
  String username;
  String password;

  User({required this.username, required this.password});

  // Metodo para convertir el objeto User a formato json
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json["username"],
      password: json["password"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "password": password,
    };
  }
}


Future<Response> pruebaAccesoToken(User user) async {
  final dio = Dio();

  const String userAuthUrl = "http://localhost:8080/user/auth/";

  try {
    final response = await dio.post(
      userAuthUrl,
      data: user.toJson(),
    );
    
    //print(response.data);
    
    final token = response.data["access_token"];
    print(token);

    print("");
    print("**********************************************************");

    return response;

  } on DioException catch (e) {
    print("Error: $e");
    // Maneja el error de manera adecuada según tus necesidades.
    throw Exception("Error al realizar la solicitud: $e");
  }
}
