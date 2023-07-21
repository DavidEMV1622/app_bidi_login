import 'package:app_credibanco_login/src/assets/titulo.dart';
import 'package:app_credibanco_login/src/assets/titulo.dart';

import 'package:flutter/material.dart';
import '../assets/buttons.dart';
import '../assets/input.dart';
import '../colors/colors.dart';
import 'Password_page.dart';
import 'Registrar_page.dart';

class SendCodePassword extends StatefulWidget {
  const SendCodePassword({super.key});
  @override
  State<SendCodePassword> createState() => _SendCodePasswordState();
}

class _SendCodePasswordState extends State<SendCodePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColors.colorBlanco,
        ),
        body: Container(
          child: ListView(
            padding: EdgeInsets.all(15),
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 55.0,
                  ),
                  titulo("ENVIO DE CODIGO"),
                  SizedBox(
                    height: 45,
                  ),
                  Text(
                    "Ingrese el correo para enviar un codigo",
                    style: TextStyle(fontSize: 32),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  /*
                  InputText(
                    textoInput: "ejemplo@ejemplo.com",
                    inputType: TextInputType.emailAddress,
                  ),
                  */
                  SizedBox(
                    height: 45,
                  ),
                  BtnPrimaery(
                    textButton: "Verificar",
                    colorBox: Color.fromRGBO(255, 182, 0, 1),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PasswordPage())),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
