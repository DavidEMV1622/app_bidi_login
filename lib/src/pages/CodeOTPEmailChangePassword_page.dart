
// ignore_for_file: file_names
import 'package:flutter/material.dart';

import '../widgets/widgets_page_general/CodeOtp_general.dart';

class CodeOTPEmailChangePasswordPage extends StatefulWidget {
  const CodeOTPEmailChangePasswordPage({super.key});

  @override
  State<CodeOTPEmailChangePasswordPage> createState() => _CodeOTPEmailChangePasswordPageState();
}

class _CodeOTPEmailChangePasswordPageState extends State<CodeOTPEmailChangePasswordPage> {

  @override
  Widget build(BuildContext context) {
    return const CodeOTPPageGeneral(
      tituloEncabezadoUnoGeneral: "Cambiar Contraseña",
      subtituloUnoGeneral: "Ingresé el codigo que fue enviado por correo",
      ruta: "/changePassword",
    );
  }
}