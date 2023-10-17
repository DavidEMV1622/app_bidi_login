import 'package:app_credibanco_login/src/pages/Logeado.dart';
import 'package:app_credibanco_login/src/pages/Login_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // widget principal
      home: Center(
        // child: LoginPage(),
        child: LogeadoPage(),
      ),
    );
  }
}
