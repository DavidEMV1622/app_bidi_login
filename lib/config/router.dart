

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../src/pages/Change_password.dart';
import '../src/pages/Logeado.dart';
import '../src/pages/Login_page.dart';
import '../src/pages/MediumSendCodeChangePassword_Page.dart';
import '../src/pages/MediumSendCodeRegister_page.dart';
import '../src/pages/Registrar_page.dart';
import '../src/pages/avisos_page.dart';

final routes = GoRouter(
  initialLocation: '/loginPage', /* Al iniciar la aplicacion, se 
                                ejecuta primero esta ruta */
  /* "routes" manejo de cada subruta para que salga en el abbar un 
  boton para regresar a la anterior pantalla */
  
  routes: [
    GoRoute( // "GoRoute" permite crear cada ruta
      path: '/loginPage', // Plantilla para llamar las pantallas
      builder: (context, state) => const LoginPage(), // Llamada de las pantallas a cambiar
    ),

    GoRoute( // Ruta de la pagina de avisos
      path: '/avisoPage/:activeArrow',
      builder: (context, state) { 
        return AvisoPage(
          activeArrow: state.pathParameters["activeArrow"] ?? "",
        );
      }
    ),

    // Ruta de la pagina de usuario logeado
    GoRoute(
      path: '/logeadoPage',
      builder: (context, state) => const LogeadoPage(),
    ),

    // Ruta de la pagina de cambiar contraseña
    GoRoute(
      path: '/changePassword',
      builder: (context, state) => const ChangePasswordPage(),
    ),

    // Ruta de la pagina para Registrar Usuario por medio de OTP
    GoRoute(
      path: '/mediumSendCodeRegisterPage/:activeArrow',
      builder: (context, state) { 
        return MediumSendCodeRegisterPage(
          activeArrow: state.pathParameters["activeArrow"] ?? "",
        );
      }
    ),
    // Ruta de la pagina para Cambiar la contraseña por medio de OTP
    GoRoute(
      path: '/mediumSendCodeChangePasswordPage/:activeArrow',
      builder: (context, state) { 
        return MediumSendCodeChangePasswordPage(
          activeArrow: state.pathParameters["activeArrow"] ?? "",
        );
      }
    ),
    // Ruta de la pagina de registrar usuario
    GoRoute(
      path: '/registerPage',
      builder: (context, state) => const RegisterPage(),
    ),
  ],
);

