import 'package:flutter/material.dart';

import '../widgets/widgets_page_general/SendCode_general.dart';
import 'CodeOTPPhoneNumber_page.dart';
import 'Password_page.dart';

class SendCodePhoneNumberPage extends StatefulWidget {
  const SendCodePhoneNumberPage({super.key});

  @override
  State<SendCodePhoneNumberPage> createState() => _SendCodePhoneNumberPageState();
}

class _SendCodePhoneNumberPageState extends State<SendCodePhoneNumberPage> {
  
  TextEditingController ctrlPhoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SendCodePageGeneral(
      tituloGeneral: "ENVIO DE CODIGO",
      textoCuerpoGeneral: "Ingrese un número de teléfono para enviar el codigo",
      textoFormulario: "Número de Teléfono",
      nombreCtrl: ctrlPhoneNumber,
      onPressedPantallaPasar: () => Navigator.push(
        context,
        MaterialPageRoute( builder: (context) => CodeOTPPhoneNumberPage())
      ),
    );
  }
}