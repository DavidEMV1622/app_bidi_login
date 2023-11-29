// ignore_for_file: file_names

import 'package:app_credibanco_login/src/colors/colors.dart';
import 'package:app_credibanco_login/src/utils/TextFormatter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/arrow_router.dart';
import '../buttons.dart';

class MediumSendCodePageGeneral extends StatelessWidget {

  final String textoCuerpoGeneral;
  final String rutaPantallaEmail;
  final String rutaPantallaPassword;
  const MediumSendCodePageGeneral({
    super.key, 
    required this.textoCuerpoGeneral, 
    required this.rutaPantallaEmail, 
    required this.rutaPantallaPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.colorBlanco,
        elevation: 0.0,
        leading: const ArrowRouter(),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.10,
            ),
            
            tituloEncabezadoDos("ESCOGE UN MEDIO DE CONFIRMACIÓN"),
            
            const SizedBox(
              height: 45,
            ),
      
            textoCuerpo(textoCuerpoGeneral),
            
            const SizedBox(
              height: 45,
            ),
      
            // Boton para el correo electronico
            ButtonPrimary(
              iconButton: Icons.email_outlined,
              textButton: "Correo Electronico",
              colorBox: CustomColors.colorAmarilloMostaza,
              widthButton: MediaQuery.of(context).size.width,
              onPressed: () => context.push(rutaPantallaEmail),
            ),
      
            const SizedBox(
              height: 15,
            ),
      
            // Boton para el telefono celular
            ButtonPrimary(
              iconButton: Icons.sms,
              textButton: "Teléfono Celular",
              colorBox: CustomColors.colorAmarilloMostaza,
              widthButton: MediaQuery.of(context).size.width,
              onPressed: () => context.push(rutaPantallaPassword),
            ),
          ],
        ),
      ),
    );
  }
}