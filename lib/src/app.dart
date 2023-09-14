
import 'package:app_credibanco_login/src/pages/Login_page.dart';
import 'package:flutter/material.dart';

import '../config/router.dart';
import 'pages/Registrar_page.dart';


// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       // widget principal
//       home: Center(
//         child: RegisterPage(),
//         //child: SendCodePasswordPage(),
//       ),
//     );
//   }
// }


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: routes,
    );
  }
}