// ignore_for_file: file_names

import 'package:app_credibanco_login/src/colors/colors.dart';
import 'package:app_credibanco_login/src/widgets/buttons.dart';
import 'package:app_credibanco_login/src/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/arrow_router.dart';
import '../common/enumValidate.dart';
import '../utils/TextFormatter.dart';
import '../widgets/pop-up.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {

  // Variable para saber si el contenido de los controladores 
  // (ctrlConfirmPassword, ctrlPassword) son iguales
  bool confirmPasswordTrueOrFalse = true;

  // Controladores que se manejan en las dos contrasenias
  TextEditingController ctrlPassword = TextEditingController();
  TextEditingController ctrlConfirmPassword = TextEditingController();

  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>(); /* Clave que se utiliza para identificar y 
                                                    controlar el estado o validacion de un formulario  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.colorBlanco,
        elevation: 0.0,
        leading: const ArrowRouter(activeArrow: "1",),
      ),

      // ---- Cuerpo o contenido de la aplicación "body" ----
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _keyForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment:
                  MainAxisAlignment.start, // Define la posición de los widgets
              children: <Widget>[
                const SizedBox(
                  height: 20.0,
                ),
                tituloEncabezadoUno("CAMBIO DE CONTRASEÑA"),
                const SizedBox(
                  height: 20.0,
                ),
                
                subtituloUno("Por favor, ingrese su nueva contraseña"),
                
                const SizedBox(
                  height: 20.0,
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
                  height: 20.0,
                ),

                BtnPrimaery(
                  textButton: "Guardar Cambios",
                  colorBox: CustomColors.colorAmarilloMostaza,
                  widthButton: MediaQuery.of(context).size.width,
                  onPressed: save,
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
    if (_keyForm.currentState!.validate()) {// si esta correcto el contenido de cada input
      _mostrarPopupCorrecto(context); // mostrar pop-up correcto
    } else {
      _mostrarPopupError(context); // mostrar pop-up incorrecto
    }
  }

  // Método para mostrar un pop-up con mensaje correcto
  void _mostrarPopupCorrecto(BuildContext context) {
    DialogUtils.showMyGeneralDialog(context: context, 
    iconoMostrar: Icons.verified_user,
    mensajePopUp: "Contraseña cambiada correctamente",
    onPressed: () => context.push("/loginPage"),
    );
  }

  // Método para mostrar un pop-up con mensaje de error
  void _mostrarPopupError(BuildContext context) {
    DialogUtils.showMyGeneralDialog(context: context, 
      iconoMostrar: Icons.error_outline,
      mensajePopUp: "Contraseñas invalidas",
      onPressed: () {
        context.pop();
      }
    );
  }
}
