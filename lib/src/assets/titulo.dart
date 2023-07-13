import 'package:flutter/material.dart';

Widget titulo(String texto_Titulo) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Text(
      texto_Titulo,
      style: TextStyle(fontSize: 48),
      textAlign: TextAlign.center,
    ),
  );
}
