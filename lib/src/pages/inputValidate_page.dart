import 'package:app_credibanco_login/src/assets/pruebas.dart';
import 'package:app_credibanco_login/src/common/enumValidate.dart';
import 'package:flutter/material.dart';

import '../assets/input.dart';
import '../colors/colors.dart';

class InputValidatePage extends StatelessWidget {

  TextEditingController ctrlRFC = TextEditingController(); // Controlador del rfc
  TextEditingController ctrlZipCode = TextEditingController(); // Controlador del emaail

  // Controladores que se manejan en cada formulario
  TextEditingController ctrlName = TextEditingController();
  TextEditingController ctrlApellido = TextEditingController();
  TextEditingController ctrlPhoneNumber = TextEditingController();
  TextEditingController ctrlEmail = TextEditingController();
  TextEditingController ctrlPassword = TextEditingController();
  
  GlobalKey<FormState> _keyForm = GlobalKey<FormState>(); /* Clave que se utiliza para identificar y controlar
                                                          el estado o validacion de un formulario  */

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // Barra principal de navegación "AppBar"
      appBar: AppBar(
        backgroundColor: CustomColors
            .colorBlanco,
        title: Text("input con validaciones", 
          style: TextStyle(
            color: Colors.black
          ),
        ),
      ),

      // ---- Cuerpo o contenido de la aplicación "body" ----
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15), // Separación entre todos los widgets y el borde del celular
          
          child: Form( // "Form" se va a trabajar con formularios
            key: _keyForm, // Define un formulario con una llave para controlarlo
            child: Column(
              // Se acomoda el contenido en columna

              mainAxisAlignment:
                  MainAxisAlignment.center, // Define la posición de los widgets
              
              children: <Widget>[
                
                // input de nombre
                InputTextValidations(
                  textoInput: "Nombre",
                  inputType: TextInputType.name,
                  controller: ctrlName, 
                  validateText: ValidateText.name,
                ),

                // input de apellido
                InputTextValidations(
                  textoInput: "Apellido",
                  inputType: TextInputType.name,
                  controller: ctrlApellido, 
                  validateText: ValidateText.lastname,
                ),

                // input de email
                InputTextValidations(
                  textoInput: "Correo electronico",
                  inputType: TextInputType.emailAddress,
                  controller: ctrlEmail, 
                  validateText: ValidateText.email,
                ),

                // input de numero de telefono
                InputTextValidations(
                  textoInput: "Número de telefono",
                  inputType: TextInputType.phone,
                  controller: ctrlPhoneNumber, 
                  validateText: ValidateText.phoneNumber,
                ),

                // input de numero de telefono
                InputPasswordValidations(
                  textoInput: "Password",
                  inputType: TextInputType.text,
                  controller: ctrlPassword, 
                  validateText: ValidateText.password,
                ),

                /*
                // input del correo
                TextFieldBase("Email", ctrlEmail, validateText: ValidateText.email,),
                // input del numero de telefono
                TextFieldBase("Número de telefono", ctrlPhoneNumber, validateText: ValidateText.phoneNumber,),
                // input del numero de telefono
                TextFieldBase("Codigo postal", ctrlZipCode, validateText: ValidateText.zipCode, isEmptyInput: true),
                */
                // boton para saber si se escribio correctamente el contenido de cada input
                TextButton(onPressed: save, child: Text("Guardar")),
                
              ],
            ),
          ),
        ),
      )
    );
  }

  // funcion para saber si los inputs tienen correcto su contenido
  save() {
    if(_keyForm.currentState!.validate()){ // si esta correcto el contenido de cada input

    }
  }
}