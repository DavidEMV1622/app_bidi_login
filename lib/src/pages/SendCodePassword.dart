import 'package:flutter/material.dart';
import '../utils/TextFormatter.dart';
import '../widgets/buttons.dart';
import '../widgets/input.dart';
import '../colors/colors.dart';
import '../common/enumValidate.dart';
import 'Password_page.dart';
import 'Registrar_page.dart';

class SendCodePassword extends StatefulWidget {
  const SendCodePassword({super.key});
  @override
  State<SendCodePassword> createState() => _SendCodePasswordState();
}

class _SendCodePasswordState extends State<SendCodePassword> {

  TextEditingController ctrlEmail = TextEditingController();

  GlobalKey<FormState> _keyForm = GlobalKey<FormState>(); /* Clave que se utiliza para identificar y 
                                                    controlar el estado o validacion de un formulario  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.colorBlanco,
      ),
      body: Container(
        child: Form(// "Form" se va a trabajar con formularios
          key: _keyForm, // Define un formulario con una llave para controlarlo
          child: ListView(
            padding: EdgeInsets.all(15),
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 55.0,
                  ),
                  titulo("ENVIO DE CODIGO"),
                  SizedBox(
                    height: 45,
                  ),
                  Text(
                    "Ingrese el correo para enviar un codigo",
                    style: TextStyle(fontSize: 32),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  
                  // ---- Llamado Widget para un campo de texto para ingresar correo ----
                  InputTextValidations(
                    textoInput: "Correo electronico",
                    inputType: TextInputType.emailAddress,
                    controller: ctrlEmail,
                    validateText: ValidateText.email,
                  ),
                      
                  SizedBox(
                    height: 45,
                  ),
                  BtnPrimaery(
                    textButton: "Verificar",
                    colorBox: Color.fromRGBO(255, 182, 0, 1),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PasswordPage())),
                  ),
                  // boton para saber si se escribio correctamente el contenido de cada input
                  TextButton(onPressed: save, child: Text("Guardar")),
                ],
              )
            ],
          ),
        )
        
      )
    );
  }
  // funcion para saber si los inputs tienen correcto su contenido
  save() {
    if (_keyForm.currentState!.validate()) {// si esta correcto el contenido de cada input
    }
  }
}
