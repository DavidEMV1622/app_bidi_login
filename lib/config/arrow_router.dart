import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ArrowRouter extends StatelessWidget {
  final String activeArrow;
  const ArrowRouter({super.key, required this.activeArrow});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: activeArrow == "1" ? IconButton(
          icon: const Icon(Icons.arrow_back), // Personaliza flecha
          color: Colors.black,
          onPressed: () {
            //print("$activeArrow");
            context.pop();
          },
        ) : null
    );
  }
}