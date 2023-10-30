import 'package:flutter/material.dart';

import '../../../config/arrow_router.dart';
import '../../common/enumValidate.dart';
import '../../widgets/input.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class PocketCreate extends StatefulWidget {
  const PocketCreate({super.key});

  @override
  State<PocketCreate> createState() => _PocketCreateState();
}

class _PocketCreateState extends State<PocketCreate> {
  Color selectedColor = Color(0xFFC2C2C2);
  TextEditingController ctrlPocket = TextEditingController();
  TextEditingController ctrlName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: ArrowRouter(activeArrow: "1"),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Crear bolsillo", style: TextStyle(color: Colors.black)),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 23, right: 23, top: 19),
            child: Card(
              elevation: 10.0,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Column(
                children: [
                  Container(
                    height: 146,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: selectedColor,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Selecciona un color'),
                                      content: SingleChildScrollView(
                                        child: ColorPicker(
                                          pickerColor: selectedColor,
                                          onColorChanged: (Color color) {
                                            setState(() {
                                              selectedColor = color;
                                            });
                                          },
                                          enableAlpha: false,
                                          pickerAreaHeightPercent: 0.8,
                                          displayThumbColor: true,
                                          pickerAreaBorderRadius:
                                              const BorderRadius.only(
                                            topLeft: const Radius.circular(2.0),
                                            topRight:
                                                const Radius.circular(2.0),
                                          ),
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('Aceptar'),
                                          onPressed: () {
                                            // Guarda el color seleccionado y cierra el selector
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  });
                            },
                            icon: Icon(
                              Icons.palette,
                              size: 35,
                            ))
                      ],
                    ),
                  ),
                  Container(
                    height: 146,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 26,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 80, left: 80),
                          child: InputTextValidations(
                              border: true,
                              alingHintText: TextAlign.center,
                              textoInput: 'Nombre:',
                              inputType: TextInputType.name,
                              validateText: ValidateText.name,
                              controller: ctrlName),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 80, left: 80),
                          child: InputTextValidations(
                              border: true,
                              alingHintText: TextAlign.center,
                              textoInput: '\$ 0',
                              inputType: TextInputType.number,
                              validateText: ValidateText.balanceNumber,
                              controller: ctrlPocket),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
