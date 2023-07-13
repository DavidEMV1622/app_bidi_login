import 'package:flutter/material.dart';

class buttonPruebas extends StatelessWidget {
  final Color colorButton;
  final String textButton;
  final Border? bordButton;
  final BoxDecoration fdfd;

  const buttonPruebas(
      {super.key,
      required this.colorButton,
      required this.textButton,
      this.bordButton,
      required this.fdfd});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration() = fdfd,
      child: Text(textButton),
      height: 25,
    );
  }
}
