// ignore_for_file: file_names

import 'package:app_credibanco_login/src/widgets/buttons.dart';
import 'package:app_credibanco_login/src/widgets/input.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../common/enumValidate.dart';
import '../utils/TextFormatter.dart';

import '../colors/colors.dart';
import '../widgets/pop-up.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Variable de tipo boolean para icono de si o no mostrar contrasenia
  bool passenable = true;

  // Variable para saber si el contenido de los controladores (ctrlConfirmPassword, ctrlPassword) son iguales
  bool confirmPasswordTrueOrFalse = true;

  // Controladores que se manejan en cada formulario
  TextEditingController ctrlName = TextEditingController();
  TextEditingController ctrlApellido = TextEditingController();
  TextEditingController ctrlPhoneNumber = TextEditingController();
  TextEditingController ctrlEmail = TextEditingController();
  TextEditingController ctrlPassword = TextEditingController();
  TextEditingController ctrlConfirmPassword = TextEditingController();
  
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>(); /* Clave que se utiliza para identificar y 
                                                    controlar el estado o validacion de un formulario  */

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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _keyForm, // Define un formulario con una llave para controlarlo
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [
              tituloEncabezadoUno("bidi"),
                
              // ---- Agregar un espacio entre los dos widgets (Text, Align)----
              const SizedBox(
                height: 35.0,
              ),
          
              Align(
                alignment: Alignment.centerLeft,
                child: subtituloUno("Registrate")
              ),
          
              // input de nombre
              InputTextValidations(
                textoInput: "Nombre",
                inputType: TextInputType.name,
                controller: ctrlName,
                validateText: ValidateText.name,
                imageIcon: 'assets/icons/name.svg',
              ),

              const SizedBox(
                height: 15.0,
              ),
          
              // input de apellido
              InputTextValidations(
                textoInput: "Apellido",
                inputType: TextInputType.name,
                controller: ctrlApellido,
                validateText: ValidateText.lastname,
                imageIcon: 'assets/icons/name.svg',
              ),

              const SizedBox(
                height: 15.0,
              ),
          
              // input de email
              InputTextValidations(
                textoInput: "Correo electronico",
                inputType: TextInputType.emailAddress,
                controller: ctrlEmail,
                validateText: ValidateText.email,
                imageIcon: 'assets/icons/email.svg',
              ),

              const SizedBox(
                height: 15.0,
              ),
          
              // input de numero de telefono
              InputTextValidations(
                textoInput: "Número de telefono",
                inputType: TextInputType.number,
                controller: ctrlPhoneNumber,
                validateText: ValidateText.phoneNumber,
                imageIcon: 'assets/icons/phone_number.svg',
              ),

              const SizedBox(
                height: 15.0,
              ),
          
              // input del password
              InputPasswordValidations(
                textoInput: "Contraseña",
                inputType: TextInputType.text,
                controller: ctrlPassword,
                validateText: ValidateText.password,
                imageIcon: 'assets/icons/password.svg',
              ),

              const SizedBox(
                height: 15.0,
              ),
          
              InputPasswordValidations(
                textoInput: "Confirmar Contraseña",
                inputType: TextInputType.text,
                controller: ctrlConfirmPassword,
                validateText: ValidateText.confirmPassword,
                passwordComparar: ctrlPassword,
                imageIcon: 'assets/icons/password.svg',
              ),
          
              const SizedBox(
                height: 35.0,
              ),
          
              ButtonPrimary(
                textButton: "Guardar",
                colorBox: CustomColors.colorAmarilloMostaza,
                widthButton: MediaQuery.of(context).size.width,
                onPressed: save,
              ),
      
              const SizedBox(
                height: 25.0,
              ),
            
              Row(children: <Widget>[
                const Expanded(
                  child: Divider(
                  color: CustomColors.colorNegro,
                  thickness: 1,
                )),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: const Text("O"),
                ),
                const Expanded(
                  child: Divider(
                  color: CustomColors.colorNegro,
                  thickness: 1,
                )),
              ]),
            
              const SizedBox(
                height: 25.0,
              ),
            
              RichText(
                text: TextSpan(
                  text: "¿Ya tienes cuenta en bidi? ",
                  style: const TextStyle(
                    fontSize: 15,
                    color: CustomColors.colorGris_1,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Inicia sesión aquí',
                      style: const TextStyle(
                        fontSize: 15,
                        color: CustomColors.colorVerdePantano,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.pop(context);
                        },
                    ),
                  ],
                ),
              )
            ]
          ),
        ),
      ),
    );
  }
  // funcion para saber si los inputs tienen correcto su contenido
  save() {
    if (_keyForm.currentState!.validate()) {// si esta correcto el contenido de cada input
      _mostrarPopupCorrecto(context); // mostrar pop-up correcto
    } else {
      _mostrarPopupError(context); // mostrar pop-up incorrecto
    }
  }

  void _mostrarPopupCorrecto(BuildContext context) {
    DialogUtils.showMyGeneralDialog(context: context, 
    iconoMostrar: Icons.verified_user,
    mensajePopUp: "Te has registrado correctamente",
    onPressed: () => context.pushReplacement("/loginPage"),
    );
  }

  // Método para mostrar un pop-up con mensaje de error
  void _mostrarPopupError(BuildContext context) {
    DialogUtils.showMyGeneralDialog(context: context, 
      iconoMostrar: Icons.error_outline,
      mensajePopUp: "No se pudo registrar",
      onPressed: () {
        context.pop();
      }
    );
  }
}