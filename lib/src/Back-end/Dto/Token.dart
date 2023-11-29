// ignore_for_file: file_names, use_build_context_synchronously
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:provider/provider.dart';

// Metodo Post para obtener el Token
// "Future<int>" devuelve la respuesta en codigo http de la API
Future<int> tokenUser(String email, String password, BuildContext context) async {
  final dio = Dio();

  // Metodo para pasar la informacion en formato JSON
  Map<String, dynamic> toJson() {
    return {
      "username": email,
      "password": password,
    };
  }

  //const String userAuthUrl = "http://localhost:8080/user/auth/"; // URL Web

  const String userAuthUrl = "http://10.0.2.2:8080/user/auth/"; // URL android
  
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
    print(decodedToken); // Token desencriptado
    print("");
    String decodedEmail = decodedToken["email"];
    print(decodedEmail); // Mostrar segun la respuesta "decodedToken" el email
    print("");
    print(response.statusCode); // Numero de la respuestaa http
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

  // Guardar Token en provider
  void guardarToken(String token) {
    this.isToken = token;
    print("Token provider: $token");
    notifyListeners();
  }

  // Guardar Token desencriptado en provider
  void guardarDecodedToken(Map<String, dynamic> tokenDecoded) {
    this.isDecodedToken = tokenDecoded;
    notifyListeners();
  }

  // Metodo para obtener el "sub" del usuario en el token (id)
  String getSubUsernameID() {
    return myTokenDecoded["sub"];
  }
}