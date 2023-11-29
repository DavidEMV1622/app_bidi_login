import 'package:app_credibanco_login/src/colors/colors.dart';
import 'package:flutter/material.dart';

import '../../config/arrow_router.dart';
import '../../models/movimientos_model.dart';
import '../utils/TextFormatter.dart';
import '../widgets/movimientos_card.dart';

class MovimientoPage extends StatefulWidget {
  const MovimientoPage({super.key});

  @override
  State<MovimientoPage> createState() => _MovimientoPageState();
}

class _MovimientoPageState extends State<MovimientoPage> {
  @override
  Widget build(BuildContext context) {

    List<Movimiento> listMovimientos = [
      Movimiento(1, "David Méndez", 500000, "13/12/2023"),
      Movimiento(2, "Jesus Borda", 1000000, "10/10/2023"),
      Movimiento(3, "Juan Carlos", 30000, "11/11/2023"),
      Movimiento(4, "Laura Alarccon", 50000, "09/07/2023"),
    ];

    return Scaffold(
      appBar: AppBar(
        title: textoEtiquetaTwo("Movimientos", 24),
        centerTitle: true,
        backgroundColor: CustomColors.colorBlanco,
        leading: const ArrowRouter(),
      ),

      body: ListView(children: const [
        MovimientosCard(),
        MovimientosCard(),
      ],)
    );
  }
}