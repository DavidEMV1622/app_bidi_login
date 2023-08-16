// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../colors/colors.dart';

class ProgressBarr extends StatefulWidget {
  final int pageActual; // Número de pantalla que se esta actualmente
  final int cantidadBarr; // Número de barras de progreso a crear

  const ProgressBarr(
      {super.key, required this.pageActual, required this.cantidadBarr});

  @override
  State<ProgressBarr> createState() => _ProgressBarrState();
}

class _ProgressBarrState extends State<ProgressBarr> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
      child: SizedBox( // Espacio que abarcas todas las barras
        width: size.width,
        height: 10,
        
        child: ListView.separated( // Separacion entre cada barra
          scrollDirection: Axis.horizontal, // Cada barra se acomoda en horizontal
          itemCount: widget.cantidadBarr, // Cantidad de barras a crear
          separatorBuilder: (context, index) => 
            const SizedBox(
              width: 10,
            ),
          
          itemBuilder: (BuildContext context, index) => // Manejo de cada barra
            Container(
              height: 4.5,
              /* se resta la cantidad de barras a pintar - 1 para que no se agregue un espacio de 10 adicional en la 
              ultima barra (widget.cantidadBarr - 1), despues se multiplica por el espacio que haber entre cada barra
              segun el separatorBuilder que es 10 ((widget.cantidadBarr - 1) * 10), el resultado de la multiplicacion 
              se resta con el ancho de la pantalla 100% (puede ser double o int; (size.width - ((widget.cantidadBarr - 1) * 10))) 
              y asi se adapta el ancho de cada barra de progreso segun el ancho de la pantalla dividiendolo entre 
              la cantidad de barras a crear (size.width - ((widget.cantidadBarr - 1) * 10)) / widget.cantidadBarr.
              Para que las barras no queden pegados al borde del celular, se resta en 48 que es el espacio de
              derecha a izquierda (left 24, right 24 = 48) => ((widget.cantidadBarr - 1) * 10)) - 48), ya esta 
              parte depende del pading o separacion del ancho del celular*/
              width: ((size.width - ((widget.cantidadBarr - 1) * 10)) - 48) / widget.cantidadBarr,
              decoration: BoxDecoration(
                // Se pinta de un color o no cuando pase de pantalla
                color: widget.pageActual < index ?  CustomColors.colorGris_4 : CustomColors.colorVerdePantano,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
        ),
      ),
    );

    /*
    Container(
      width: size.width,
      height: 10,
      
      decoration: const BoxDecoration(
        color: Colors.red,
      ),
      
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.cantidadBarr,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 4.5,
            width: (size.width - ((widget.cantidadBarr - 1) * 10))/ widget.cantidadBarr,
            margin:  EdgeInsets.only(right: index == (widget.cantidadBarr - 1) ? 0 : 10.0),
            decoration: BoxDecoration(
              color: widget.pageActual <= index ?  CustomColors.colorGris_3 : Colors.red,
              //color: widget.pageActual < index ?  Colors.transparent : Colors.transparent,
              borderRadius: BorderRadius.circular(12)
            ),
          );
        }
      ),
    );*/
  }
}