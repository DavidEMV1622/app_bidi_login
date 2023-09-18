// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../widgets/widgets_page_general/SendCode_general.dart';

class SendCodeEmailChangePasswordPage extends StatefulWidget {
  const SendCodeEmailChangePasswordPage({super.key});

  @override
  State<SendCodeEmailChangePasswordPage> createState() => _SendCodeEmailChangePasswordPageState();
}

class _SendCodeEmailChangePasswordPageState extends State<SendCodeEmailChangePasswordPage> {
  
  TextEditingController ctrlEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SendCodePageGeneral(
      tituloGeneral: "ENVIO DE CODIGO",
      textoCuerpoGeneral: "Ingrese el correo para enviar un codigo de confirmación",
      textoFormulario: "Correo electrónico",
      nombreCtrl: ctrlEmail,
      ruta: "/codeOTPEmailChangePassword",
    );
  }
}