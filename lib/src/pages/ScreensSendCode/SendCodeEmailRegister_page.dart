// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../widgets/widgets_page_general/SendCode_general.dart';

class SendCodeEmailRegisterPage extends StatefulWidget {
  const SendCodeEmailRegisterPage({super.key});

  @override
  State<SendCodeEmailRegisterPage> createState() => _SendCodeEmailRegisterPageState();
}

class _SendCodeEmailRegisterPageState extends State<SendCodeEmailRegisterPage> {
  
  TextEditingController ctrlEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SendCodePageGeneral(
      tituloGeneral: "ENVIO DE CODIGO",
      textoCuerpoGeneral: "Ingrese el correo para enviar un codigo de confirmación",
      textoFormulario: "Correo electrónico",
      nombreCtrl: ctrlEmail,
      ruta: "/codeOTPEmaiRegisterPage",
    );
  }
}