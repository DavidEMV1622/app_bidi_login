/* import 'package:flutter/material.dart';

class Pocket extends StatefulWidget {

  
  const Pocket({super.key});

  @override
  State<Pocket> createState() => _PocketState();
}

class _PocketState extends State<Pocket> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Column(
        children: [
          Container(
            height: 66,
            width: 154,
            decoration: BoxDecoration(
                color: Colors.cyan,
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
                  'Comida',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '1000000',
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
    );
  }
}
 */