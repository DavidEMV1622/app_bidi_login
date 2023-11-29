import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Token.dart';

Future<int> updatePassword({
  required String password,
  required BuildContext context
}) async {
  final dio = Dio();

  Map<String, dynamic> toJson() {
    return {
      "type":"password",
      "temporary":false,
      "value":password,
    };
  }

  String token = context.read<TokenProvider>().isToken;
  String subToken = context.read<TokenProvider>().getSubUsernameID();

  //String userUpdatedUrl = "http://localhost:8080/user/update/pw/$subToken"; // URL Web

  String userUpdatedUrl = "http://10.0.2.2:8080/user/update/pw/$subToken"; // URL android
  
  try {
    final response = await dio.put(
      userUpdatedUrl,
      data: toJson(),
      options: Options(
        headers: {'Authorization': "Bearer $token",}
      )
    );

    return response.statusCode!; // Retorna la respuesta de la petición http

  } on DioException catch (e) { // Excepciones para manejar los errores
    return e.response!.statusCode!;
  }
}