// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../widgets/widgets_page_general/CodeOtp_general.dart';

class CodeOTPPhoneNumberChangePasswordPage extends StatefulWidget {
  const CodeOTPPhoneNumberChangePasswordPage({super.key});

  @override
  State<CodeOTPPhoneNumberChangePasswordPage> createState() => _CodeOTPPhoneNumberChangePasswordPageState();
}

class _CodeOTPPhoneNumberChangePasswordPageState extends State<CodeOTPPhoneNumberChangePasswordPage> {

  @override
  Widget build(BuildContext context) {
    return const CodeOTPPageGeneral(
      tituloEncabezadoUnoGeneral: "Cambiar Contraseña",
      subtituloUnoGeneral: "Ingresé el codigo que fue enviado por sms",
      ruta: "/changePassword",
    );
  }
}