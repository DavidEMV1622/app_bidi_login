import 'package:flutter/material.dart';

import '../colors/colors.dart';

class PasswordPage extends StatefulWidget {
  @override
  createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
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

            children: <Widget>[ 

              Text("RECUPERAR CONTRASEÑA", style: new TextStyle(fontSize: 80)),

            ],
          ),
        ),
      ),
    );
  }
}
