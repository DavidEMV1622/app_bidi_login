// ignore_for_file: file_names

import 'package:app_credibanco_login/src/pages/Login_page.dart';
import 'package:flutter/material.dart';

import '../utils/TextFormatter.dart';
import '../widgets/buttons.dart';
import '../widgets/input.dart';
import '../widgets/pop-up.dart';
import '../colors/colors.dart';
import '../common/enumValidate.dart';

class PasswordPage extends StatefulWidget {
  
  const PasswordPage({super.key});

  @override
  createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  // Variable de tipo boolean para icono de si o no mostrar contrasenia
  bool passenable = true;

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

  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>(); /* Clave que se utiliza para identificar y controlar
                                                          el estado o validacion de un formulario  */

  @override
  Widget build(BuildContext context) {
    // Plantilla principal "Scaffold"
    return Scaffold(
      // Barra principal de navegación "AppBar"
      appBar: AppBar(
        backgroundColor: CustomColors
            .colorBlanco, // Color del AppBar por medio de la clase "CustomColors"
      ),

      // ---- Cuerpo o contenido de la aplicación "body" ----
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(
              20), // Separación entre todos los widgets y el borde del celular
          child: Form(
            key:
                  _keyForm, // Define un formulario con una llave para controlarlo
            child: Column(
            // Se acomoda el contenido en columna

            mainAxisAlignment:
                MainAxisAlignment.center, // Define la posición de los widgets

            children: <Widget>[
              tituloEncabezadoUno("Cambiar Contraseña"),

              // ---- Agregar un espacio ----
              const SizedBox(
                height: 25.0,
              ),

              // ---- Subtitulo ----
              subtituloUno("Ingresé el codigo que fue enviado a su correo"),

              // ---- Agregar un espacio ----
              const SizedBox(
                height: 25.0,
              ),

              /* ---- Campos de textos ----
              Obtiene 4 parametros que son:
              1: dato que se muestra en el place holder
              2: tipo de teclado a mostrar
              3: nombre del focus
              4: nombre del controlador del propio focus
              5: nombre del focus que va a cambiar 
              6: manejo de las validaciones del formulario 
              7: nombre del focus que cambia al anterior */
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Campo Uno
                  InputCodeValidations(
                    textoInput: "*",
                    inputType: TextInputType.number,
                    nombreFocus: focusNode1,
                    nombreController: focusControllerOne,
                    cambiarFocus: focusNode2,
                    validateText: ValidateText.codeOTP
                  ),
                  // Campo Dos
                  InputCodeValidations(
                    textoInput: "*",
                    inputType: TextInputType.number,
                    nombreFocus: focusNode2,
                    nombreController: focusControllerTwo,
                    cambiarFocus: focusNode3,
                    validateText: ValidateText.codeOTP,
                    cambiarFocusAnterior: focusNode1,
                  ),
                  // Campo Tres
                  InputCodeValidations(
                    textoInput: "*",
                    inputType: TextInputType.number,
                    nombreFocus: focusNode3,
                    nombreController: focusControllerThree,
                    cambiarFocus: focusNode4,
                    validateText: ValidateText.codeOTP,
                    cambiarFocusAnterior: focusNode2,
                  ),
                  // Campo Cuatro
                  InputCodeValidations(
                    textoInput: "*",
                    inputType: TextInputType.number,
                    nombreFocus: focusNode4,
                    nombreController: focusControllerFour,
                    cambiarFocus: focusNode5,
                    validateText: ValidateText.codeOTP,
                    cambiarFocusAnterior: focusNode3,
                  ),
                  // Campo Quinto
                  InputCodeValidations(
                    textoInput: "*",
                    inputType: TextInputType.number,
                    nombreFocus: focusNode5,
                    nombreController: focusControllerFive,
                    cambiarFocus: focusNode6,
                    validateText: ValidateText.codeOTP,
                    cambiarFocusAnterior: focusNode4,
                  ),
                  // Campo Sexto
                  InputCodeValidations(
                    textoInput: "*",
                    inputType: TextInputType.number,
                    nombreFocus: focusNode6,
                    nombreController: focusControllerSix,
                    validateText: ValidateText.codeOTP,
                    cambiarFocusAnterior: focusNode5,
                  ),
                ],
              ),

              // ---- Agregar un espacio ----
              const SizedBox(
                height: 25.0,
              ),

              // ---- Texto para un link si se le olvido la contrasenia ----
              const BotonLink(textoLink: "Click aquí, para reenviar codigo"),

              // ---- Agregar un espacio ----
              const SizedBox(
                height: 25.0,
              ),

              // ---- Boton "Comprobar" ----
              BtnPrimaery(
                textButton: "Guardar cambios",
                colorBox: CustomColors.colorAmarilloMostaza,
                widthButton: MediaQuery.of(context).size.width,
                onPressed: save, // funcion "save" para saber si estan correctos los inputs
              ),
            ],
          ),
          ),
        ),
      ),
    );
  }
// funcion para saber si los inputs tienen correcto su contenido
  save() {
    if (_keyForm.currentState!.validate()) { // si esta correcto todos los campos
      _mostrarPopupCorrecto(context); // mostrar pop-up correcto
    } else {
      _mostrarPopupError(context); // mostrar pop-up incorrecto
    }
  }

  // Método para mostrar un pop-up con mensaje correcto
  void _mostrarPopupCorrecto(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PopUps( // Uso de la clase "PopUps" para mostrar el pop-up
          iconoMostrar: Icons.verified_user, 
          mensajePopUp: "Contraseña cambiada correctamente", 
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage())),
        );
      },
    );
  }

  // Método para mostrar un pop-up con mensaje de error
  void _mostrarPopupError(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PopUps( // Uso de la clase "PopUps" para mostrar el pop-up
          iconoMostrar: Icons.error_outline, 
          mensajePopUp: "Codigo incorrecto o expirado", 
          onPressed: () => Navigator.of(context).pop(),
        );
      },
    );
  }
}
