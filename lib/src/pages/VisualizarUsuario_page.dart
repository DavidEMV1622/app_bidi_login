// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../utils/TextFormatter.dart';
import '../colors/colors.dart';
import 'Editar_usuario_page.dart';

class ViewUserDataPage extends StatefulWidget {
  const ViewUserDataPage({super.key});

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
          padding: const EdgeInsets.all(
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
                padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                
                // ---- Tamaño del Campo ----
                //height: 600,
                width: 700.0,

                // ---- Contenido del campo ----
                child: Center(
                  child: Column(
                    children: [
                      // ---- Icono de perfil ----
                      const Icon(
                        Icons.account_circle_rounded,
                        color: CustomColors.colorNegro,
                        size: 150.0,
                      ),

                      // ---- Datos del usuario ----
                      textoEtiqueta("- Nombre:", CustomColors.colorVerdeOscuroFuerte),
                      textoCuerpo("Lucas", CustomColors.colorNegro),
                      textoEtiqueta("- Apellido:", CustomColors.colorVerdeOscuroFuerte),
                      textoCuerpo("Rubiano", CustomColors.colorNegro),
                      textoEtiqueta("- Correo:", CustomColors.colorVerdeOscuroFuerte),
                      textoCuerpo("lucasR@gmail.com", CustomColors.colorNegro),
                      textoEtiqueta("- Telefono", CustomColors.colorVerdeOscuroFuerte),
                      textoCuerpo("1234567890", CustomColors.colorNegro),
                    ]
                  ),
                ),
                /*      
                margin: EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 0,
                ),
                */
              ),
              
              // ---- Boton flotante ----
              FloatingActionButton(
                elevation: 10.0,
                backgroundColor: CustomColors.colorAmarilloMostaza, 
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const UpdateUserPage())),
                child: const Icon(
                  Icons.edit_square,
                  color: CustomColors.colorBlanco,
                  size: 30.0,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
