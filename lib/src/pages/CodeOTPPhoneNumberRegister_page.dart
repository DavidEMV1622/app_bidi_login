// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../widgets/widgets_page_general/CodeOtp_general.dart';
import 'Registrar_page.dart';

class CodeOTPPhoneNumberRegisterPage extends StatefulWidget {
  const CodeOTPPhoneNumberRegisterPage({super.key});

  @override
  State<CodeOTPPhoneNumberRegisterPage> createState() => _CodeOTPPhoneNumberRegisterPageState();
}

class _CodeOTPPhoneNumberRegisterPageState extends State<CodeOTPPhoneNumberRegisterPage> {

  @override
  Widget build(BuildContext context) {
    return const CodeOTPPageGeneral(
      tituloEncabezadoUnoGeneral: "Cambiar Contraseña",
      subtituloUnoGeneral: "Ingresé el codigo que fue enviado por sms",
      onPressedPantallaPasar: RegisterPage(),
    );
  }
}