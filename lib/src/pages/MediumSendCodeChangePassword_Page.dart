// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../widgets/widgets_page_general/MediumSendCode_general.dart';

class MediumSendCodeChangePasswordPage extends StatelessWidget {
  const MediumSendCodeChangePasswordPage({super.key,});

  @override
  Widget build(BuildContext context) {
    return const MediumSendCodePageGeneral(
      textoCuerpoGeneral: "Por medio de la opción seleccionada, te sera enviado un codigo de confirmación para poder cambiar la contraseña.",
      rutaPantallaEmail: "/sendCodeEmailChangePassword",
      rutaPantallaPassword: "/sendCodePhoneNumberChangePassword",
    );
  }
}