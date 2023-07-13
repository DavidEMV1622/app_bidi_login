import 'package:flutter/material.dart';

import '../assets/buttons.dart';
import '../assets/fuentesText/fuentes.dart';
import '../assets/input.dart';
import '../assets/titulo.dart';
import '../colors/colors.dart';

class PasswordPage extends StatefulWidget {
  @override
  createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  // Variable para el estilo del texto
  final TextStyle _estiloTexto = new TextStyle(fontSize: 25);

  // Controlar y manipular el texto dentro de un widget de entrada de texto
  final focusControllerOne = TextEditingController();
  final focusControllerTwo = TextEditingController();
  final focusControllerThree = TextEditingController();
  final focusControllerFour = TextEditingController();
  final focusControllerFive = TextEditingController();
  final focusControllerSix = TextEditingController();
  
  // Instanciación de cada uno de los campos "FocusNode"
  late FocusNode focusNode1;
  late FocusNode focusNode2;
  late FocusNode focusNode3;
  late FocusNode focusNode4;
  late FocusNode focusNode5;
  late FocusNode focusNode6;

  // Cerrar cada focus para no consumir recursos del equipo
  @override
  void dispose() {
    super.dispose();
    focusControllerOne.dispose();
    focusControllerTwo.dispose();
    focusControllerThree.dispose();
    focusControllerFour.dispose();
    focusControllerFive.dispose();
    focusControllerSix.dispose();

    focusNode1.dispose();
    focusNode2.dispose();
    focusNode3.dispose();
    focusNode4.dispose();
    focusNode5.dispose();
    focusNode6.dispose();
  }

  // Creación de los Focus
  @override
  void initState() {
    super.initState();

    focusNode1 = FocusNode();
    focusNode2 = FocusNode();
    focusNode3 = FocusNode();
    focusNode4 = FocusNode();
    focusNode5 = FocusNode();
    focusNode6 = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    // Plantilla principal "Scaffold"
    return Scaffold(
      // Barra principal de navegación "AppBar"
      appBar: AppBar(
        backgroundColor: CustomColors.colorBlanco, // Color del AppBar por medio de la clase "CustomColors"
        
      ),

      // ---- Cuerpo o contenido de la aplicación "body" ----
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20), // Separación entre todos los widgets y el borde del celular
          child: Column( // Se acomoda el contenido en columna

            mainAxisAlignment:
                MainAxisAlignment.center, // Define la posición de los widgets
            
            children: <Widget>[
              
              tituloEncabezadoUno("Cambiar Contraseña"),

              // ---- Agregar un espacio ----
              SizedBox(
                height: 25.0,
              ),

              // ---- Subtitulo ----
              subtituloUno("Ingresé el codigo que fue enviado a su correo"),
              
              // ---- Agregar un espacio ----
              SizedBox(
                height: 25.0,
              ),

              // ---- Campos de textos ----
              // Obtiene 4 parametros que son:
              // 1: dato que se muestra en el place holder
              // 2: nombre del focus
              // 3: nombre del controlador del propio focus
              // 4: nombre del focus que va a cambiar
              Row( mainAxisAlignment:
                MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  inputCode("*", focusNode1, focusControllerOne, focusNode2, context),
                  inputCode("*", focusNode2, focusControllerTwo, focusNode3, context),
                  inputCode("*", focusNode3, focusControllerThree, focusNode4, context),
                  inputCode("*", focusNode4, focusControllerFour, focusNode5, context),
                  inputCode("*", focusNode5, focusControllerFive, focusNode6, context),
                  inputCode("*", focusNode6, focusControllerSix, focusNode6, context),
                ],
              ),

              // ---- Agregar un espacio ----
              SizedBox(
                height: 25.0,
              ),

              // ---- Texto para un link si se le olvido la contrasenia ----
              BotonCambio(textoLink: "Click aquí, para reenviar codigo", textoColor: CustomColors.colorVerdePantano),
              
              // ---- Agregar un espacio ----
              SizedBox(
                height: 25.0,
              ),

              // ---- Boton "Comprobar" ----
              boton_orange("Comprobar", CustomColors.colorAmarilloMostaza),              

            ],
          ),
        ),
      ),
    );
  }

  void requestFocus(BuildContext context, FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
  }
}
