import 'package:app_credibanco_login/models/pocket_model.dart';
import 'package:app_credibanco_login/src/widgets/pocket.dart';
import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.only(top: 45),
        child: GridView.builder(
          padding: EdgeInsets.only(
            bottom: 5.5,
            top: 5.5,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: listPocket.length,
          itemBuilder: (BuildContext context, int index) {
            return Poket(item: listPocket[index]);
          },
        ),
      ),
    );
  }
}
