import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Variable para el estilo del texto
  final TextStyle _estiloTexto = new TextStyle(fontSize: 25);
  // Variable de tipo boolean para icono de mostrar o no contrasenia
  bool passenable = true;

  @override
  Widget build(BuildContext context) {
    // Plantilla principal "Scaffold"
    return Scaffold(
      // Barra principal de navegación "AppBar"
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(124, 194, 209, 100), // Color de fondo
      ),

      // Cuerpo o contenido de la aplicación "body"
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            // Se acomoda el contenido como una columna

            mainAxisAlignment:
                MainAxisAlignment.center, // Define la posición de los widgets

            children: <Widget>[
              /* Se usa el widget "children" que son 
                                los hijos o cadenas de widget que se van 
                                a unir */

              // ---- Titulo de "LOGIN" ----
              Text("LOGIN", style: new TextStyle(fontSize: 80)),

              // ---- Agregar un espacio entre los dos widgets (Text, Align)----
              SizedBox(
                height: 15.0,
              ),

              // ---- Texto "Correo*" ----
              Align(
                //alignment: Alignment(-1.0, 0.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Correo*",
                  style: _estiloTexto,
                ),
              ),

              // ---- Llamado Widget para un campo de texto para ingresar correo ----
              _textFieldEmail(),

              // ---- Texto "Contrasenia*" ----
              Align(
                //alignment: Alignment(-1.0, 0.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Contraseña*",
                  style: _estiloTexto,
                ),
              ),

              // ---- Campo de texto para ingresar contrasenia ----
              _textFieldPassword(),

              // ---- Texto para un link si se le olvido la contrasenia ----
              Align(
                //alignment: Alignment(-1.0, 0.0),
                alignment: Alignment.center,
                child: Text(
                  "¿Olvidaste tu Contraseña?, pinche aqui",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromRGBO(34, 126, 166, 1),
                  ),
                ),
              ),

              // ---- Boton de Inicio de sesión ----
              _buttonSesion(),

              // ---- Texto para un link si no tienes cuenta----
              Align(
                alignment: Alignment.center,
                child: Text(
                  "¿No tienes cuenta?, pinche aqui",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromRGBO(34, 126, 166, 1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ---- Widget para el campo de texto "Correo" ----
  Widget _textFieldEmail() {
    return Container(
      decoration: BoxDecoration(
        // Permite definir el diseño de la caja de texto
        color: Color.fromRGBO(217, 217, 217, 1), // Color del input
        borderRadius: // Define los bordes redondeados
            BorderRadius.circular(10.0),
        border: Border.all(
          // Define el grosor y color de borde
          color: Colors.black,
          width: 1.0,
        ),
      ),
      padding: EdgeInsets.symmetric(
          // Espaciado entre el borde y el contenido
          horizontal: 10.0,
          vertical: 15.0),
      // margin: EdgeInsets.symmetric(horizontal: 10.0),

      // Uso de un input (Campo de texto)
      child: TextField(
          style: TextStyle(fontSize: 25), // Tamanio del texto
          decoration: InputDecoration.collapsed(
            // Quita la linea que viene por defecto en el input
            hintText: "example@hotmail.com", // Place holder en el input
          )),
      /*
          height: 40.0,
          width: 1000.0,
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          */
    );
  }

  // ---- Widget para el campo de texto "Contrasenia" ----
  Widget _textFieldPassword() {
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
        obscureText:
            passenable, // Oculta el contenido si es "true" y lo muestra si es "false"
        style: TextStyle(fontSize: 25),
        decoration: InputDecoration(
            hintText: "************",
            border: InputBorder
                .none, // Quita la línea que viene por defecto en el TextField

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
                  });
                },
                // Agrega un icono para mostrar y otro para no mostrar contrasenia
                icon: new Icon(passenable == true
                    ? Icons.visibility_off
                    : Icons.visibility))),
      ),
    );
  }

  // ---- Widget para el boton de inicio de sesion ----
  Widget _buttonSesion() {
    return MaterialButton(
      minWidth: 161, // Ancho del boton
      height: 60, // Altp del boton
      onPressed: () {}, // Animación al presionar
      color: Color.fromRGBO(3, 134, 208, 1), // Color al boton

      // Agregar texto dentro del boton
      child: Text(
        'Iniciar sesión',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
