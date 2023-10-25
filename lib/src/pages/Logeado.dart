// ignore_for_file: file_names
import 'package:app_credibanco_login/src/widgets/dropBar.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';

import '../colors/colors.dart';
import '../utils/TextFormatter.dart';

class LogeadoPage extends StatefulWidget {
  const LogeadoPage({super.key});

  @override
  State<LogeadoPage> createState() => _LogeadoPageState();
}

class _LogeadoPageState extends State<LogeadoPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        
        actions: [IconButton(onPressed: () {
          
        }, icon: Icon(Icons.menu, size: 30, color: CustomColors.colorNegro))],
        title: Row(children: [
          const Iconify(
            Bi.person_circle,
            color: CustomColors.colorNegro,
          ),

          const SizedBox(
            width: 10,
          ),

          textoEtiquetaTwo("Hola, David", 20)
        ]),
        backgroundColor: CustomColors.colorVerdePantano,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Container(
            height: size.height * 0.4,
            width: size.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50), 
                bottomRight: Radius.circular(50)), 
              color:  CustomColors.colorVerdePantano,
            ),
            child: Text("HOLA"),
          ),
        ],
      ),
      bottomNavigationBar: barNavigation(page: true),
    );
  }
}
