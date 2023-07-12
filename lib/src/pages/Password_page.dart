import 'package:flutter/material.dart';

import '../assets/buttons.dart';
import '../assets/titulo.dart';
import '../colors/colors.dart';

class PasswordPage extends StatefulWidget {
  @override
  createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  // Variable para el estilo del texto
  final TextStyle _estiloTexto = new TextStyle(fontSize: 25);

  final focusControllerOne = TextEditingController();
  final focusControllerTwo = TextEditingController();
  final focusControllerThree = TextEditingController();
  final focusControllerFour = TextEditingController();
  final focusControllerFive = TextEditingController();
  final focusControllerSix = TextEditingController();
  
  // Instanciación de cada uno de los campos "FocusNode" (Cambiar de campo automaticamente)
  late FocusNode focusNode1;
  late FocusNode focusNode2;
  late FocusNode focusNode3;
  late FocusNode focusNode4;
  late FocusNode focusNode5;
  late FocusNode focusNode6;

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
        backgroundColor: CustomColors.colorAppBar, // Color del AppBar por medio de la clase "CustomColors"
        
      ),

      // ---- Cuerpo o contenido de la aplicación "body" ----
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20), // Separación entre todos los widgets y el borde del celular
          child: Column( // Se acomoda el contenido en columna

            mainAxisAlignment:
                MainAxisAlignment.center, // Define la posición de los widgets
            
            children: <Widget>[ 

              titulo("Cambiar Contraseña"),

              // ---- Agregar un espacio ----
              SizedBox(
                height: 25.0,
              ),

              // ---- Texto 1 ----
              Align(
                //alignment: Alignment(-1.0, 0.0),
                alignment: Alignment.center,
                child: Text(
                  "Ingresé el codigo que fue enviado a su correo",
                  style: _estiloTexto,
                  textAlign: TextAlign.center,
                ),
              ),

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
                _inputCode("*", focusNode1, focusControllerOne, focusNode2),
                _inputCode("*", focusNode2, focusControllerTwo, focusNode3),
                _inputCode("*", focusNode3, focusControllerThree, focusNode4),
                _inputCode("*", focusNode4, focusControllerFour, focusNode5),
                _inputCode("*", focusNode5, focusControllerFive, focusNode6),
                _inputCode("*", focusNode6, focusControllerSix, focusNode6),
              ],
              ),

              // ---- Agregar un espacio ----
              SizedBox(
                height: 25.0,
              ),

              // ---- Texto para un link si se le olvido la contrasenia ----
              Align(
                //alignment: Alignment(-1.0, 0.0),
                alignment: Alignment.center,
                child: _buttonLink("Click aquí, para reenviar codigo"),
              ),

              // ---- Agregar un espacio ----
              SizedBox(
                height: 25.0,
              ),

              // ---- Boton "Comprobar" ----
              boton_orange("Comprobar", Color.fromRGBO(255, 182, 0, 1)),              

            ],
          ),
        ),
      ),
    );
  }

  void requestFocus(BuildContext context, FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
  }

  // ---- Widget para un boton transparente para los links ----
  Widget _buttonLink(String textoLink) {
    return TextButton(
      onPressed: () {
          /*
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NULL),
          );
          */
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              Colors.transparent) // Define el fondo transparente
          ),
      child: Text(
        textoLink, // Agrega el texto
        style: TextStyle(
          fontSize: 18, // Tamaño del texto
          color: CustomColors.colorLink, // Color del texto
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  // ---- Widget para el campos de texto de los codigos de confirmacion  ----
  Widget _inputCode(String texto, FocusNode nombreFocus, final nombreController, FocusNode cambiarFocus) {
    return Container(
      // Permite definir el diseño de la caja de texto "BoxDecoration"
      decoration: BoxDecoration(
        color: Color.fromRGBO(217, 217, 217, 1), // Color del input
        borderRadius:
            BorderRadius.circular(10.0), // Define los bordes redondeados
        border: Border.all(
          // Define el grosor y color de borde
          color: Colors.black,
          width: 1.0,
        ),
      ),
      // Espaciado entre el borde y el contenido
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 17.0),
      //margin: EdgeInsets.symmetric(horizontal: 10.0),

      // Uso de un input (Campo de texto)
      
      child: ListView(
        children: <Widget> [
          TextFormField(

            keyboardType: TextInputType.number, // Tipo de dato del campo

            controller: nombreController,
        
            //inputFormatters: [LengthLimitingTextInputFormatter(1),], // Limitar cantidad caracteres
            style: TextStyle(fontSize: 25,), // Tamanio del texto

            // https://stackoverflow.com/questions/63499959/how-can-i-make-textfield-with-hyphen-at-certain-places-of-input-number-in-flutte

            decoration: InputDecoration.collapsed(/* Quita la linea que viene por 
                                                  defecto en el input "InputDecoration.collapsed" */
              hintText: texto, // Place holder en el input

            ),

            focusNode: nombreFocus, // Uso de cada Focus
            onChanged: (String cantidadCaracteres) {
              if (cantidadCaracteres.length == 1) {
                nombreFocus.unfocus();
                FocusScope.of(context).requestFocus(cambiarFocus);
              }
            },
            
          ),
        ],
        
      ),

        // Definir largo y alto de los campos
        height: 60,
        width: 50,
            
      margin: EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 5,
      ),
    );
  }
}
