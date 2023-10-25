import 'package:app_credibanco_login/models/pocket_model.dart';
import 'package:flutter/material.dart';

class Poket extends StatelessWidget {
  final Pocket item;
  const Poket({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 154,
      child: Card(
        elevation: 10.0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Column(
          children: [
            Container(
              height: 66,
              decoration: BoxDecoration(
                  color: item.colorPocket,
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
                  item.namePocket,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  item.pocketBalance,
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
    );
  }
}

class PocketAdd extends StatefulWidget {
  const PocketAdd({super.key});

  @override
  State<PocketAdd> createState() => _PocketAddState();
}

class _PocketAddState extends State<PocketAdd> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 154,
      child: Card(
        elevation: 10.0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Container(
          height: 66,
          decoration: const BoxDecoration(
              color: Color(0XFFEFEFEF),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  size: 44,
                ),
                Text(
                  'Nuevo \n Bolsillo',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
