// ignore_for_file: file_names

import 'package:app_credibanco_login/src/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../utils/TextFormatter.dart';
import '../widgets/buttons.dart';
import '../widgets/checkBox.dart';
import '../utils/flutter_secure_storage.dart';
import '../widgets/input.dart';
import '../common/enumValidate.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //final String imageUrl ="https://elempleo.blob.core.windows.net/empresasprd/1379.gif";

  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>(); /* Clave que se utiliza para identificar y 
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
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(
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
      
                const SizedBox(
                  height: 35.0,
                ),
      
                // ---- Titulo de "LOGIN" ----
                tituloEncabezadoUno("Iniciar Sesión"),
      
                // ---- Agregar un espacio entre los dos widgets (Text, Align)----
                const SizedBox(
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
                const SizedBox(
                  height: 15.0,
                ),
      
                // ---- Campo de texto para ingresar contrasenia ----
                InputPasswordValidations(
                  textoInput: "Contraseña",
                  inputType: TextInputType.text,
                  controller: ctrlPassword,
                  validateText: ValidateText.password,
                ),
                
                // ---- Agregar un espacio ----
                const SizedBox(
                  height: 25.0,
                ),
                
                // ---- Boton "Iniciar de sesión" ----
                BtnPrimaery(
                  textButton: "Iniciar sesion",
                  colorBox: CustomColors.colorAmarilloMostaza,
                  widthButton: MediaQuery.of(context).size.width,
                  onPressed: () async {
      
                    // Condicion para saber si las validaciones de cada input estan correctas
                    if (_keyForm.currentState!.validate()) {
                      // Se obtiene el estado de isNotice si es true o false
                      bool isNotices = await _secureStorageMethods.getEmailStorage(ctrlEmail.text);
      
                      /* Si isNotices es true, se pasa a las ventanas de avisos de lo contrario pasa a la 
                      ventana Logeado */
                      if (isNotices) {
                        await _secureStorageMethods.setIsNotices(false);
                        context.push("/logeadoPage");
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => const LogeadoPage()));
                      } else {
                        _secureStorageMethods.setEmailStorage(ctrlEmail.text);
                        context.push("/avisoPage"); 
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => const AvisoPage()));
                    
                      }
                    }
                  }
                ),
      
                const SizedBox(
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
                  colorBox: CustomColors.colorBlanco,
                  border: Border.all(width: 2),
                  widthButton: MediaQuery.of(context).size.width,
                  onPressed: () => context.push("/mediumSendCodeRegisterPage"),
                ),
      
                // ---- Agregar un espacio ----
                const SizedBox(
                  height: 25.0,
                ),
      
                // ---- Texto para un link si se le olvido la contrasenia ----
                BotonLink(
                  textoLink: "Olvide mi contraseña",
                  onPressed: () => context.push("/mediumSendCodeChangePasswordPage"),
                ),
      
                const SizedBox(
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
                    const Text("Recordar datos"),
                  ],
                ),

                ButtonPrimary(
                  textButton: "Pueba",
                  onPressed: () => print("Button pressed"),
                ),
              ],
            ),
          ),
          ),
        ),
      ),
    );
  }
}
