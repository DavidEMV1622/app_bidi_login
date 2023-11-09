import 'package:app_credibanco_login/src/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'list_pocket.dart';
import '../../../config/arrow_router.dart';
import '../../../models/pocket_model.dart';

class PocketEdit extends StatefulWidget {
  final Pocket pocket;
  final String id;
  // final int? index;
  const PocketEdit({
    super.key,
    required this.pocket,
    required this.id,
    /*required this.index*/
  });

  @override
  State<PocketEdit> createState() => _PocketEditState();
}

class _PocketEditState extends State<PocketEdit> {
  //late final GoRouterState state;
  /*   PocketEdit(this.state)
  final parameters = state.path;
 */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ArrowRouter(activeArrow: "1"),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Editar bolsillo", style: TextStyle(color: Colors.black)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Iconify(
                Bi.trash_fill,
                color: Color.fromARGB(255, 7, 7, 7),
              ),
              onPressed: () {
                // eliminarPocket(index);
              },
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
                          color: widget.pocket.colorPocket,
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
                          widget.pocket.namePocket,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.pocket.pocketBalance.toString(),
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

  /* void eliminarPocket(int index) {
    setState(() {
      listPocket.removeAt(widget.pocket);
    });
  } */
}
