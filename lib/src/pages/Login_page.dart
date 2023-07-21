import 'package:app_credibanco_login/src/assets/pruebas.dart';
import 'package:app_credibanco_login/src/assets/titulo.dart';
import 'package:app_credibanco_login/src/pages/SendCodePassword.dart';
import 'package:flutter/material.dart';
import '../assets/buttons.dart';
import '../assets/fuentesText/fuentes.dart';
import '../assets/input.dart';
import '../colors/colors.dart';
import 'Password_page.dart';
import 'Registrar_page.dart';
import 'SendCodePassword.dart';

class LoginPage extends StatefulWidget {
  @override
  createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Variable para el estilo del texto
  final TextStyle _estiloTexto = new TextStyle(fontSize: 25);
  //final String imageUrl ="https://elempleo.blob.core.windows.net/empresasprd/1379.gif";

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
          child: Column(
            // Se acomoda el contenido en columna

            mainAxisAlignment:
                MainAxisAlignment.center, // Define la posición de los widgets

            children: <Widget>[
              /* Se usa el widget "children" que son 
                                los hijos o cadenas de widget que se van 
                                a unir */
              Image.network(
                'https://www.credibanco.com/wp-content/uploads/2022/11/logo-web-principal-credibanco.png.webp',
                width: 800,
                height: null,
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
              /*
              // ---- Llamado Widget para un campo de texto para ingresar correo ----
              InputText(
                textoInput: "Correo electronico",
                inputType: TextInputType.emailAddress,
              ),

              // ---- Agregar un espacio ----
              SizedBox(
                height: 15.0,
              ),

              // ---- Campo de texto para ingresar contrasenia ----
              //inputPassword("Contraseña"),
              PasswordInput(
                textoContrasenia: 'Contraseña',
              ),
              */
              // ---- Agregar un espacio ----
              SizedBox(
                height: 25.0,
              ),

              // ---- Boton "Iniciar de sesión" ----
              // boton_orange("Iniciar sesión", Color.fromRGBO(255, 182, 0, 1)),

              BtnPrimaery(
                textButton: "Iniciar sesion",
                colorBox: Color.fromRGBO(255, 182, 0, 1),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterPage())),
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

              // ---- Agregar un espacio ----
              SizedBox(
                height: 25.0,
              ),

              // ---- Texto para un link si no tienes cuenta----
              /*
              Align(
                alignment: Alignment.center,
                child: buttonLink("Olvide mi correo electronico", context),
              ),
              */
              BotonLink(
                textoLink: "Olvide mi correo electronico",
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterPage())),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
