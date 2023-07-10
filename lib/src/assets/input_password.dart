import 'package:flutter/material.dart';

// Variable de tipo boolean para icono de si o no mostrar contrasenia
  bool passenable = true;

// ---- Widget para el campo de texto "Contrasenia" ----
  Widget inputPassword(String textoContrasenia) {
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
  
 