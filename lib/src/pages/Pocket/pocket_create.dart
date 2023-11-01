import 'package:app_credibanco_login/models/pocket_model.dart';
import 'package:flutter/material.dart';
import 'package:app_credibanco_login/src/widgets/buttons.dart';
import 'package:go_router/go_router.dart';
import '../../../config/arrow_router.dart';
import '../../common/enumValidate.dart';
import '../../widgets/input.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'list_pocket.dart';

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
                                          child: BlockPicker(
                                              pickerColor: selectedColor,
                                              availableColors: [
                                                Colors.green,
                                                Colors.orange,
                                                Colors.blue,
                                                Colors.yellow,
                                                Colors.cyanAccent.shade400,
                                                Colors.purple,
                                                Colors.pink,
                                                Colors.red,
                                                Colors.deepOrange,
                                                Colors.teal,
                                                Colors.indigoAccent,
                                                Colors.amber,
                                              ],
                                              onColorChanged: (Color color) {
                                                setState(() {
                                                  selectedColor = color;
                                                });
                                              })),
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(21),
        child: BtnPrimaery(
          textButton: "Guardar.",
          colorBox: Color.fromRGBO(255, 202, 44, 1),
          widthButton: 2,
          onPressed: () {
            addNewPocket();
          },
        ),
      ),
    );
  }

  void addNewPocket() {
    String name = ctrlName.text;
    double pocketBalance = double.parse(ctrlPocket.text);

    Pocket newPocket = Pocket(name, pocketBalance, selectedColor);
    listPocket.add(newPocket);

    ctrlName.clear();
    ctrlPocket.clear();
    context.pushReplacement('/ListPocket', extra: context); //context,
  }
}
