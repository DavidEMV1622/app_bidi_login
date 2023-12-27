// ignore_for_file: file_names

import 'package:app_credibanco_login/src/Back-end/Dto/User/user_DTO.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../Back-end/Dto/User/update_password.dart';
import '../colors/colors.dart';
import '../common/enumValidate.dart';
import '../utils/TextFormatter.dart';
import 'buttons.dart';
import 'input.dart';

// Clase para mostrar 
class PopUps extends StatelessWidget{

  //CREACION DE PARAMETROS / VARIABLES
  final IconData iconoMostrar;
  final String mensajePopUp;
  final void Function()? onPressed;

  const PopUps(
      {super.key,
      required this.iconoMostrar,
      required this.mensajePopUp,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    // Implementacion general del pop-up
    return Container(
      // Definiendo el color de fondo por detras
      decoration: const BoxDecoration( // Color y redondeo de los bordes de la caja
        color: CustomColors.tonoCeleste_2_Opacity,
      ),
      // Espaciado entre el fondo celeste y campo del pop-up
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      
      // Contenido del widget "BoxDecoration"
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          
          children: <Widget>[
            Container(
              decoration: BoxDecoration( // Definiendo el disenio de fondo
                color: CustomColors.colorBlanco,
                borderRadius: BorderRadius.circular(12.0), 
              ),
              padding: const EdgeInsets.all(20),

              child: Column(
                children: [
                  Icon( // Manejo del icono
                    iconoMostrar,
                    color: CustomColors.colorNegro,
                    size: 150.0,
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  textoCuerpo(mensajePopUp), // Mensaje a mostrar
                  
                  const SizedBox(
                    height: 20,
                  ),
                  
                  BtnPrimaery( // Manejo del boton
                    textButton: "Aceptar",
                    colorBox: CustomColors.colorAmarilloMostaza,
                    widthButton: MediaQuery.of(context).size.width,
                    onPressed: onPressed,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DialogUtils {
  static Future<void> showMyGeneralDialog({
    required BuildContext context, 
    required final IconData iconoMostrar,
    required final String mensajePopUp, 
    final void Function()? onPressed,}) async{

    await showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: false,
      barrierColor: const Color.fromRGBO(0, 175, 170, 0.8),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            width: MediaQuery.of(context).size.width,
            child: Card(
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Icon( // Manejo del icono
                        iconoMostrar,
                        color: CustomColors.colorNegro,
                        size: 150.0,
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      textoCuerpo(mensajePopUp), // Mensaje a mostrar
                      
                      const SizedBox(
                        height: 20,
                      ),
                      
                      BtnPrimaery( // Manejo del boton
                        textButton: "Aceptar",
                        colorBox: CustomColors.colorAmarilloMostaza,
                        widthButton: MediaQuery.of(context).size.width,
                        onPressed: onPressed,
                      ),
                    ],
                  ),
                ),
              ) 
            ),
          ),
        );
      }
    );
  }
}


class DialogChangePassword {
  static Future<void> showMyGeneralDialog({
  required BuildContext context,}) async{

    int isVisible = 0;

    TextEditingController ctrlPassword = TextEditingController();
    TextEditingController ctrlConfirmPassword = TextEditingController();
    
    final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

    await showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: false,
      barrierColor: const Color.fromRGBO(0, 175, 170, 0.8),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        // StatefulBuilder, combinacion entre un StatelessWidget y un StatefulsWidget
        //para poder actualizar cambios de estado del popup
        return StatefulBuilder(
          builder: (context, setState) {
            return Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _keyForm,
          
                        child: Column(
                          children: [                  
                            subtituloUno("Cambiar Contraseña"), // Mensaje a mostrar
          
                            const SizedBox(
                              height: 15,
                            ),
          
                            InputPasswordValidations(
                              textoInput: "Contraseña",
                              inputType: TextInputType.text,
                              controller: ctrlPassword,
                              validateText: ValidateText.password,
                              imageIcon: 'assets/icons/password.svg',
                            ),
          
                            const SizedBox(
                              height: 20,
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
                              height: 20,
                            ),

                            AnimatedOpacity(
                              opacity: isVisible == 1 || isVisible == 2 ? 1.0 : 0.0,
                              duration: const Duration(milliseconds: 200),
                              child: isVisible == 1 ? subtituloDos("Contraseña cambiada correctamente", 20, CustomColors.colorVerdeOscuroFuerte) :
                              isVisible == 2 ? subtituloDos("Error al cambiar contraseña, intente de nuevo", 20, CustomColors.colorAmarilloMostaza) :
                              const Text("")
                            ),

                            isVisible != 0 ? const SizedBox(
                              height: 20,
                            ) : const SizedBox(),
                            
                            Row(
                              children: [
                                Expanded(
                                  child: BtnPrimaery( // Manejo del boton
                                    textButton: "Cancelar",
                                    colorBox: CustomColors.colorBlanco,
                                    widthButton: MediaQuery.of(context).size.width,
                                    border: Border.all(width: 0.5),
                                    onPressed: () {
                                      context.pop();
                                    },
                                  ),
                                ),
                      
                                const SizedBox(
                                  width: 20,
                                ),
                                
                                Expanded(
                                  child: BtnPrimaery( // Manejo del boton
                                    textButton: "Guardar",
                                    colorBox: CustomColors.colorAmarilloMostaza,
                                    widthButton: MediaQuery.of(context).size.width,
          
                                    onPressed: () async{

                                      setState(() {
                                        isVisible = 0;
                                      });
                                      
                                      if (_keyForm.currentState!.validate()) {
                                        final response = await updatePasswordDTO(
                                          password: ctrlPassword.text,
                                          context: context,
                                        );
                                        
                                        if (response == 200) {
                                          setState(() {
                                            isVisible = 1;
                                          });
                                          print("Se cambio la contraseña correctamente");
                                          
                                        } else {
                                          setState(() {
                                            isVisible = 2;
                                          });
                                          print("La contraseña no se pudo cambiar");
                                        }
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ) 
                ),
              ),
            );
          }
        );
      }
    );
  }
  
}