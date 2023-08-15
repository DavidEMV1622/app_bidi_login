import 'package:app_credibanco_login/src/widgets/buttons.dart';
import 'package:app_credibanco_login/src/widgets/input.dart';
import 'package:app_credibanco_login/src/colors/colors.dart';
import 'package:app_credibanco_login/src/pages/Login_page.dart';
import 'package:flutter/material.dart';

import '../common/enumValidate.dart';
import '../utils/TextFormatter.dart';
import '../widgets/pop-up.dart';

class ChancePasswordPage extends StatefulWidget {
  const ChancePasswordPage({super.key});

  @override
  State<ChancePasswordPage> createState() => _ChancePasswordPageState();
}

class _ChancePasswordPageState extends State<ChancePasswordPage> {

  // Variable para saber si el contenido de los controladores 
  // (ctrlConfirmPassword, ctrlPassword) son iguales
  bool confirmPasswordTrueOrFalse = true;

  // Controladores que se manejan en las dos contrasenias
  TextEditingController ctrlPassword = TextEditingController();
  TextEditingController ctrlConfirmPassword = TextEditingController();

  GlobalKey<FormState> _keyForm = GlobalKey<FormState>(); /* Clave que se utiliza para identificar y 
                                                    controlar el estado o validacion de un formulario  */


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 0.0,
      ),

      // ---- Cuerpo o contenido de la aplicación "body" ----
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Form(
            key: _keyForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment:
                  MainAxisAlignment.start, // Define la posición de los widgets
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                tituloEncabezadoUno("CAMBIO DE CONTRASEÑA"),
                SizedBox(
                  height: 20.0,
                ),
                
                subtituloUno("Por Favor ingrese su nueva contraseña"),
                
                SizedBox(
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

                SizedBox(
                  height: 20.0,
                ),

                BtnPrimaery(
                  textButton: "Guardar Cambios",
                  colorBox: Color.fromRGBO(255, 182, 0, 1),
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
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PopUps( // Uso de la clase "PopUps" para mostrar el pop-up
          iconoMostrar: Icons.verified_user, 
          mensajePopUp: "Contraseña cambiada correctamente", 
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage())),
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
          mensajePopUp: "Contraseñas invalidas", 
          onPressed: () => Navigator.of(context).pop(),
        );
      },
    );
  }
}
