import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../colors/colors.dart';
import '../utils/TextFormatter.dart';

class MovimientosCard extends StatelessWidget {
  const MovimientosCard({super.key});

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
                      child: SvgPicture.asset( 
                        "assets/icons/send.svg",
                        width: 25,
                        color: CustomColors.colorAmarilloMostaza,
                      ),
                      
                    ),
                    SizedBox(width: 10),
      
                    textoEtiquetaTwo("500.000", 16),
                  ]),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    Row(children: [
                      textoEtiquetaTwo(simboloDolar, 16), textoEtiquetaTwo("500.000", 16)],
                    ),
                    textColorSize("10/10/2023", 16, CustomColors.colorGris_1),
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