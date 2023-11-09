// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../utils/TextFormatter.dart';
import '../widgets/buttons.dart';
import '../widgets/input.dart';
import '../colors/colors.dart';
import '../common/enumValidate.dart';

class UpdateUserPage extends StatefulWidget {
  const UpdateUserPage({super.key});
  @override
  State<UpdateUserPage> createState() => _UpdateUserPageState();
}

class _UpdateUserPageState extends State<UpdateUserPage> {

  // Controladores que se manejan en cada formulario
  TextEditingController ctrlName = TextEditingController();
  TextEditingController ctrlApellido = TextEditingController();
  TextEditingController ctrlPhoneNumber = TextEditingController();
  TextEditingController ctrlEmail = TextEditingController();
  TextEditingController ctrlPassword = TextEditingController();
  
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>(); /* Clave que se utiliza para identificar y 
                                                    controlar el estado o validacion de un formulario  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra principal de navegación "AppBar"
      appBar: AppBar(
        backgroundColor: CustomColors
            .colorBlanco, // Color del AppBar por medio de la clase "CustomColors"
      ),

      // ---- Cuerpo o contenido de la aplicación "body" ----
      body: SizedBox(
        child: Form(
          key: _keyForm, // Define un formulario con una llave para controlarlo
          child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 25.0,
          ),
          children: <Widget>[
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              tituloEncabezadoUno("Editar Usuario"),

              // input de nombre
              InputTextValidations(
                textoInput: "Nombre",
                inputType: TextInputType.name,
                controller: ctrlName,
                validateText: ValidateText.name,
                imageIcon: 'assets/icons/name.svg',
              ),

              // input de apellido
              InputTextValidations(
                textoInput: "Apellido",
                inputType: TextInputType.name,
                controller: ctrlApellido,
                validateText: ValidateText.lastname,
                imageIcon: 'assets/icons/name.svg',
              ),

              // input de email
              InputTextValidations(
                textoInput: "Correo electronico",
                inputType: TextInputType.emailAddress,
                controller: ctrlEmail,
                validateText: ValidateText.email,
                imageIcon: 'assets/icons/email.svg',
              ),

              // input de numero de telefono
              InputTextValidations(
                textoInput: "Número de telefono",
                inputType: TextInputType.number,
                controller: ctrlPhoneNumber,
                validateText: ValidateText.phoneNumber,
                imageIcon: 'assets/icons/phone_number.svg',
              ),

              // input del password
              InputPasswordValidations(
                textoInput: "Password",
                inputType: TextInputType.text,
                controller: ctrlPassword,
                validateText: ValidateText.password,
                imageIcon: 'assets/icons/password.svg',
              ),

              const SizedBox(
                height: 25.0,
              ),
              
              ButtonPrimary(
                textButton: "Guardar",
                colorBox: CustomColors.colorAmarilloMostaza,
                widthButton: MediaQuery.of(context).size.width,
                onPressed: () {},
              ),
            ]),
            
            // boton para saber si se escribio correctamente el contenido de cada input
            TextButton(onPressed: save, child: const Text("Guardar")),
          ]
        ),
      ) 
      ),
    );
  }
  // funcion para saber si los inputs tienen correcto su contenido
  save() {
    if (_keyForm.currentState!.validate()) {// si esta correcto el contenido de cada input
    }
  }
}
