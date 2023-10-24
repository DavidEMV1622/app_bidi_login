// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../config/arrow_router.dart';
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
  final String ruta;

  const SendCodePageGeneral({
    super.key, 
    required this.tituloGeneral, 
    required this.textoCuerpoGeneral, 
    required this.textoFormulario,
    required this.nombreCtrl,
    required this.ruta,
  });

  @override
  State<SendCodePageGeneral> createState() => _SendCodePageGeneralState();
}

class _SendCodePageGeneralState extends State<SendCodePageGeneral> {

  TextEditingController nombreCtrl = TextEditingController();

  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>(); /* Clave que se utiliza para identificar y 
                                                    controlar el estado o validacion de un formulario  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.colorBlanco,
        elevation: 0.0,
        leading: const ArrowRouter(activeArrow: "1",),
      ),
      
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(// "Form" se va a trabajar con formularios
            key: _keyForm, // Define un formulario con una llave para controlarlo
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                tituloEncabezadoDos(widget.tituloGeneral),
                
                Text(
                  widget.textoCuerpoGeneral,
                  style: const TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 45,
                ),
                
                // ---- Llamado Widget para un campo de texto para ingresar correo ----
                if (widget.textoFormulario == "Correo electrónico")
                  InputTextValidations(
                    textoInput: widget.textoFormulario,
                    inputType: TextInputType.emailAddress,
                    controller: nombreCtrl,
                    validateText: ValidateText.email,
                    imageIcon: 'assets/icons/email.svg',
                  ),
                
                // ---- Llamado Widget para un campo de texto para ingresar numero de telefono ----
                if (widget.textoFormulario == "Número de Teléfono")
                  InputTextValidations(
                    textoInput: widget.textoFormulario,
                    inputType: TextInputType.phone,
                    controller: nombreCtrl,
                    validateText: ValidateText.phoneNumber,
                    imageIcon: 'assets/icons/phone_number.svg',
                  ),
                    
                const SizedBox(
                  height: 45,
                ),
              
                ButtonPrimary(
                  textButton: "Verificar",
                  colorBox: CustomColors.colorAmarilloMostaza,
                  widthButton: MediaQuery.of(context).size.width,
                  onPressed: save,
                ),
                // boton para saber si se escribio correctamente el contenido de cada input
                //TextButton(onPressed: save, child: Text("Guardar")),
              ],
            ),
          ),
        ),
      )
    );
  }
  // funcion para saber si los inputs tienen correcto su contenido
  save() {
    if (_keyForm.currentState!.validate()) {// si esta correcto el contenido de cada input
      context.push(widget.ruta);
    }
  }
}