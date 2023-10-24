import 'package:app_credibanco_login/models/pocket_model.dart';
import 'package:flutter/material.dart';

class Poket extends StatelessWidget {
  final Pocket item;
  const Poket({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: 154,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Column(
          children: [
            Expanded(
              child: Container(
                //height: 66,
                decoration: BoxDecoration(
                    color: item.colorPocket,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Text(
                  item.namePocket,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  item.pocketBalance,
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      color: Color.fromARGB(255, 147, 147, 147)),
                )
              ],
            )

            /* Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    item.namePocket,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    item.pocketBalance,
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        color: Color.fromARGB(255, 147, 147, 147)),
                  )
                ],
              ),
            ) */
          ],
        ),
      ),
    );
  }
}
