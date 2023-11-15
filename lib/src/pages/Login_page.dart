// ignore_for_file: file_names

import 'package:app_credibanco_login/src/colors/colors.dart';
import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../Back-end/Dto/Token.dart';
import '../utils/TextFormatter.dart';
import '../widgets/buttons.dart';
import '../widgets/checkBox.dart';
import '../utils/flutter_secure_storage.dart';
import '../widgets/input.dart';
import '../common/enumValidate.dart';
import '../widgets/pop-up.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

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
    //await _secureStorageMethods.setIsNotices(true); // asigna true en IsNotice
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
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center, 
                    
                children: <Widget>[
                    
                  // ---- Titulo de "LOGIN" ----
                  tituloEncabezadoUno("bidi"),
                    
                  // ---- Agregar un espacio entre los dos widgets (Text, Align)----
                  const SizedBox(
                    height: 35.0,
                  ),
              
                  Align(
                    alignment: Alignment.centerLeft,
                    child: subtituloUno("Iniciar Sesión")
                  ),
              
                  const SizedBox(
                    height: 15.0,
                  ),
                  
                  // ---- Llamado Widget para un campo de texto para ingresar correo ----
                  InputTextValidations(
                    textoInput: "Email",
                    inputType: TextInputType.emailAddress,
                    controller: ctrlEmail,
                    validateText: ValidateText.email,
                    imageIcon: 'assets/icons/email.svg',
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
                    imageIcon: 'assets/icons/password.svg',
                  ),
                  
                  // ---- Agregar un espacio ----
                  const SizedBox(
                    height: 5.0,
                  ),
              
                  // ---- Texto para un link si se le olvido la contrasenia ----
                  BotonLink(
                    textoLink: "¿Olvidaste la contraseña?",
                    colorText: CustomColors.colorVerdePantano,
                    onPressed: () => context.push("/mediumSendCodeChangePasswordPage"),
                  ),
              
                  const SizedBox(
                    height: 25.0,
                  ),
                  
                  /* ---- Boton "Iniciar de sesión" ----
                  Obtiene como parametro los siguientes puntos:
                  1) Texto que tiene el boton
                  2) Color del boton
                  3) Grosor del borde
                  4) evento para navegar entre pantallas */
                  /* ButtonPrimary(
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
                          context.go("/logeadoPage");
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => const LogeadoPage()));
                        } else {
                          _secureStorageMethods.setEmailStorage(ctrlEmail.text);
                          context.go("/avisoPage"); 
                          //context.push("/avisoPage"); 
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => const AvisoPage()));
                      
                        }
                      }
                    }
                  ), */
                  ButtonPrimary(
                    textButton: "Iniciar sesion - prueba Post",
                    colorBox: CustomColors.colorAmarilloMostaza,
                    widthButton: MediaQuery.of(context).size.width,
                    onPressed: () async {

                      // Condicion para saber si las validaciones de cada input estan correctas
                      //if (_keyForm.currentState!.validate()) {
                      if (_keyForm.currentState!.validate()) {
                        //final response = await pruebaAccesoToken(User(username: "adminbidi@yopmail.com", password: "Colombia.4"));
                        final response = await pruebaAccesoToken(ctrlEmail.text, ctrlPassword.text, context);

                        if(response == 401){
                          mostrarPopupError(context);
                        } else {
                          // Se obtiene el estado de isStorage si es true (encontro la key) o false (no encontro la key)
                          bool isStorage = await _secureStorageMethods.getEmailStorage(ctrlEmail.text);
                      
                          /* isStorage es true, se pasa a la pantalla de logeado de lo contrario pasa a las
                          ventanas de avisos */
                          if (isStorage) {
                            context.go("/logeadoPage");
                            
                          } else {
                            _secureStorageMethods.setEmailStorage(ctrlEmail.text);
                            context.go("/avisoPage");
                          }
                        }
                      }
                    }
                  ),
                    
                  const SizedBox(
                    height: 15.0,
                  ),
                    
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CheckBox(
                        emailController: ctrlEmail,
                        passwordController: ctrlPassword,
                      ),
                      const Text("Recordar datos"),
                    ],
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.12,
                  ),
              
                  RichText(
                    text: TextSpan(
                      text: "¿Nuevo en bidi? ",
                      style: const TextStyle(
                        fontSize: 15,
                        color: CustomColors.colorGris_1,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Registrate',
                          style: const TextStyle(
                            fontSize: 15,
                            color: CustomColors.colorVerdePantano,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              //context.push("/mediumSendCodeRegisterPage");
                              context.push("/registerPage");
                            },
                        ),
                      ],
                    ),
                  ),
                ],),
              ),
            ),
          ),
        ),
      ),
    );
  }
  // Método para mostrar un pop-up con mensaje de error
  mostrarPopupError(BuildContext context) {
    DialogUtils.showMyGeneralDialog(context: context, 
      iconoMostrar: Icons.error_outline,
      mensajePopUp: "Credenciales Invalidas",
      onPressed: () {
        context.pop();
      }
    );
  }
}