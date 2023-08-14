import 'package:flutter/material.dart';

import '../widgets/widgets_page_general/send_code_general.dart';
import 'CodeOTPEmail_page.dart';
import 'Password_page.dart';

class SendCodeEmailPage extends StatefulWidget {
  const SendCodeEmailPage({super.key});

  @override
  State<SendCodeEmailPage> createState() => _SendCodeEmailPageState();
}

class _SendCodeEmailPageState extends State<SendCodeEmailPage> {
  
  TextEditingController ctrlEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SendCodePageGeneral(
      tituloGeneral: "ENVIO DE CODIGO",
      textoCuerpoGeneral: "Ingrese el correo para enviar un codigo",
      textoFormulario: "Correo electronico",
      nombreCtrl: ctrlEmail,
      onPressedPantallaPasar: () => Navigator.push(
        context,
        MaterialPageRoute( builder: (context) => CodeOTPEmailPage())
      ),
    );
  }
}