import 'package:app_credibanco_login/models/pocket_model.dart';
import 'package:flutter/material.dart';


class MyPocket extends StatefulWidget {
  const MyPocket({super.key});

  @override
  State<MyPocket> createState() => _MyPocketState();
}

class _MyPocketState extends State<MyPocket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Mis bolsillos"),
          centerTitle: true,
        ),
        body: //PocketList(),
            Column(
          children: [
            PocketList(),
          ],
        ));
  }
}

class PocketList extends StatefulWidget {
  const PocketList({super.key});
  @override
  State<PocketList> createState() => _PocketListState();
}


class _PocketListState extends State<PocketList> {
  List<Pocket> _pocket = [
    Pocket("Carro", "600.000", const Color.fromARGB(255, 147, 147, 147)),
    Pocket("Casa", "200.000", Color.fromARGB(255, 229, 10, 10)),
    Pocket("Beca", "400.000", Color.fromARGB(255, 244, 228, 9)),
    Pocket("Arriendo", "800.000", Color.fromARGB(255, 45, 178, 15)),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: _pocket.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        GestureDetector(
            onTap: () {},
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Column(
                children: [
                  Container(
                    height: 66,
                    width: 154,
                    decoration: BoxDecoration(
                        color: _pocket[index].colorPocket, //Colors.cyan7
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15))),
                  ),
                  SizedBox(
                    height: 66,
                    width: 154,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          _pocket[index].namePocket,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          _pocket[index].pocketBalance,
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              color: Color(0xFF878787)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ));
      },
    );
  } 
}
