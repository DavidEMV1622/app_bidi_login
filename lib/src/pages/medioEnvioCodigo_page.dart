import 'package:app_credibanco_login/src/colors/colors.dart';
import 'package:app_credibanco_login/src/utils/TextFormatter.dart';
import 'package:flutter/material.dart';

import '../widgets/buttons.dart';
import 'Password_page.dart';

class MedioEnvioCodigoPage extends StatelessWidget {
  const MedioEnvioCodigoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.colorBlanco,
        elevation: 0.0,
      ),

      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                titulo("ESCOGE UN MEDIO DE CONFIRMACIÓN"),
                
                SizedBox(
                  height: 45,
                ),
          
                textoCuerpo("Por medio de la opcion seleccionada, te sera enviado un codigo de confirmacion.", CustomColors.colorNegro),
                
                SizedBox(
                  height: 45,
                ),
                BtnPrimaery(
                  iconButton: Icon(
                    Icons.email_outlined,
                    color: CustomColors.colorNegro,
                    size: 50.0,
                  ),
                  textButton: "Correo Electronico",
                  colorBox: Color.fromRGBO(255, 182, 0, 1),
                  widthButton: MediaQuery.of(context).size.width,
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PasswordPage())),
                ),

                SizedBox(
                  height: 15,
                ),

                BtnPrimaery(
                  iconButton: Icon(
                    Icons.sms,
                    color: CustomColors.colorNegro,
                    size: 50.0,
                  ),
                  textButton: "Teléfono Celular",
                  colorBox: Color.fromRGBO(255, 182, 0, 1),
                  widthButton: MediaQuery.of(context).size.width,
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PasswordPage())),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}