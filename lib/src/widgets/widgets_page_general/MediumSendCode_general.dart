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
        leading: const ArrowRouter(activeArrow: "1",),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              titulo("ESCOGE UN MEDIO DE CONFIRMACIÓN"),
              
              const SizedBox(
                height: 45,
              ),
      
              textoCuerpo(textoCuerpoGeneral, CustomColors.colorNegro),
              
              const SizedBox(
                height: 45,
              ),
      
              // Boton para el correo electronico
              ButtonPrimary(
                iconButton: const Icon(
                  Icons.email_outlined,
                  color: CustomColors.colorBlanco,
                  size: 50.0,
                ),
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
                iconButton: const Icon(
                  Icons.sms,
                  color: CustomColors.colorBlanco,
                  size: 50.0,
                ),
                textButton: "Teléfono Celular",
                colorBox: CustomColors.colorAmarilloMostaza,
                widthButton: MediaQuery.of(context).size.width,
                onPressed: () => context.push(rutaPantallaPassword),
              ),
            ],
          ),
        ),
      ),
    );
  }
}