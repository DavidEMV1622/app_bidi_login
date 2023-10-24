import 'package:flutter/material.dart';
import '../colors/colors.dart';

// ---- Clase para el boton general principal ----
class BtnPrimaery extends StatelessWidget {
  //CREACION DE PARAMETROS / VARIABLES
  final Icon? iconButton;
  final String textButton;
  final Color colorBox;
  final BoxBorder? border;
  final double widthButton;
  final void Function()? onPressed;
  const BtnPrimaery(
      {super.key,
      this.iconButton,
      required this.textButton,
      required this.colorBox,
      this.border,
      required this.widthButton,
      this.onPressed
    });

  //IMPLEMENTACION DE VARIABLES
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorBox, // Color del campo del propio input
        border: border, // Define si va a tener un borde o no dependiendo si se le agrega como parametro
        borderRadius: BorderRadius.circular(10), // Borde del campo
      ),
      child: MaterialButton(
        minWidth: widthButton, // largo del botonque abarque toda la pantalla
        //height: 60, // Ancho del boton

        onPressed: onPressed, // Evento al presionar el boton

        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),

        // Agregar texto dentro del boton
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (iconButton != null)
              iconButton!,
            
            if (iconButton != null)
              const SizedBox(
                width: 20,
              ),

            Text(
              textButton,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class ButtonPrimary extends StatefulWidget {
  final IconData? iconButton;
  final String textButton;
  final Color colorBox;
  final BorderSide? border;
  final double widthButton;
  final void Function()? onPressed;
  
  const ButtonPrimary({
    super.key,
    required this.textButton,
    this.iconButton, this.onPressed, 
    required this.colorBox, 
    this.border, 
    required this.widthButton,
  });

  @override
  State<ButtonPrimary> createState() => _ButtonPrimaryState();
}

class _ButtonPrimaryState extends State<ButtonPrimary> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: MediaQuery.of(context).size.width,
      width: MediaQuery.of(context).size.width, // Toma todo el largo de la pantalla

      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ButtonStyle( 

          padding: const MaterialStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 20, vertical: 20,)
          ),

          foregroundColor: const MaterialStatePropertyAll(CustomColors.colorBlanco), // Define el color del texto
          textStyle: const MaterialStatePropertyAll(TextStyle(fontSize: 20)), // Manejo de tamaño, fuente, entre otras propiedades del texto
          backgroundColor: MaterialStatePropertyAll(widget.colorBox),
          shape: MaterialStatePropertyAll( // Maneja la forma y el borde del boton
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(27.5), side: widget.border ?? const BorderSide(color: Colors.transparent)),

          ),
          elevation: const MaterialStatePropertyAll(0.0), // Maneja la sombra del boton
          
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (widget.iconButton != null)
              Icon(
                widget.iconButton,
                color: CustomColors.colorBlanco,
                size: 30.0,
              ),
            
            if (widget.iconButton != null)
              const SizedBox(
                width: 20,
              ),

            Text(
              widget.textButton,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// ---- Clase para un boton estilo link ----
class BotonLink extends StatelessWidget {
  //CREACION DE PARAMETROS / VARIABLES
  final String textoLink;
  final void Function()? onPressed;
  const BotonLink({super.key, required this.textoLink, this.onPressed});

  //IMPLEMENTACION DE VARIABLES
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed, // Evento al presionar el boton
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all( Colors.transparent) // Define el fondo del boton transparente (sin color)
          ),

      // ---- Manejo del texto ----
      child: Text(
        textoLink,
        style: const TextStyle(
          fontSize: 15,
          color: CustomColors.colorVerdePantano,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}