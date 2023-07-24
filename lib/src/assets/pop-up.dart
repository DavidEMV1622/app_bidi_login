import 'package:flutter/material.dart';

import '../colors/colors.dart';
import 'buttons.dart';
import 'fuentesText/fuentes.dart';

// Clase para mostrar 
class PopUps extends StatelessWidget{

  //CREACION DE PARAMETROS / VARIABLES
  final IconData iconoMostrar;
  final String mensajePopUp;
  //final Color colorBox;
  //final BoxBorder? border;
  final void Function()? onPressed;

  const PopUps(
      {super.key,
      required this.iconoMostrar,
      required this.mensajePopUp,
      //required this.colorBox,
      //this.border,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    // Implementacion general del pop-up
    return Container(
      // Definiendo el diseño del pop-up por detras
      decoration: BoxDecoration( // Color y redondeo de los bordes de la caja
        color: CustomColors.tonoCeleste_2_Opacity,
        borderRadius: BorderRadius.circular(4.0),
        
      ),
      // Espaciado entre el fondo celeste y campo del pop-up
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      
      // Contenido del widget "BoxDecoration" fondo celeste
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: CustomColors.colorBlanco,
                  borderRadius: BorderRadius.circular(12.0), 
                ),
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),

                child: Center(
                  child: Column(
                    children: [
                      Icon(
                        iconoMostrar,
                        color: CustomColors.colorNegro,
                        size: 150.0,
                      ),
                      subtituloUno(mensajePopUp),
                      BtnPrimaery(
                        textButton: "Aceptar",
                        colorBox: Color.fromRGBO(255, 182, 0, 1),
                        onPressed: onPressed,
                      ),
                    ],
                  ), 
                ),
              )
            ],
          ),
        ),
      ),
      /*
      child: AlertDialog(
        icon: iconoMostrar, // icono a mostrar
        content: Text(mensajePopUp), // Contenido a mostrar
        // Acciones del boton
        actions: <Widget>[
          TextButton(
            onPressed: onPressed,
            child: Text('Aceptar'),
          ),
        ],
      ),
      */
    );
  } 
}