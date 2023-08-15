import 'package:flutter/material.dart';

import '../../colors/colors.dart';
import '../../common/enumValidate.dart';
import '../../utils/TextFormatter.dart';
import '../buttons.dart';
import '../input.dart';

class SendCodePageGeneral extends StatefulWidget {

  final String tituloGeneral;
  final String textoCuerpoGeneral;
  final String textoFormulario;
  final TextEditingController nombreCtrl;
  final void Function() onPressedPantallaPasar;

  const SendCodePageGeneral({
    super.key, 
    required this.tituloGeneral, 
    required this.textoCuerpoGeneral, 
    required this.textoFormulario,
    required this.nombreCtrl,
    required this.onPressedPantallaPasar,
  });

  @override
  State<SendCodePageGeneral> createState() => _SendCodePageGeneralState();
}

class _SendCodePageGeneralState extends State<SendCodePageGeneral> {

  TextEditingController nombreCtrl = TextEditingController();

  GlobalKey<FormState> _keyForm = GlobalKey<FormState>(); /* Clave que se utiliza para identificar y 
                                                    controlar el estado o validacion de un formulario  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.colorBlanco,
        elevation: 0.0,
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
                  titulo(widget.tituloGeneral),
                  SizedBox(
                    height: 45,
                  ),
                  Text(
                    widget.textoCuerpoGeneral,
                    style: TextStyle(fontSize: 32),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  
                  // ---- Llamado Widget para un campo de texto para ingresar correo ----
                  if (widget.textoFormulario == "Correo electronico")
                    InputTextValidations(
                      textoInput: widget.textoFormulario,
                      inputType: TextInputType.emailAddress,
                      controller: nombreCtrl,
                      validateText: ValidateText.email,
                    ),
                  
                  // ---- Llamado Widget para un campo de texto para ingresar numero de telefono ----
                  if (widget.textoFormulario == "Número de Teléfono")
                    InputTextValidations(
                      textoInput: widget.textoFormulario,
                      inputType: TextInputType.phone,
                      controller: nombreCtrl,
                      validateText: ValidateText.phoneNumber,
                    ),
                      
                  SizedBox(
                    height: 45,
                  ),

                  BtnPrimaery(
                    textButton: "Verificar",
                    colorBox: CustomColors.colorAmarilloMostaza,
                    widthButton: MediaQuery.of(context).size.width,
                    onPressed: widget.onPressedPantallaPasar,
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