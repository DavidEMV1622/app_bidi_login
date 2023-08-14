import 'package:app_credibanco_login/src/widgets/buttons.dart';
import 'package:app_credibanco_login/src/widgets/input.dart';
import 'package:app_credibanco_login/src/pages/Login_page.dart';
import 'package:flutter/material.dart';
import '../common/enumValidate.dart';
import '../utils/TextFormatter.dart';
import 'Password_page.dart';

import '../colors/colors.dart';
import 'SendCodePasswords_page.dart';

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
  
  GlobalKey<FormState> _keyForm = GlobalKey<FormState>(); /* Clave que se utiliza para identificar y 
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
      body: Container(
        child: Form(
          key: _keyForm, // Define un formulario con una llave para controlarlo
          child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 25.0,
          ),
          children: <Widget>[
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              tituloEncabezadoUno("Registrate"),

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
                inputType: TextInputType.number,
                controller: ctrlPhoneNumber,
                validateText: ValidateText.phoneNumber,
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

              /*
              InputText(
                textoInput: "Nombre",
                inputType: TextInputType.name,
              ),
              InputText(
                textoInput: "Apellido",
                inputType: TextInputType.name,
              ),
              InputText(
                textoInput: "Correo",
                inputType: TextInputType.emailAddress,
              ),
              InputText(
                textoInput: "Telefono",
                inputType: TextInputType.number,
              ),
              PasswordInput(textoContrasenia: "Contraseña:"),
              PasswordInput(textoContrasenia: "Confirmar contraseña:"),
              */
              SizedBox(
                height: 25.0,
              ),
              BtnPrimaery(
                textButton: "Enviar codigo",
                colorBox: Color.fromRGBO(255, 182, 0, 1),
                widthButton: MediaQuery.of(context).size.width,
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SendCodePasswordPage())),
              ),
            ]),
            SizedBox(
              height: 25.0,
            ),
            Row(children: <Widget>[
              Expanded(
                  child: Divider(
                color: CustomColors.colorNegro,
                thickness: 1,
              )),
              Container(
                child: Text("O"),
                margin: EdgeInsets.symmetric(horizontal: 15),
              ),
              Expanded(
                  child: Divider(
                color: CustomColors.colorNegro,
                thickness: 1,
              )),
            ]),
            SizedBox(
              height: 15.0,
            ),
            BotonLink(
                textoLink: "¿Ya tienes cuenta?, click aquí",
                onPressed: () => Navigator.pop(context)),
            
            // boton para saber si se escribio correctamente el contenido de cada input
            TextButton(onPressed: save, child: Text("Guardar")),
          ]
        ),
      ) 
      ),
    );
  }
/*
  Widget _buttonLink(String textoLink) {
    return TextButton(
      onPressed: () {
        // Condición para manejar los cambios de pantalla
        if (textoLink == "¿Ya tienes cuenta?, click aqui") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PasswordPage()),
          );
        }
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              Colors.transparent) // Define el fondo transparente
          ),
      child: Text(
        textoLink, // Agrega el texto
        style: TextStyle(
          fontSize: 18, // Tamaño del texto
          color: CustomColors.colorVerdePantano, // Color del texto
        ),
      ),
    );
  */
  // funcion para saber si los inputs tienen correcto su contenido
  save() {
    if (_keyForm.currentState!.validate()) {// si esta correcto el contenido de cada input
    }
  }
/*
  void comparePasswords(bool confirmPasswordTrueOrFalse ) {
    String password1 = ctrlPassword.text;
    String password2 = ctrlConfirmPassword.text;

    return password1 == password2
    ? setState(() {
        true;
    })
    : false;
  }
  */
}