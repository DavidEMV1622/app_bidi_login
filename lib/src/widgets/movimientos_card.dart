import 'package:app_credibanco_login/models/movimientos_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../colors/colors.dart';
import '../utils/TextFormatter.dart';

class MovimientosCard extends StatelessWidget {
  final Movimiento movimientosList;
  const MovimientosCard({super.key, required this.movimientosList});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String simboloDolar = "\$";
    
    return SizedBox(
      width: MediaQuery.of(context).size.width,

      child: SizedBox(
        height: 100,
        width: size.width,
        child: Card(
          elevation: 10.0,
          margin: const EdgeInsets.only(bottom: 10, top: 10),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Padding(padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Row(children: [
                    CircleAvatar(
                      radius: 31,
                      backgroundColor: CustomColors.colorGris_5,
                      child: movimientosList.isTrue == true ?
                      SvgPicture.asset( 
                        "assets/icons/send.svg",
                        width: 25,
                        color: CustomColors.colorAmarilloMostaza,
                      ) : 
                      SvgPicture.asset( 
                        "assets/icons/receive.svg",
                        width: 25,
                        color: CustomColors.colorVerdePantano,
                      ),
                      
                    ),
                    SizedBox(width: 10),
      
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                        textoEtiquetaTwo(movimientosList.name, 16),

                        textColorSize(movimientosList.id.toString(), 16, CustomColors.colorGris_1),
                      ],
                    ),
                  ]),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    Row(children: [
                      textoEtiquetaTwo(simboloDolar, 16), textoEtiquetaTwo(movimientosList.valor.toString(), 16)],
                    ),
                    textColorSize(movimientosList.fecha, 16, CustomColors.colorGris_1),
                  ],
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}