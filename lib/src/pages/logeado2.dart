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
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         const  Center(
            child: Text("Pagina del two Logeado"),
          ),
          Container(
            width: 154,
            //child: Pocket(),
          ),
        ],
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.all(8.0),
        child: BarNavigation(page: false),
      ),
    );
  }
}
