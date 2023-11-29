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
      Movimiento(1, "David Méndez", 500000, "13/12/2023", true),
      Movimiento(2, "Jesus Borda", 1000000, "10/10/2023", false),
      Movimiento(3, "Juan Carlos", 30000, "11/11/2023", false),
      Movimiento(4, "Laura Alarcon", 50000, "09/07/2023", true),
      Movimiento(5, "David Méndez", 500000, "13/12/2023", true),
      Movimiento(6, "Jesus Borda", 1000000, "10/10/2023", false),
      Movimiento(7, "Juan Carlos", 30000, "11/11/2023", false),
      Movimiento(8, "Laura Alarcon", 50000, "09/07/2023", true),
      Movimiento(9, "David Méndez", 500000, "13/12/2023", true),
      Movimiento(10, "Jesus Borda", 1000000, "10/10/2023", false),
      Movimiento(11, "Juan Carlos", 30000, "11/11/2023", false),
      Movimiento(12, "Laura Alarcon", 50000, "09/07/2023", true),
    ];

    return Scaffold(
      appBar: AppBar(
        title: textoEtiquetaTwo("Movimientos", 24),
        centerTitle: true,
        backgroundColor: CustomColors.colorBlanco,
        leading: const ArrowRouter(activeArrow: "1",),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 34),
        child: ListView.builder(
          itemCount: listMovimientos.length,
          itemBuilder: (context, index) {
            return MovimientosCard(movimientosList: listMovimientos[index],);
          },
        ),
      )
    );
  }
}