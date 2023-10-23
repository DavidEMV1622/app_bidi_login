// ignore_for_file: file_names

import 'package:app_credibanco_login/src/widgets/buttons.dart';
import 'package:app_credibanco_login/src/widgets/input.dart';
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
              tituloEncabezadoUno("Registrate"),
          
              // input de nombre
              InputTextValidations(
                textoInput: "Nombre",
                inputType: TextInputType.name,
                controller: ctrlName,
                validateText: ValidateText.name,
                imageIcon: SvgPicture.asset( 
                      'assets/icons/email.svg',
                      width: 250,
                    ),
              ),
          
              // input de apellido
              InputTextValidations(
                textoInput: "Apellido",
                inputType: TextInputType.name,
                controller: ctrlApellido,
                validateText: ValidateText.lastname,
                imageIcon: SvgPicture.asset( 
                      'assets/icons/email.svg',
                      width: 250,
                    ),
              ),
          
              // input de email
              InputTextValidations(
                textoInput: "Correo electronico",
                inputType: TextInputType.emailAddress,
                controller: ctrlEmail,
                validateText: ValidateText.email,
                imageIcon: SvgPicture.asset( 
                      'assets/icons/email.svg',
                      width: 250,
                    ),
              ),
          
              // input de numero de telefono
              InputTextValidations(
                textoInput: "Número de telefono",
                inputType: TextInputType.number,
                controller: ctrlPhoneNumber,
                validateText: ValidateText.phoneNumber,
                imageIcon: SvgPicture.asset( 
                      'assets/icons/email.svg',
                      width: 250,
                    ),
              ),
          
              // input del password
              InputPasswordValidations(
                textoInput: "Contraseña",
                inputType: TextInputType.text,
                controller: ctrlPassword,
                validateText: ValidateText.password,
              ),
          
              InputPasswordValidations(
                textoInput: "Confirmar Contraseña",
                inputType: TextInputType.text,
                controller: ctrlConfirmPassword,
                validateText: ValidateText.confirmPassword,
                passwordComparar: ctrlPassword,
              ),
          
              const SizedBox(
                height: 25.0,
              ),
          
              ButtonPrimary(
                textButton: "Guardar",
                colorBox: CustomColors.colorAmarilloMostaza,
                widthButton: MediaQuery.of(context).size.width,
                onPressed: save,
              ),
      
              // const SizedBox(
              // height: 25.0,
              // ),
            
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
            
              // const SizedBox(
              //   height: 15.0,
              // ),
            
              BotonLink(
                  textoLink: "¿Ya tienes cuenta?, click aquí",
                  onPressed: () => Navigator.pop(context)
              ),
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

  // Método para mostrar un pop-up con mensaje correcto
  // void _mostrarPopupCorrecto(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return PopUps( // Uso de la clase "PopUps" para mostrar el pop-up
  //         iconoMostrar: Icons.verified_user, 
  //         mensajePopUp: "Te has registrado correctamente", 
  //         onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage())),
  //       );
  //     },
  //   );
  // }

  void _mostrarPopupCorrecto(BuildContext context) {
    DialogUtils.showMyGeneralDialog(context: context, 
    iconoMostrar: Icons.verified_user,
    mensajePopUp: "Te has registrado correctamente",
    onPressed: () => context.push("/loginPage"),
    );
  }

  // // Método para mostrar un pop-up con mensaje de error
  // void _mostrarPopupError(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return PopUps( // Uso de la clase "PopUps" para mostrar el pop-up
  //         iconoMostrar: Icons.error_outline, 
  //         mensajePopUp: "No se pudo registrar", 
  //         onPressed: () => Navigator.of(context).pop(),
  //       );
  //     },
  //   );
  // }

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