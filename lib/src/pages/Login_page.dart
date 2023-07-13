import 'package:app_credibanco_login/src/assets/pruebas.dart';
import 'package:app_credibanco_login/src/assets/titulo.dart';
import 'package:flutter/material.dart';
import '../assets/buttons.dart';
import '../assets/input.dart';
import '../colors/colors.dart';
import 'Password_page.dart';
import 'Registrar_page.dart';

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
      body: Center(
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

              /*Image.network(
                imageUrl,
              ),*/

              SizedBox(
                height: 45.0,
              ),

              // ---- Titulo de "LOGIN" ----

              Text("Iniciar sesión",
                  textAlign: TextAlign.center,
                  style: new TextStyle(fontSize: 60)),

              // ---- Agregar un espacio entre los dos widgets (Text, Align)----
              SizedBox(
                height: 45.0,
              ),

              // ---- Llamado Widget para un campo de texto para ingresar correo ----
              inputText("Correo electronico"),

              // ---- Agregar un espacio ----
              SizedBox(
                height: 15.0,
              ),

              // ---- Campo de texto para ingresar contrasenia ----
              //inputPassword("Contraseña"),
              PasswordInput(
                hintText: 'Contraseña',
              ),

              // ---- Agregar un espacio ----
              SizedBox(
                height: 25.0,
              ),

              // ---- Boton "Iniciar de sesión" ----
              //boton_orange("Iniciar sesión", Color.fromRGBO(255, 182, 0, 1)),

              BtnPrimaery(
                textButton: "Iniciar secion",
                colorBox: Color.fromRGBO(255, 182, 0, 1),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterPage())),
              ),

              SizedBox(
                height: 25.0,
              ),
              BtnPrimaery(
                textButton: "Registrate",
                colorBox: Colors.white,
                border: Border.all(width: 2),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterPage())),
              ),

              /* ------Boton "REGISTRATE"----------
              Obtiene como parametro los siguientes puntos:
              1) Texto que tiene el boton
              2) Color del boton
              3) Grosor del borde
              4) "context" proporciona informacion del widget en el que estamos ubicado */

              // ---- Agregar un espacio ----
              SizedBox(
                height: 25.0,
              ),

              // ---- Texto para un link si se le olvido la contrasenia ----
              Align(
                //alignment: Alignment(-1.0, 0.0),
                alignment: Alignment.center,
                child: buttonLink("Olvide mi contraseña", context),
              ),

              // ---- Agregar un espacio ----
              SizedBox(
                height: 25.0,
              ),

              // ---- Texto para un link si no tienes cuenta----
              Align(
                alignment: Alignment.center,
                child: buttonLink("Olvide mi correo electronico", context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /*
  // ---- Widget para el campo de texto "Correo" ----
  Widget _textFieldEmail(String textoCorreo) {
    return Container(
      // Permite definir el diseño de la caja de texto "BoxDecoration"
      decoration: BoxDecoration(
        color: Color.fromRGBO(217, 217, 217, 1), // Color del input
        borderRadius:
            BorderRadius.circular(10.0), // Define los bordes redondeados
        border: Border.all(
          // Define el grosor y color de borde
          color: Colors.black,
          width: 1.0,
        ),
      ),
      // Espaciado entre el borde y el contenido
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      //margin: EdgeInsets.symmetric(horizontal: 10.0),

      // Uso de un input (Campo de texto)
      child: TextField(
          style: TextStyle(fontSize: 25), // Tamanio del texto
          decoration: InputDecoration.collapsed(
            /* Quita la linea que viene por 
                                                  defecto en el input "InputDecoration.collapsed" */
            hintText: textoCorreo, // Place holder en el input
          )),
      /*
          height: 40.0,
          width: 1000.0,
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          */
    );
  } */
}
