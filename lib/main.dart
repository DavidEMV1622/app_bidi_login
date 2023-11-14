import 'package:app_credibanco_login/src/Back-end/Dto/Token.dart';
import 'package:app_credibanco_login/src/app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Importaciones manuales
//import 'src/app.dart';



void main() {

  runApp(MultiProvider(
    providers: [
      /* ChangeNotifierProvider(create: (_) => myDropdown[0]), */ // Proporciona la primera instancia
      ChangeNotifierProvider(create: (_) => TokenProvider()),
    ],
    child: const MyApp(),
  ));
}
/* 
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ejemplo de solicitud POST'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              //postData(); // Llama a la función para realizar la solicitud POST
              getTokenLogin('adminbidi@yopmail.com', 'Colombia.4',);
            },
            child: Text('Enviar POST'),
          ),
        ),
      ),
    );
  }
} */