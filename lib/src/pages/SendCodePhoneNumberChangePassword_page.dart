// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../widgets/widgets_page_general/SendCode_general.dart';
import 'CodeOTPPhoneNumberChangePassword_page.dart';

class SendCodePhoneNumberChangePasswordPage extends StatefulWidget {
  const SendCodePhoneNumberChangePasswordPage({super.key});

  @override
  State<SendCodePhoneNumberChangePasswordPage> createState() => _SendCodePhoneNumberChangePasswordPageState();
}

class _SendCodePhoneNumberChangePasswordPageState extends State<SendCodePhoneNumberChangePasswordPage> {
  
  TextEditingController ctrlPhoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SendCodePageGeneral(
      tituloGeneral: "ENVIO DE CODIGO",
      textoCuerpoGeneral: "Ingrese un número de teléfono para enviar el codigo",
      textoFormulario: "Número de Teléfono",
      nombreCtrl: ctrlPhoneNumber,
      ruta: "/codeOTPPhoneNumberChangePassword",
    );
  }
}