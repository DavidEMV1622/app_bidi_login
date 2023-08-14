import 'package:flutter/material.dart';

import '../widgets/widgets_page_general/send_code_general.dart';
import 'Password_page.dart';

class SendCodePasswordPage extends StatefulWidget {
  const SendCodePasswordPage({super.key});

  @override
  State<SendCodePasswordPage> createState() => _SendCodePasswordPageState();
}

class _SendCodePasswordPageState extends State<SendCodePasswordPage> {
  
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
        MaterialPageRoute( builder: (context) => PasswordPage())
      ),
    );
  }
}