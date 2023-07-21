import 'package:app_credibanco_login/src/assets/buttons.dart';
import 'package:app_credibanco_login/src/assets/fuentesText/fuentes.dart';
import 'package:app_credibanco_login/src/assets/input.dart';
import 'package:app_credibanco_login/src/colors/colors.dart';
import 'package:app_credibanco_login/src/pages/Login_page.dart';
import 'package:flutter/material.dart';

class chancePassword extends StatefulWidget {
  const chancePassword({super.key});

  @override
  State<chancePassword> createState() => _chancePasswordState();
}

class _chancePasswordState extends State<chancePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment:
                MainAxisAlignment.start, // Define la posición de los widgets
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              tituloEncabezadoUno("CAMBIO DE CONTRASEÑA"),
              SizedBox(
                height: 20.0,
              ),
              subtituloUno("Por Favor ingrese su nueva contraseña"),
              SizedBox(
                height: 45.0,
              ),/*
              PasswordInput(textoContrasenia: "Contraseña"),
              SizedBox(
                height: 15.0,
              ),
              PasswordInput(textoContrasenia: "Confirmar Contraseña"),
              SizedBox(
                height: 25.0,
              ),
              */
              BtnPrimaery(
                textButton: "Guardar Cambios",
                colorBox: Color.fromRGBO(255, 182, 0, 1),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
