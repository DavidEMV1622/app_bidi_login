// ignore_for_file: file_names
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:provider/provider.dart';

import '../Token.dart';

class User with ChangeNotifier {
  String? id;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? password;

  User({this.id, this.username, this.email, this.firstName, this.lastName, this.password,});

  // Metodos getters
  String? get getId => this.id;
  String? get getUserName => this.username;
  String? get getEmail => this.email;
  String? get getFirstName => this.firstName;
  String? get getLastName => this.lastName;
  String? get getPassword => this.password;

  // Metodos setters
  void setId(String idValue) {
    this.id = idValue;
    notifyListeners();
  }
  void setUserName(String userNameValue) {
    this.username = userNameValue;
    notifyListeners();
  }
  void setEmail(String emailValue) {
    this.email = emailValue;
    notifyListeners();
  }
  void setFirstName(String firstNameValue) {
    this.firstName = firstNameValue;
    notifyListeners();
  }
  void setLastName(String lastNameValue) {
    this.lastName = lastNameValue;
    notifyListeners();
  }
  void setPassword(String passwordValue) {
    this.password = password;
    notifyListeners();
  }
  // Metodo para revertir el formato json a objeto User
  /* factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      username: json["username"],
      email: json["email"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      password: json["password"],
    );
  } */

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

  // Metodo para actualizar el usuario JSON
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


// ****************** Token del usuario ******************
Future<int> tokenUserDTO(String email, String password, BuildContext context) async {
  final dio = Dio(); // instanciación para utilizar las funciones

  // Crear un DTO.
  User userDto = User(email: email, password: password);

  //const String userAuthUrl = "http://localhost:8080/user/auth/"; // URL Web

  const String userAuthUrl = "http://10.0.2.2:8080/user/auth/"; // URL android
  
  try {
    // Realizando peticion post del "User" (objeto) y enviandolo al servidor en formato JSON
    final response = await dio.post(
      userAuthUrl,
      data: userDto.toJsonToken()
    );
    
    final token = response.data["access_token"]; /* En la variable se define el tipo 
                                                de respuesta a mostrar, en este caso
                                                se especifica que en la respuesta que arroja postman
                                                solo  me muestre el token*/
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

    context.read<TokenProviderDTO>().guardarToken(token); // metodo para guardar el token 
    context.read<TokenProviderDTO>().guardarDecodedToken(decodedToken); // metodo para guardar el token desencriptado en el provider
 
    return response.statusCode!; // Retorna la respuesta de la petición http

  } on DioException catch (e) { // Excepciones para manejar los errores
    return e.response!.statusCode!;
  }
}
// Manejo del Token (Provider)
class TokenProviderDTO with ChangeNotifier {

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


// ****************** Crear usuario ******************
Future<int> createUserDTO({
  required String username, 
  required String firstName, 
  required String lastName, 
  required String email,
  required int cel,
  required String password
}) async {
  final dio = Dio();

  User userDto = User(username: username, firstName: firstName, lastName: lastName, email: email);

  //const String userCreateUrl = "http://localhost:8080/user/create/"; // URL Web

  const String userCreateUrl = "http://10.0.2.2:8080/user/create/"; // URL android
  
  try {
    final response = await dio.post(
      userCreateUrl,
      data: userDto.toJsonCreate(),
      // Permite agregar un header a la peticion post (si lo pide la api), 
      //se utiliza para autenticar por medio del token, las peticiones
      //a la hora de obtener los datos del usuario 
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


// ****************** Actualizar datos del usuario ******************
Future<int> updateUserDTO({
  required String username, 
  required String firstName, 
  required String lastName, 
  required String email,
  required BuildContext context
}) async {
  final dio = Dio();

  User userDto = User(username: username, firstName: firstName, lastName: lastName, email: email);

  String token = context.read<TokenProviderDTO>().isToken;
  String subToken = context.read<TokenProviderDTO>().getSubUsernameID();

  print(subToken);

  //String userUpdatedUrl = "http://localhost:8080/user/update/$subToken"; // URL Web

  String userUpdatedUrl = "http://10.0.2.2:8080/user/update/$subToken"; // URL android
  
  try {
    final response = await dio.put(
      userUpdatedUrl,
      data: userDto.toJsonUpdate(),
      options: Options(
        headers: {'Authorization': "Bearer $token",}
      )
    );

    print(response.statusCode);
    
    return response.statusCode!;

  } on DioException catch (e) {
    return e.response!.statusCode!;
  }
}


// ****************** Actualizar contrasenia ******************
Future<int> updatePasswordDTO({
  required String password,
  required BuildContext context
}) async {
  final dio = Dio();

  User userDto = User(password: password);

  String token = context.read<TokenProviderDTO>().isToken;
  String subToken = context.read<TokenProviderDTO>().getSubUsernameID();

  //String userUpdatedUrl = "http://localhost:8080/user/update/pw/$subToken"; // URL Web

  String userUpdatedUrl = "http://10.0.2.2:8080/user/update/pw/$subToken"; // URL android
  
  try {
    final response = await dio.put(
      userUpdatedUrl,
      data: userDto.toJsonUpdatePassword(),
      options: Options(
        headers: {'Authorization': "Bearer $token",}
      )
    );

    return response.statusCode!; // Retorna la respuesta de la petición http

  } on DioException catch (e) { // Excepciones para manejar los errores
    return e.response!.statusCode!;
  }
}


// ****************** Obtener Informacion del usuario ******************
Future<int> getUserDTO({
  required BuildContext context
}) async {
  final dio = Dio();

  String token = context.read<TokenProviderDTO>().isToken;
  String subToken = context.read<TokenProviderDTO>().getSubUsernameID();

  //String userUpdatedUrl = "http://localhost:8080/user/$subToken"; // URL Web

  String userUpdatedUrl = "http://10.0.2.2:8080/user/$subToken"; // URL android
  
  try {
    final response = await dio.get(
      userUpdatedUrl,
      options: Options(
        headers: {'Authorization': "Bearer $token",}
      )
    );

    final valueResponse = response.data;
    print(valueResponse);

    final id = valueResponse["id"];
    final userName = valueResponse["username"];
    final email = valueResponse["email"];
    final firstName = valueResponse["firstName"];
    final lastName = valueResponse["lastName"];

    context.read<User>().setId(id);
    context.read<User>().setUserName(userName);
    context.read<User>().setEmail(email);
    context.read<User>().setFirstName(firstName);
    context.read<User>().setLastName(lastName);
    
    //User userID = User();

    /* userID.setId = id;
    userID.setUserName = userName;
    userID.setEmail = email;
    userID.setFirstName = firstName;
    userID.setLastName = lastName; */

    /* print("*************************************");
    print("id: ${userID.getId}");
    print("userName: ${userID.getUserName}");
    print("email: ${userID.getEmail}");
    print("firstName: ${userID.getFirstName}");
    print("lastName: ${userID.getLastName}");
    print("**************************************"); */

    return response.statusCode!; // Retorna la respuesta de la petición http

  } on DioException catch (e) { // Excepciones para manejar los errores
    return e.response!.statusCode!;
  }
}