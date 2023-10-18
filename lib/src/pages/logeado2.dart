import 'package:flutter/material.dart';

import '../widgets/dropBar.dart';

class LogeadoPage2 extends StatefulWidget {
  const LogeadoPage2({super.key});

  @override
  State<LogeadoPage2> createState() => _LogeadoPage2State();
}

class _LogeadoPage2State extends State<LogeadoPage2> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text("Pagina del two Logeado"),
          )
        ],
      ),
      bottomNavigationBar: barNavigation(page: false),
    );
  }
}
