// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../config/arrow_router.dart';
import '../Back-end/Dto/User/get_user.dart';
import '../Back-end/Dto/User/user_DTO.dart';
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
        leading: const ArrowRouter(),
      ),

      // ---- Cuerpo o contenido de la aplicación "body" ----
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: <Widget>[
              
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 13, vertical: 27),
                // Permite definir el diseño de la caja de texto "BoxDecoration"
                decoration: BoxDecoration(
                  color: CustomColors.colorGris_4, // Color del input
                  borderRadius:
                      BorderRadius.circular(33.0), // Define los bordes redondeados
                  border: Border.all(
                    // Define el grosor y color de borde
                    color: CustomColors.colorGris_3,
                    width: 5.0,
                  ),
                ),
                // Espaciado entre el borde y el contenido
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                
                // ---- Tamaño del Campo ----
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
                      textoEtiqueta("- Perfil de usuario:", CustomColors.colorVerdeOscuroFuerte),
                      textoCuerpo(context.watch<User>().getUserName!),
                      textoEtiqueta("- Nombre:", CustomColors.colorVerdeOscuroFuerte),
                      textoCuerpo(context.watch<User>().getFirstName!),
                      textoEtiqueta("- Apellido:", CustomColors.colorVerdeOscuroFuerte),
                      textoCuerpo(context.watch<User>().getLastName!),
                      textoEtiqueta("- Correo:", CustomColors.colorVerdeOscuroFuerte),
                      textoCuerpo(context.watch<User>().getEmail!),
                      textoEtiqueta("- Telefono", CustomColors.colorVerdeOscuroFuerte),
                      textoCuerpo("1234567890",),
                    ]
                  ),
                ),
              ),
              
              // ---- Boton flotante ----
              Align(
                alignment: Alignment.centerRight,
                child: FloatingActionButton(
                  elevation: 10.0,
                  backgroundColor: CustomColors.colorAmarilloMostaza, 
                  onPressed: () => context.push("/updateUser"),
                  child: const Icon(
                    Icons.edit_square,
                    color: CustomColors.colorBlanco,
                    size: 30.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
