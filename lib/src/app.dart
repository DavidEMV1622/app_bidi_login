import 'package:flutter/material.dart';

import '../config/router.dart';


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