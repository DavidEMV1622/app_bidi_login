import 'package:app_credibanco_login/src/pages/Login_page.dart';
import 'package:flutter/material.dart';

import '../assets/buttons.dart';
import '../assets/fuentesText/fuentes.dart';
import '../assets/input.dart';
import '../assets/titulo.dart';
import '../colors/colors.dart';
import '../common/enumValidate.dart';
import 'Registrar_page.dart';

class PasswordPage extends StatefulWidget {
  @override
  createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  // Variable de tipo boolean para icono de si o no mostrar contrasenia
  bool passenable = true;
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

  GlobalKey<FormState> _keyForm = GlobalKey<
      FormState>(); /* Clave que se utiliza para identificar y controlar
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
          padding: EdgeInsets.all(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InputCodeValidations(
                    textoInput: "*",
                    inputType: TextInputType.number,
                    nombreFocus: focusNode1,
                    nombreController: focusControllerOne,
                    cambiarFocus: focusNode2,
                    validateText: ValidateText.codeOTP
                  ),
                  InputCodeValidations(
                    textoInput: "*",
                    inputType: TextInputType.number,
                    nombreFocus: focusNode2,
                    nombreController: focusControllerTwo,
                    cambiarFocus: focusNode3,
                    validateText: ValidateText.codeOTP
                  ),
                  InputCodeValidations(
                    textoInput: "*",
                    inputType: TextInputType.number,
                    nombreFocus: focusNode3,
                    nombreController: focusControllerThree,
                    cambiarFocus: focusNode4,
                    validateText: ValidateText.codeOTP
                  ),
                  InputCodeValidations(
                    textoInput: "*",
                    inputType: TextInputType.number,
                    nombreFocus: focusNode4,
                    nombreController: focusControllerFour,
                    cambiarFocus: focusNode5,
                    validateText: ValidateText.codeOTP
                  ),
                  InputCodeValidations(
                    textoInput: "*",
                    inputType: TextInputType.number,
                    nombreFocus: focusNode5,
                    nombreController: focusControllerFive,
                    cambiarFocus: focusNode6,
                    validateText: ValidateText.codeOTP
                  ),
                  InputCodeValidations(
                    textoInput: "*",
                    inputType: TextInputType.number,
                    nombreFocus: focusNode6,
                    nombreController: focusControllerSix,
                    cambiarFocus: focusNode6,
                    validateText: ValidateText.codeOTP
                  ),

/*
                  InputCode(
                      texto: "*",
                      nombreFocus: focusNode1,
                      nombreController: focusControllerOne,
                      cambiarFocus: focusNode2),
                  InputCode(
                      texto: "*",
                      nombreFocus: focusNode2,
                      nombreController: focusControllerTwo,
                      cambiarFocus: focusNode3),
                  InputCode(
                      texto: "*",
                      nombreFocus: focusNode3,
                      nombreController: focusControllerThree,
                      cambiarFocus: focusNode4),
                  InputCode(
                      texto: "*",
                      nombreFocus: focusNode4,
                      nombreController: focusControllerFour,
                      cambiarFocus: focusNode5),
                  InputCode(
                      texto: "*",
                      nombreFocus: focusNode5,
                      nombreController: focusControllerFive,
                      cambiarFocus: focusNode6),
                  InputCode(
                      texto: "*",
                      nombreFocus: focusNode6,
                      nombreController: focusControllerSix,
                      cambiarFocus: focusNode6), */
                ],
              ),

              // ---- Agregar un espacio ----
              SizedBox(
                height: 25.0,
              ),

              // ---- Texto para un link si se le olvido la contrasenia ----
              BotonLink(textoLink: "Click aquí, para reenviar codigo"),

              // ---- Agregar un espacio ----
              SizedBox(
                height: 25.0,
              ),

              // ---- Boton "Comprobar" ----
              BtnPrimaery(
                textButton: "Iniciar secion",
                colorBox: Color.fromRGBO(255, 182, 0, 1),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage())),
              ),
              // boton para saber si se escribio correctamente el contenido de cada input
              TextButton(onPressed: save, child: Text("Guardar")),
            ],
          ),
          ),
        ),
      ),
    );
  }
// funcion para saber si los inputs tienen correcto su contenido
  save() {
    if (_keyForm.currentState!.validate()) {
      // si esta correcto el contenido de cada input
    }
  }
}
