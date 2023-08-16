// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/TextFormatter.dart';

class AvisosPageGeneral extends StatelessWidget {

  final String subtituloDosGeneral;
  final String textoCuerpoGeneral;
  final String? textoEtiquetaGeneral;
  final SvgPicture imageGeneral;

  const AvisosPageGeneral({super.key, required this.subtituloDosGeneral, required this.textoCuerpoGeneral, this.textoEtiquetaGeneral, required this.imageGeneral});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      /* Definir parametro principal del largo y alto de la 
      pantalla para el contenido*/
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,

      child: Center(
        child: Padding(
          // Padding de separacion entre el contenido y los bordes del celular
          padding: const EdgeInsets.fromLTRB(22, 10, 22, 24),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
        
            children: <Widget>[

              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.04,
              // ),
              subtituloDos(subtituloDosGeneral, 
              MediaQuery.of(context).size.width > 1000? 34
              : MediaQuery.of(context).size.width > 800? 30 
              : MediaQuery.of(context).size.width > 600? 26 
              : MediaQuery.of(context).size.width > 400? 22
              : 18,),
              
              // Separacion entre cada texto
              const SizedBox(
                height: 17,
              ),
        
              textoCuerpoTwo(textoCuerpoGeneral,
              MediaQuery.of(context).size.width > 1000? 30
              : MediaQuery.of(context).size.width > 800? 26
              : MediaQuery.of(context).size.width > 600? 22
              : MediaQuery.of(context).size.width > 400? 18 
              : 14,),

              if (textoEtiquetaGeneral != null)
                const SizedBox(
                  height: 17,
                ),

              if (textoEtiquetaGeneral != null)
                textoEtiquetaTwo(textoEtiquetaGeneral!, 
                MediaQuery.of(context).size.width > 1000? 30
                : MediaQuery.of(context).size.width > 800? 26
                : MediaQuery.of(context).size.width > 600? 22
                : MediaQuery.of(context).size.width > 400? 18
                : 14,),
              
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),

              // Llamado de la imagen y dejarlo centrado
              Center(
                child: imageGeneral,
              ),
            ]
          ),
        ),
      ),
  );
  }
}