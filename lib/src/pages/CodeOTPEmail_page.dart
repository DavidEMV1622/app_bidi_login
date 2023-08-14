import 'package:flutter/material.dart';

import '../widgets/widgets_page_general/CodeOtp_general.dart';

class CodeOTPEmailPage extends StatefulWidget {
  const CodeOTPEmailPage({super.key});

  @override
  State<CodeOTPEmailPage> createState() => _CodeOTPEmailPageState();
}

class _CodeOTPEmailPageState extends State<CodeOTPEmailPage> {
  @override
  Widget build(BuildContext context) {
    return CodeOTPPageGeneral(subtituloUnoGeneral: "Ingresé el codigo que fue enviado a su correo",);
  }
}