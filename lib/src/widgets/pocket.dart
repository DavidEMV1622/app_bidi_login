import 'package:flutter/material.dart';

class Pocket extends StatefulWidget {
  const Pocket({super.key});

  @override
  State<Pocket> createState() => _PocketState();
}

class _PocketState extends State<Pocket> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            height: 66,
            width: 154,
            decoration: BoxDecoration(
                color: Colors.cyan, border: Border.all(color: Colors.black)),
          ),
          Container(
            height: 66,
            width: 154,
            decoration: BoxDecoration(
                color: Colors.white, border: Border.all(color: Colors.black)),
          )
        ],
      ),
    );
  }
}
