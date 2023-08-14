import 'package:flutter/material.dart';
import '../utils/TextFormatter.dart';
import '../widgets/buttons.dart';
import '../widgets/checkBox.dart';
import '../utils/flutter_secure_storage.dart';
import '../widgets/input.dart';
import '../common/enumValidate.dart';
import 'Logeado.dart';
import 'Password_page.dart';
import 'Registrar_page.dart';
import 'package:flutter_svg/svg.dart';

import 'avisos_page.dart';

class LoginPage extends StatefulWidget {
  @override
  createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //final String imageUrl ="https://elempleo.blob.core.windows.net/empresasprd/1379.gif";

  GlobalKey<FormState> _keyForm = GlobalKey<FormState>(); /* Clave que se utiliza para identificar y 
                                                    controlar el estado o validacion de un formulario  */

  TextEditingController ctrlEmail = TextEditingController();
  TextEditingController ctrlPassword = TextEditingController();

  // Declarar el llamado de la clase SecureStorageMethods para utilizar el metodo get en los controladores
  final SecureStorageMethods _secureStorageMethods = SecureStorageMethods();

  // Se ejecuta una vez antes de que se ejecute el StatefulWidget
  @override
  void initState() {
    super.initState();
    fetchSecureStorageData();
  }

  // Metodo para obtener datos (get)
  Future <void> fetchSecureStorageData() async {
    /* El keyword "await" se utiliza en el metodo "fetchSecureStorageData()" 
    para esperar a que estos métodos asíncronos (async) se completen antes de asignar 
    los valores recuperados u obtenidos (getUserName, getPassword) a los controladores 
    _userNameController y _passwordController. */
    ctrlEmail.text = await _secureStorageMethods.getEmailLogin() ?? "";
    ctrlPassword.text = await _secureStorageMethods.getPasswordLogin() ?? "";
    await _secureStorageMethods.setIsNotices(true); // asigna true en IsNotice
  }


  @override
  Widget build(BuildContext context) {
    // Plantilla principal "Scaffold"
    return Scaffold(       
      // ---- Cuerpo o contenido de la aplicación "body" ----
      body: SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(
              15), // Separación entre todos los widgets y el borde del celular
          
          child: Form(// "Form" se va a trabajar con formularios
            key: _keyForm, // Define un formulario con una llave para controlarlo
            child: Column(
            // Se acomoda el contenido en columna

            mainAxisAlignment:
                MainAxisAlignment.center, // Define la posición de los widgets

            children: <Widget>[
              /* Se usa el widget "children" que son 
                                los hijos o cadenas de widget que se van 
                                a unir */
              
              SvgPicture.asset( 
                'assets/Logo_CrediBanco.svg',
                width: 200,
              ),

              SizedBox(
                height: 35.0,
              ),

              // ---- Titulo de "LOGIN" ----
              tituloEncabezadoUno("Iniciar Sesión"),

              // ---- Agregar un espacio entre los dos widgets (Text, Align)----
              SizedBox(
                height: 45.0,
              ),
              
              // ---- Llamado Widget para un campo de texto para ingresar correo ----
              InputTextValidations(
                textoInput: "Correo electronico",
                inputType: TextInputType.emailAddress,
                controller: ctrlEmail,
                validateText: ValidateText.email,
              ),

              // ---- Agregar un espacio ----
              SizedBox(
                height: 15.0,
              ),

              // ---- Campo de texto para ingresar contrasenia ----
              //inputPassword("Contraseña"),
              InputPasswordValidations(
                textoInput: "Contraseña",
                inputType: TextInputType.text,
                controller: ctrlPassword,
                validateText: ValidateText.password,
              ),
              
              // ---- Agregar un espacio ----
              SizedBox(
                height: 25.0,
              ),

              // ---- Boton "Iniciar de sesión" ----
              // boton_orange("Iniciar sesión", Color.fromRGBO(255, 182, 0, 1)),

              BtnPrimaery(
                textButton: "Iniciar sesion",
                colorBox: Color.fromRGBO(255, 182, 0, 1),
                widthButton: MediaQuery.of(context).size.width,
                onPressed: () async {
                  // Se obtiene el estado de isNotice si es true o false
                  bool? isNotices = await _secureStorageMethods.getIsNotices();

                  // Si isNotices es true, se pasa a las ventanas de avisos de lo contrario pasa a la ventana Logeado
                  if (isNotices!) {
                    await _secureStorageMethods.setIsNotices(false);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AvisoPage()));
                  } else {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LogeadoPage()));
                  }
                }
              ),

              SizedBox(
                height: 25.0,
              ),

              /* ------Boton "REGISTRATE"----------
              Obtiene como parametro los siguientes puntos:
              1) Texto que tiene el boton
              2) Color del boton
              3) Grosor del borde
              4) evento para navegar entre pantallas */
              BtnPrimaery(
                textButton: "Registrate",
                colorBox: Colors.white,
                border: Border.all(width: 2),
                widthButton: MediaQuery.of(context).size.width,
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterPage())),
              ),

              // ---- Agregar un espacio ----
              SizedBox(
                height: 25.0,
              ),

              // ---- Texto para un link si se le olvido la contrasenia ----
              BotonLink(
                textoLink: "Olvide mi contraseña",
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PasswordPage())),
              ),

              SizedBox(
                height: 25.0,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CheckBox( // Uso de un checkBox
                    // Mandar los controladores a utilizar oara cada formulario
                    emailController: ctrlEmail,
                    passwordController: ctrlPassword,
                  ),
                  const Text("Recuerdame"),
                ],
              ),

              SizedBox(
                height: 25.0,
              ),

              // boton para saber si se escribio correctamente el contenido de cada input
              TextButton(onPressed: save, child: Text("Guardar")),
            ],
          ),
        ),
        ),
      ),
    ));
  }
  // funcion para saber si los inputs tienen correcto su contenido
  save() {
    if (_keyForm.currentState!.validate()) {// si esta correcto el contenido de cada input
    }
  }
}
