import 'package:flutter/material.dart';

import '../colors/colors.dart';

// Clase para mostrar 
class PopUps extends StatelessWidget{

  //CREACION DE PARAMETROS / VARIABLES
  final Icon iconoMostrar;
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
      // Espaciado entre el borde y el contenido
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      
      // Contenido del widget "BoxDecoration"
      child: AlertDialog(
        icon: iconoMostrar, // icono a mostrar
        content: Text(mensajePopUp), // Contenido a mostrar en el pop-up
        // Acciones del boton
        actions: <Widget>[
          TextButton(
            onPressed: onPressed,
            child: Text('Aceptar'),
          ),
        ],
      ),
    );
    
    /* AlertDialog(
      icon: iconoMostrar, // icono a mostrar
      content: Text(mensajePopUp), // Contenido a mostrar en el pop-up
      // Acciones del boton
      actions: <Widget>[
        TextButton(
          onPressed: onPressed,
          child: Text('Cerrar'),
        ),
      ],
    ); */
  } 
}