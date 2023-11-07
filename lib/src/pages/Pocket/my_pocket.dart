import 'package:app_credibanco_login/models/pocket_model.dart';
import 'package:app_credibanco_login/src/pages/Pocket/pocket_create.dart';
import 'package:app_credibanco_login/src/widgets/pocket.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../config/arrow_router.dart';
import '../../widgets/dropBar.dart';
import 'list_pocket.dart';

class PocketList extends StatefulWidget {
  const PocketList({super.key});
  @override
  State<PocketList> createState() => _PocketListState();
}

class _PocketListState extends State<PocketList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
              final pocket = listPocket[index];
              void navigateToDestination(BuildContext context) {
                GoRouter.of(context).go('/PocketEdit', extra: pocket);
              }

              return GestureDetector(
                child: Poket(item: listPocket[index]),
                onTap: () {
                  context.push(
                    "/PocketEdit",
                    extra: pocket,
                  );
                },
                // onTap: () => navigateToDestination(context),
              );

              //
            } else {
              return GestureDetector(
                child: const PocketAdd(),
                onTap: () {
                  context.push("/PocketCreate");
                },
              );
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
