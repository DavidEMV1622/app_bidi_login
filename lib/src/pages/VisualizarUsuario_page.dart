import 'package:app_credibanco_login/src/assets/pruebas.dart';
import 'package:app_credibanco_login/src/assets/titulo.dart';
import 'package:flutter/material.dart';
import '../assets/buttons.dart';
import '../assets/fuentesText/fuentes.dart';
import '../assets/input.dart';
import '../colors/colors.dart';
import 'Editar_usuario_page.dart';
import 'Password_page.dart';
import 'Registrar_page.dart';
import 'SendCodePassword.dart';

class ViewUserDataPage extends StatefulWidget {
  @override
  createState() => _ViewUserDataPageState();
}

class _ViewUserDataPageState extends State<ViewUserDataPage> {

  @override
  Widget build(BuildContext context) {
    // Plantilla principal "Scaffold"
    return Scaffold(
      // Barra principal de navegación "AppBar"
      appBar: AppBar(
        backgroundColor: CustomColors
            .colorBlanco, // Color del AppBar por medio de la clase "CustomColors"
      ),

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
              
              Container(
                // Permite definir el diseño de la caja de texto "BoxDecoration"
                decoration: BoxDecoration(
                  color: CustomColors.colorGris_4, // Color del input
                  borderRadius:
                      BorderRadius.circular(12.0), // Define los bordes redondeados
                  border: Border.all(
                    // Define el grosor y color de borde
                    color: CustomColors.colorGris_3,
                    width: 5.0,
                  ),
                ),
                // Espaciado entre el borde y el contenido
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                //margin: EdgeInsets.symmetric(horizontal: 10.0),

                // ---- Contenido del campo ----
                child: Center(
                  child: Column(
                      children: [
                        // ---- Icono de perfil ----
                        Icon(
                          Icons.account_circle_rounded,
                          color: CustomColors.colorNegro,
                          size: 150.0,
                        ),

                        // ---- Datos del usuario ----
                        textoEtiqueta("- Nombre:", CustomColors.colorVerdeOscuro),
                        textoCuerpo("Lucas", CustomColors.colorNegro),
                        textoEtiqueta("- Apellido:", CustomColors.colorVerdeOscuro),
                        textoCuerpo("Rubiano", CustomColors.colorNegro),
                        textoEtiqueta("- Correo:", CustomColors.colorVerdeOscuro),
                        textoCuerpo("lucasR@gmail.com", CustomColors.colorNegro),
                        textoEtiqueta("- Telefono", CustomColors.colorVerdeOscuro),
                        textoCuerpo("1234567890", CustomColors.colorNegro),
                      ]
                    ),
                  ),
                
                // ---- Tamaño del Campo ----
                //height: 600,
                width: 700.0,
                /*      
                margin: EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 0,
                ),
                */
              ),
              
              // ---- Boton flotante ----
              FloatingActionButton(
                child: Icon(
                  Icons.edit_square,
                  color: CustomColors.colorBlanco,
                  size: 30.0,
                ),
                elevation: 10.0,
                backgroundColor: CustomColors.colorAmarilloMostaza, 
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UpdateUserPage())),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
