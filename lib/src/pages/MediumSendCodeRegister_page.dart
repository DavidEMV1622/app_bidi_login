// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../widgets/widgets_page_general/MediumSendCode_general.dart';
import 'SendCodeEmailRegister_page.dart';
import 'SendCodePhoneNumberRegister_page.dart';

class MediumSendCodeRegisterPage extends StatelessWidget {
  const MediumSendCodeRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MediumSendCodePageGeneral(
      textoCuerpoGeneral: "Por medio de la opcion seleccionada, te sera enviado un codigo de confirmacion para poder registrarte.",
      onPressedPantallaEmail: () => Navigator.push(
        context, MaterialPageRoute(
          builder: (context) => const SendCodeEmailRegisterPage())),
      
      onPressedPantallaPassword: () => Navigator.push(
        context, MaterialPageRoute(
          builder: (context) => const SendCodePhoneNumberRegisterPage())),
    );
  }
}