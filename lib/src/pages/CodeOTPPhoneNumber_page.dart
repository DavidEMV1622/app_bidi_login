import 'package:flutter/material.dart';

import '../widgets/widgets_page_general/CodeOtp_general.dart';

class CodeOTPPhoneNumberPage extends StatefulWidget {
  const CodeOTPPhoneNumberPage({super.key});

  @override
  State<CodeOTPPhoneNumberPage> createState() => _CodeOTPPhoneNumberPageState();
}

class _CodeOTPPhoneNumberPageState extends State<CodeOTPPhoneNumberPage> {
  @override
  Widget build(BuildContext context) {
    return CodeOTPPageGeneral(subtituloUnoGeneral: "Ingresé el codigo que fue enviado por sms",);
  }
}