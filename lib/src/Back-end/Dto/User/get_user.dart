// ignore_for_file: use_build_context_synchronously
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Token.dart';

Future<int> getUser({
  required BuildContext context
}) async {
  final dio = Dio();

  String token = context.read<TokenProvider>().isToken;
  String subToken = context.read<TokenProvider>().getSubUsernameID();

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

    context.read<GetUserProvider>().saveId(id);
    context.read<GetUserProvider>().saveUserName(userName);
    context.read<GetUserProvider>().saveEmail(email);
    context.read<GetUserProvider>().saveFirstName(firstName);
    context.read<GetUserProvider>().saveLastName(lastName);

    return response.statusCode!; // Retorna la respuesta de la petición http

  } on DioException catch (e) { // Excepciones para manejar los errores
    return e.response!.statusCode!;
  }
}

class GetUserProvider with ChangeNotifier {

  String id = "";
  String userName = "";
  String email = "";
  String firstName= "";
  String lastName = "";

  String get myId => this.id;
  String get myUserName => this.userName;
  String get myEmail => this.email;
  String get myFirstName => this.firstName;
  String get myLastName => this.lastName;

  void saveId(String idValue) {
    this.id = idValue;
    notifyListeners();
  }

  void saveUserName(String userNameValue) {
    this.userName = userNameValue;
    notifyListeners();
  }

  void saveEmail(String emailValue) {
    this.email = emailValue;
    notifyListeners();
  }

  void saveFirstName(String firstNameValue) {
    this.firstName = firstNameValue;
    notifyListeners();
  }

  void saveLastName(String lastNameValue) {
    this.lastName = lastNameValue;
    notifyListeners();
  }
}