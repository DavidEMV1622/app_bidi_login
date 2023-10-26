import 'package:flutter/material.dart';

import '../../config/arrow_router.dart';
import '../utils/TextFormatter.dart';

class MovimientoPage extends StatelessWidget {
  const MovimientoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: textoEtiquetaTwo("Movimientos", 24),
        leading: const ArrowRouter(activeArrow: "1",),
      ),

      body: Text(""),
    );
  }
}