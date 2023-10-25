import 'package:app_credibanco_login/models/pocket_model.dart';
import 'package:app_credibanco_login/src/widgets/pocket.dart';
import 'package:flutter/material.dart';

import '../widgets/dropBar.dart';

class PocketList extends StatefulWidget {
  const PocketList({super.key});
  @override
  State<PocketList> createState() => _PocketListState();
}

class _PocketListState extends State<PocketList> {
  List<Pocket> listPocket = [
    Pocket("Carro", "600.000", const Color.fromARGB(255, 147, 147, 147)),
    Pocket("Casa", "200.000", Color.fromARGB(255, 229, 10, 10)),
    Pocket("Beca", "400.000", Color.fromARGB(255, 244, 228, 9)),
    Pocket("Arriendo", "800.000", Color.fromARGB(255, 45, 178, 15)),
    Pocket("pc", "3.000.000", Color.fromARGB(255, 95, 234, 255)),
    Pocket("auto", "3.000.000", Color.fromARGB(255, 95, 234, 255)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Mis bolsillos",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 45, left: 35, right: 35),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Número de columnas
            childAspectRatio: 1.2, // Relación de aspecto de los elementos
            mainAxisSpacing: 11, // Espacio vertical entre elementos
            crossAxisSpacing: 12.0, // Espacio horizontal entre elementos
          ),
          itemCount: listPocket.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index < listPocket.length) {
              return GestureDetector(child: Poket(item: listPocket[index]));
            } else {
              return GestureDetector(child: const PocketAdd());
            }

       
          },
        ),
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.all(8.0),
        child: BarNavigation(page: false),
      ),
    );
  }
}
