import 'package:http/http.dart' as http;
import 'dart:convert';
 
 getTokenLogin(String user, String password){
    
    const String apiUrl = "http://localhost:8080/user/auth";

    Future<void> postData() async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'username': 'adminbidi@yopmail.com',
        'password': 'Colombia.4',
      }),
    );

     if (response.statusCode == 200) {
      // Si la solicitud POST es exitosa (código de estado 201 Created)
      print('Solicitud POST exitosa');
      print('Respuesta: ${response.body}');
    } else {
      // Si la solicitud POST falla, puedes manejar el error aquí
      print('Error en la solicitud POST. Código de estado: ${response.statusCode}');
    }

  }
 }