// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../colors/colors.dart';
import '../utils/TextFormatter.dart';
import 'buttons.dart';

// Clase para mostrar 
class PopUps extends StatelessWidget{

  //CREACION DE PARAMETROS / VARIABLES
  final IconData iconoMostrar;
  final String mensajePopUp;
  final void Function()? onPressed;

  const PopUps(
      {super.key,
      required this.iconoMostrar,
      required this.mensajePopUp,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    // Implementacion general del pop-up
    return Container(
      // Definiendo el color de fondo por detras
      decoration: const BoxDecoration( // Color y redondeo de los bordes de la caja
        color: CustomColors.tonoCeleste_2_Opacity,
      ),
      // Espaciado entre el fondo celeste y campo del pop-up
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      
      // Contenido del widget "BoxDecoration"
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          
          children: <Widget>[
            Container(
              decoration: BoxDecoration( // Definiendo el disenio de fondo
                color: CustomColors.colorBlanco,
                borderRadius: BorderRadius.circular(12.0), 
              ),
              padding: const EdgeInsets.all(20),

              child: Column(
                children: [
                  Icon( // Manejo del icono
                    iconoMostrar,
                    color: CustomColors.colorNegro,
                    size: 150.0,
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  textoCuerpo(mensajePopUp, CustomColors.colorNegro), // Mensaje a mostrar
                  
                  const SizedBox(
                    height: 20,
                  ),
                  
                  BtnPrimaery( // Manejo del boton
                    textButton: "Aceptar",
                    colorBox: CustomColors.colorAmarilloMostaza,
                    widthButton: MediaQuery.of(context).size.width,
                    onPressed: onPressed,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DialogUtils {
  static Future<void> showMyGeneralDialog({
    required BuildContext context, 
    required final IconData iconoMostrar,
    required final String mensajePopUp, 
    final void Function()? onPressed,}) async{

    await showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: false,
      barrierColor: const Color.fromRGBO(0, 175, 170, 0.8),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            width: MediaQuery.of(context).size.width,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Icon( // Manejo del icono
                        iconoMostrar,
                        color: CustomColors.colorNegro,
                        size: 150.0,
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      textoCuerpo(mensajePopUp, CustomColors.colorNegro), // Mensaje a mostrar
                      
                      const SizedBox(
                        height: 20,
                      ),
                      
                      BtnPrimaery( // Manejo del boton
                        textButton: "Aceptar",
                        colorBox: CustomColors.colorAmarilloMostaza,
                        widthButton: MediaQuery.of(context).size.width,
                        onPressed: onPressed,
                      ),
                    ],
                  ),
                ),
              ) 
            ),
          ),
        );
      }
    );
  }
}