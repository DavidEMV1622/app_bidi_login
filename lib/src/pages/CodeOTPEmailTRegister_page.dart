// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../widgets/widgets_page_general/CodeOtp_general.dart';

class CodeOTPEmaiRegisterPage extends StatefulWidget {
  const CodeOTPEmaiRegisterPage({super.key});

  @override
  State<CodeOTPEmaiRegisterPage> createState() => _CodeOTPEmaiRegisterPageState();
}

class _CodeOTPEmaiRegisterPageState extends State<CodeOTPEmaiRegisterPage> {

  @override
  Widget build(BuildContext context) {
    return const CodeOTPPageGeneral(
      tituloEncabezadoUnoGeneral: "Cambiar Contraseña",
      subtituloUnoGeneral: "Ingresé el codigo que fue enviado por correo",
      ruta: "/registerPage",
    );
  }
}