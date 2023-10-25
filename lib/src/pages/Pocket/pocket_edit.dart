import 'package:app_credibanco_login/src/widgets/buttons.dart';
import 'package:app_credibanco_login/src/widgets/pocket.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';

class PocketEdit extends StatefulWidget {
  const PocketEdit({super.key});

  @override
  State<PocketEdit> createState() => _PocketEditState();
}

class _PocketEditState extends State<PocketEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Editar bolsillo", style: TextStyle(color: Colors.black)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Iconify(
              Bi.trash_fill,
              color: Color.fromARGB(255, 7, 7, 7),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 23,
              right: 23,
              top: 19,
            ),
            child: SizedBox(
              height: 145,
              child: Card(
                elevation: 10.0,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Column(
                  children: [
                    Container(
                      height: 66,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 95, 234, 255),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15))),
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Casa",
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "10000",
                          style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              color: Color.fromARGB(255, 147, 147, 147)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 23,
              right: 23,
              top: 19,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Nombre del bolsillo"),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 23, right: 23, top: 19, bottom: 19),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Cantidad a guardar"),
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(21),
        child: BtnPrimaery(
            textButton: "textButton",
            colorBox: Color.fromRGBO(255, 202, 44, 1),
            widthButton: 2),
      ),
    );
  }
}
