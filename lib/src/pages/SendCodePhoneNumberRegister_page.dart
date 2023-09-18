// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../widgets/widgets_page_general/SendCode_general.dart';

class SendCodePhoneNumberRegisterPage extends StatefulWidget {
  const SendCodePhoneNumberRegisterPage({super.key});

  @override
  State<SendCodePhoneNumberRegisterPage> createState() => _SendCodePhoneNumberRegisterPageState();
}

class _SendCodePhoneNumberRegisterPageState extends State<SendCodePhoneNumberRegisterPage> {
  
  TextEditingController ctrlPhoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SendCodePageGeneral(
      tituloGeneral: "ENVIO DE CODIGO",
      textoCuerpoGeneral: "Ingrese un número de teléfono para enviar el codigo",
      textoFormulario: "Número de Teléfono",
      nombreCtrl: ctrlPhoneNumber,
      ruta: "/codeOTPPhoneNumberRegister",
    );
  }
}