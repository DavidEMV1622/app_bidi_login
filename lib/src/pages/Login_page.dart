import 'package:flutter/material.dart';

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
  // Variable de tipo boolean para icono de si o no mostrar contrasenia
  bool passenable = true;

  @override
  Widget build(BuildContext context) {
    // Plantilla principal "Scaffold"
    return Scaffold(
      // Barra principal de navegación "AppBar"
      appBar: AppBar(
        backgroundColor: CustomColors.colorAppBar, // Color del AppBar por medio de la clase "CustomColors"
      ),

      // ---- Cuerpo o contenido de la aplicación "body" ----
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20), // Separación entre todos los widgets y el borde del celular
          child: Column( // Se acomoda el contenido en columna

            mainAxisAlignment:
                MainAxisAlignment.center, // Define la posición de los widgets

            children: <Widget>[ /* Se usa el widget "children" que son 
                                los hijos o cadenas de widget que se van 
                                a unir */

              // ---- Titulo de "LOGIN" ----
              Text("LOGIN", style: new TextStyle(fontSize: 80)),

              // ---- Agregar un espacio entre los dos widgets (Text, Align)----
              SizedBox(
                height: 45.0,
              ),

              // ---- Texto "Correo*" ----
              Align(
                //alignment: Alignment(-1.0, 0.0),
                alignment: Alignment.centerLeft,
                child: Text("Correo*", style: _estiloTexto,),
              ),

              // ---- Llamado Widget para un campo de texto para ingresar correo ----
              _textFieldEmail("example@hotmail.com"),

              // ---- Agregar un espacio ----
              SizedBox(
                height: 15.0,
              ),

              // ---- Texto "Contrasenia*" ----
              Align(
                //alignment: Alignment(-1.0, 0.0),
                alignment: Alignment.centerLeft,
                child: Text("Contraseña*", style: _estiloTexto,),
              ),

              // ---- Campo de texto para ingresar contrasenia ----
              _textFieldPassword("************"),

              // ---- Agregar un espacio ----
              SizedBox(
                height: 25.0,
              ),

              // ---- Texto para un link si se le olvido la contrasenia ----
              Align(
                //alignment: Alignment(-1.0, 0.0),
                alignment: Alignment.center,
                child: _buttonLink("¿Olvidaste tu Contraseña?, pinche aqui"),
              ),

              // ---- Agregar un espacio ----
              SizedBox(
                height: 25.0,
              ),

              // ---- Boton "Iniciar de sesión" ----
              _buttonSesion("Iniciar sesión"),

              // ---- Agregar un espacio ----
              SizedBox(
                height: 25.0,
              ),

              // ---- Linea de separación con "Divider" ----
              Row(
                  children: <Widget>[
                      Expanded(
                          child: Divider(color: Colors.black, thickness: 1,)
                      ),       

                      Container( child: Text("O"), margin: EdgeInsets.symmetric(horizontal: 15),),       

                      Expanded(
                          child: Divider(color: Colors.black, thickness: 1,)
                      ),
                  ]
              ),
              // ---------------------------------------------

              // ---- Agregar un espacio ----
              SizedBox(
                height: 25.0,
              ),

              // ---- Texto para un link si no tienes cuenta----
              Align(
                alignment: Alignment.center,
                child: _buttonLink("¿No tienes cuenta?, pinche aqui"),
              ),

              
              
            ],
          ),
        ),
      ),
    );
  }

  // ---- Widget para el campo de texto "Correo" ----
  Widget _textFieldEmail(String textoCorreo) {
    return Container(
      // Permite definir el diseño de la caja de texto "BoxDecoration"
      decoration: BoxDecoration(
        color: Color.fromRGBO(217, 217, 217, 1), // Color del input
        borderRadius: BorderRadius.circular(10.0), // Define los bordes redondeados
        border: Border.all( // Define el grosor y color de borde
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
            decoration: InputDecoration.collapsed( /* Quita la linea que viene por 
                                                  defecto en el input "InputDecoration.collapsed" */
              hintText: textoCorreo, // Place holder en el input
            )
          ),
      /*
          height: 40.0,
          width: 1000.0,
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          */
    );
  }

  // ---- Widget para el campo de texto "Contrasenia" ----
  Widget _textFieldPassword(String textoContrasenia) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(217, 217, 217, 1),
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.black,
          width: 1.0,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),

      // Uso de un input (Campo de texto)
      child: TextField(
        obscureText: passenable, // Oculta el contenido si es "true" y lo muestra si es "false"
        style: TextStyle(fontSize: 25),
        decoration: InputDecoration(
          hintText: textoContrasenia,
          border: InputBorder.none, // Quita la línea que viene por defecto en el TextField

          suffix: IconButton(

              /* Agrega una animación al presionar el boton y permite realizar una accion 
            agregandolo entre las {} */
              onPressed: () {
                // Permite redibujar el widget para que se muestre los cambios en la aplicación
                setState(() {
                    if (passenable) {
                      passenable = false;
                    } else {
                      passenable = true;
                    }
                  }
                );
              },
            // Agrega un icono para mostrar y otro para no mostrar contrasenia
            icon: new Icon(passenable == true ? Icons.visibility_off : Icons.visibility)
          )
        ),
      ),
    );
  }

  // ---- Widget para el boton de inicio de sesion ----
  Widget _buttonSesion( String textoBoton) {
    return MaterialButton(
      /*
      minWidth: 161, // Ancho del boton
      height: 60, // Largo del boton
      */
      onPressed: () {}, // Animación al presionar
      color: CustomColors.colorButton, // Color del boton por medio de la clase "CustomColors" 
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),

      // Agregar texto dentro del boton
      child: Text(
        textoBoton,
        style: TextStyle( color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // ---- Widget para un boton transparente para los links ----
  Widget _buttonLink(String textoLink) {
    return TextButton(
      onPressed: () {
        if (textoLink == "¿No tienes cuenta?, pinche aqui") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RegisterPage()),
          ); 
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PasswordPage()),
          );
        }
        
      }, 
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.transparent) // Define el fondo transparente
      ),
      child: Text(
        textoLink, // Agrega el texto
        style: TextStyle( 
          fontSize: 18, // Tamaño del texto
          color: CustomColors.colorLink, // Color del texto
        ),
      ),
    );
  }
  
}
