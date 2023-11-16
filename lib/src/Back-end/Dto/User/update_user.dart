import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Token.dart';

Future<int> updateUser({
  required String username, 
  required String firstName, 
  required String lastName, 
  required String email,
  required BuildContext context
}) async {
  final dio = Dio();

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "username": username,
      "firstName": firstName,
      "lastName": lastName
    };
  }

  String subToken = context.read<TokenProvider>().getSubUsernameID();

  String userUpdatedUrl = "http://localhost:8080/user/create/$subToken"; // URL Web

  //String userUpdatedUrl = "http://10.0.2.2:8080/user/create/$subToken"; // URL android
  
  try {
    final response = await dio.put(
      userUpdatedUrl,
      data: toJson(),
      options: Options(
      headers: {
        'Authorization': "Bearer",
      })
    );
    
    final valueResponse = response.data;
    print(valueResponse);

    return response.statusCode!; // Retorna la respuesta de la petición http

  } on DioException catch (e) { // Excepciones para manejar los errores
    return e.response!.statusCode!;
  }
}