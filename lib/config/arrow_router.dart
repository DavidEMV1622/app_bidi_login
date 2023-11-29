import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ArrowRouter extends StatelessWidget {
  const ArrowRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.arrow_back), // Personaliza flecha
        color: Colors.black,
        onPressed: () {
          context.pop();
        },
      );
  }
}