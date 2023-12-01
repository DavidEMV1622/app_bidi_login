import 'package:app_credibanco_login/src/app.dart';
import 'package:app_credibanco_login/src/pages/Filtros%20original/Filtro_screens/provider/dropdown_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Importaciones manuales
//import 'src/app.dart';



void main() {

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => DropDown()),
    ],
    child: const MyApp(),
  ));

}