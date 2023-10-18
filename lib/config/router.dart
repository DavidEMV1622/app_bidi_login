import 'package:go_router/go_router.dart';

import '../src/pages/Change_password.dart';
import '../src/pages/CodeOTPEmailChangePassword_page.dart';
import '../src/pages/CodeOTPEmailTRegister_page.dart';
import '../src/pages/CodeOTPPhoneNumberChangePassword_page.dart';
import '../src/pages/CodeOTPPhoneNumberRegister_page.dart';
import '../src/pages/Editar_usuario_page.dart';
import '../src/pages/Logeado.dart';
import '../src/pages/Login_page.dart';
import '../src/pages/MediumSendCodeChangePassword_Page.dart';
import '../src/pages/MediumSendCodeRegister_page.dart';
import '../src/pages/Registrar_page.dart';
import '../src/pages/SendCodeEmailChangePassword_page.dart';
import '../src/pages/SendCodeEmailRegister_page.dart';
import '../src/pages/SendCodePhoneNumberChangePassword_page.dart';
import '../src/pages/SendCodePhoneNumberRegister_page.dart';
import '../src/pages/VisualizarUsuario_page.dart';
import '../src/pages/avisos_page.dart';

final routes = GoRouter(
  initialLocation: '/loginPage', /* Al iniciar la aplicacion, se 
                                ejecuta primero esta ruta */
  /* "routes" manejo de cada subruta */
  
  routes: [
    GoRoute( // "GoRoute" permite crear cada ruta
      path: '/loginPage', // Plantilla para llamar las pantallas
      builder: (context, state) => const LoginPage(), // Llamada de las pantallas a cambiar
    ),

    GoRoute( // Ruta de la pagina de avisos
      path: '/avisoPage', // Ruta con parametro
      builder: (context, state) { 
        return const AvisoPage();
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
      path: '/mediumSendCodeRegisterPage',
      builder: (context, state) { 
        return const MediumSendCodeRegisterPage();
      }
    ),
    // Ruta de la pagina para Cambiar la contraseña por medio de OTP
    GoRoute(
      path: '/mediumSendCodeChangePasswordPage',
      builder: (context, state) { 
        return const MediumSendCodeChangePasswordPage();
      }
    ),
    // Ruta de la pagina de registrar usuario
    GoRoute(
      path: '/registerPage',
      builder: (context, state) => const RegisterPage(),
    ),
    // Ruta de la pagina de codigo otp para registrar usuario por email
    GoRoute(
      path: '/codeOTPEmaiRegisterPage',
      builder: (context, state) => const CodeOTPEmaiRegisterPage(),
    ),
    // Ruta de la pagina de codigo otp para cambiar la contraseña del usuario por email
    GoRoute(
      path: '/codeOTPEmailChangePassword',
      builder: (context, state) => const CodeOTPEmailChangePasswordPage(),
    ),
    // Ruta de la pagina de codigo otp para cambiar la contraseña del usuario por numero de telefono
    GoRoute(
      path: '/codeOTPPhoneNumberChangePassword',
      builder: (context, state) => const CodeOTPPhoneNumberChangePasswordPage(),
    ),
    // Ruta de la pagina de codigo otp para registrar usuario por numero de telefono
    GoRoute(
      path: '/codeOTPPhoneNumberRegister',
      builder: (context, state) => const CodeOTPPhoneNumberRegisterPage(),
    ),
    // Ruta de la pagina de editar usuario
    GoRoute(
      path: '/updateUser',
      builder: (context, state) => const UpdateUserPage(),
    ),
    // Ruta de la pagina de usuario
    GoRoute(
      path: '/userLogin',
      builder: (context, state) => const LogeadoPage(),
    ),
    // Ruta de la pagina medio de envio de codigo OTP para cambiar contrasenia
    GoRoute(
      path: '/userLogin',
      builder: (context, state) => const MediumSendCodeChangePasswordPage(),
    ),
    // Ruta de la pagina para mostrar los datos del usuario
    GoRoute(
      path: '/viewUserData',
      builder: (context, state) => const ViewUserDataPage(),
    ),
    // Ruta de la pagina de envio de codigo otp por email para cambiar de contraseña
    GoRoute(
      path: '/sendCodeEmailChangePassword',
      builder: (context, state) => const SendCodeEmailChangePasswordPage(),
    ),
    // Ruta de la pagina de envio de codigo otp por numero de telefono para cambiar de contraseña
    GoRoute(
      path: '/sendCodePhoneNumberChangePassword',
      builder: (context, state) => const SendCodePhoneNumberChangePasswordPage(),
    ),
    // Ruta de la pagina de envio de codigo otp por correo para registrarse
    GoRoute(
      path: '/sendCodeEmailRegister',
      builder: (context, state) => const SendCodeEmailRegisterPage(),
    ),
    // Ruta de la pagina de envio de codigo otp por numero de telefono para registrarse
    GoRoute(
      path: '/sendCodePhoneNumberRegister',
      builder: (context, state) => const SendCodePhoneNumberRegisterPage(),
    ),
  ],

);

