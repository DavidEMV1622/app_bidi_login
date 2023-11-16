// ignore_for_file: file_names

import 'package:app_credibanco_login/src/Back-end/Dto/User/update_user.dart';
import 'package:app_credibanco_login/src/widgets/buttons.dart';
import 'package:app_credibanco_login/src/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../config/arrow_router.dart';
import '../common/enumValidate.dart';
import '../utils/TextFormatter.dart';

import '../colors/colors.dart';
import '../widgets/pop-up.dart';

class UpdateUserPage extends StatefulWidget {
  const UpdateUserPage({super.key});
  @override
  State<UpdateUserPage> createState() => _UpdateUserPageState();
}

class _UpdateUserPageState extends State<UpdateUserPage> {
  // Variable de tipo boolean para icono de si o no mostrar contrasenia
  bool passenable = true;

  // Variable para saber si el contenido de los controladores (ctrlConfirmPassword, ctrlPassword) son iguales
  bool confirmPasswordTrueOrFalse = true;

  // Controladores que se manejan en cada formulario
  TextEditingController ctrlUserProfile = TextEditingController();
  TextEditingController ctrlName = TextEditingController();
  TextEditingController ctrlApellido = TextEditingController();
  TextEditingController ctrlEmail = TextEditingController();
  
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
        leading: const ArrowRouter(activeArrow: "1",),
      ),

      // ---- Cuerpo o contenido de la aplicación "body" ----
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _keyForm, // Define un formulario con una llave para controlarlo
          child: ListView(
            children: [
              tituloEncabezadoUno("bidi"),
                
              // ---- Agregar un espacio entre los dos widgets (Text, Align)----
              const SizedBox(
                height: 35.0,
              ),
          
              Align(
                alignment: Alignment.centerLeft,
                child: subtituloUno("Editar Usuario")
              ),

              // input de nombre
              InputTextValidations(
                textoInput: "Perfil de usuario",
                inputType: TextInputType.name,
                controller: ctrlUserProfile,
                validateText: ValidateText.password,
                imageIcon: 'assets/icons/user_profile.svg',
              ),

              const SizedBox(
                height: 15.0,
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
                height: 35.0,
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
                height: 35.0,
              ),
          
              ButtonPrimary(
                textButton: "Guardar",
                colorBox: CustomColors.colorAmarilloMostaza,
                widthButton: MediaQuery.of(context).size.width,
                onPressed: save,
              ),
            ]
          ),
        ),
      ),
    );
  }
  // funcion para saber si los inputs tienen correcto su contenido
  save() async {
    if (_keyForm.currentState!.validate()) {

      final response = await updateUser(
        username: ctrlUserProfile.text, 
        firstName: ctrlName.text, 
        lastName: ctrlApellido.text, 
        email: ctrlEmail.text, 
        context: context,
      );

      if (response == 201) {
        print("Se edito el usuario");
        _mostrarPopupCorrecto(context);
      
      } else if (response == 409) {
        print("El usuario ya existe con esos datos");
        _mostrarPopupError(context);
      }
      //_mostrarPopupCorrecto(context); // mostrar pop-up correcto
    } /* else {
      _mostrarPopupError(context); // mostrar pop-up incorrecto
    } */
  }


  void _mostrarPopupCorrecto(BuildContext context) {
    DialogUtils.showMyGeneralDialog(context: context, 
    iconoMostrar: Icons.verified_user,
    mensajePopUp: "Se ha editado tus datos correctamente",
    //onPressed: () => context.pushReplacement("/loginPage"),
    onPressed: () => context.pushReplacement("/userLogin"),
    );
  }

  void _mostrarPopupError(BuildContext context) {
    DialogUtils.showMyGeneralDialog(context: context, 
      iconoMostrar: Icons.error_outline,
      mensajePopUp: "No se pudo editar los datos",
      onPressed: () {
        context.pop();
      }
    );
  }
}