import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // Variable para el estilo del texto
  final TextStyle _estiloTexto = new TextStyle(fontSize: 25);
  // Container _estiloCamposTextos = new Container(fontSize: 25);

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
          child: Column( // Se acomoda el contenido como una columna
        
            mainAxisAlignment: MainAxisAlignment.center, // Define la posición de los widgets
        
            children: <Widget>[ /* Se usa el widget "children" que son 
                                los hijos o cadenas de widget que se van 
                                a unir */
        
              // ---- Titulo de "LOGIN" ----
              Text("LOGIN", style: new TextStyle(fontSize: 80)),
        
              // ---- Agregar un espacio entre los widgets ----
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
              
              // ---- Campo de texto para ingresar correo ----
              _textFieldEmail(),
        
              // ---- Texto "Contrasenia*" ----
              Text(
                "Contraseña*",
                style: _estiloTexto,
              ),

              // ---- Campo de texto para ingresar contrasenia ----
              _textFieldPassword(),
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
          color: Color.fromRGBO(217, 217, 217, 1), // Color del input
          borderRadius: BorderRadius.circular(10.0), // Define los bordes redondeados
          border: Border.all( // Define el grosor y color de borde
            color: Colors.black,
            width: 2.0,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0), // Espaciado entre el borde y el contenido
        // margin: EdgeInsets.symmetric(horizontal: 10.0),
      
        child: TextField( // Uso de un input
            style:TextStyle(fontSize:25), // Tamanio del texto
            decoration: InputDecoration.collapsed(hintText: "", ) // Elimina la linea del input que viene por defecto
          ),
      
    ); 
  }

  // ---- Widget para el campo de texto "Contrasenia" ----
  Widget _textFieldPassword() {
    return TextField();
  }
}
