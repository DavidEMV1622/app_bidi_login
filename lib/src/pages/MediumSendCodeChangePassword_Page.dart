// ignore_for_file: file_names

import 'package:app_credibanco_login/src/pages/SendCodePhoneNumberChangePassword_page.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets_page_general/MediumSendCode_general.dart';
import 'SendCodeEmailChangePassword_page.dart';

class MediumSendCodeChangePasswordPage extends StatelessWidget {
  const MediumSendCodeChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MediumSendCodePageGeneral(
      textoCuerpoGeneral: "Por medio de la opcion seleccionada, te sera enviado un codigo de confirmacion para poder cambiar la contraseña.",
      onPressedPantallaEmail: () => Navigator.push(
        context, MaterialPageRoute(
          builder: (context) => const SendCodeEmailChangePasswordPage())),
      
      onPressedPantallaPassword: () => Navigator.push(
        context, MaterialPageRoute(
          builder: (context) => const SendCodePhoneNumberChangePasswordPage())),
    );
  }
}