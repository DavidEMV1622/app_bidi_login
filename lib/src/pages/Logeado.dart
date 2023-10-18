// ignore_for_file: file_names

import 'package:app_credibanco_login/src/widgets/dropBar.dart';
import 'package:flutter/material.dart';

class LogeadoPage extends StatefulWidget {
  const LogeadoPage({super.key});

  @override
  State<LogeadoPage> createState() => _LogeadoPageState();
}

class _LogeadoPageState extends State<LogeadoPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text("Pagina del usuario Logeado"),
          )
        ],
      ),
      bottomNavigationBar: barNavigation(page: true),
    );
  }
}
