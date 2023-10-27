// ignore_for_file: file_names
import 'package:app_credibanco_login/src/widgets/dropBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';

import '../colors/colors.dart';
import '../utils/TextFormatter.dart';
import '../widgets/buttons.dart';

class LogeadoPage extends StatefulWidget {
  const LogeadoPage({super.key});

  @override
  State<LogeadoPage> createState() => _LogeadoPageState();
}

class _LogeadoPageState extends State<LogeadoPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String simboloDolar = "\$";

    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {
          
        }, icon: const Icon(Icons.menu, size: 30, color: CustomColors.colorNegro))],
        title: Row(children: [
          const CircleAvatar(
            radius: 25,
            backgroundColor: CustomColors.colorVerdePantanoClaro,
            child: Text(""),
          ),

          const SizedBox(
            width: 10,
          ),

          textoEtiquetaTwo("Hola, David", 20)
        ]),
        backgroundColor: CustomColors.colorVerdePantano,
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          Container(
            width: size.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50), 
                bottomRight: Radius.circular(50)), 
              color:  CustomColors.colorVerdePantano,
            ),
            child: Padding(
              padding:const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 28,
                  ),

                  Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.end, children: [textoEtiquetaTwo(simboloDolar, 30), textoEtiquetaTwo("500.000", 40)],),
                  
                  textoEtiquetaTwo("Disponible", 15),

                  const SizedBox(
                    height: 36,
                  ),

                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: CustomColors.colorVerdePantanoClaro, //<-- SEE HERE
                          child: IconButton(
                            icon: SvgPicture.asset( 
                              "assets/icons/send.svg",
                              width: 15 ,
                            ),
                            onPressed: () {},
                          ),
                        ),

                        const SizedBox(
                          height: 15,
                        ),

                        textoEtiquetaTwo("Enviar", 16),
                      ],
                    ),

                    Column(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: CustomColors.colorVerdePantanoClaro, //<-- SEE HERE
                          child: IconButton(
                            icon: SvgPicture.asset( 
                              "assets/icons/withdraw.svg",
                              width: 15,
                            ),
                            onPressed: () {},
                          ),
                        ),

                        const SizedBox(
                          height: 15,
                        ),

                        textoEtiquetaTwo("Retirar", 16),
                      ],
                    ),

                    Column(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: CustomColors.colorVerdePantanoClaro, //<-- SEE HERE
                          child: IconButton(
                            icon: SvgPicture.asset( 
                              "assets/icons/receive.svg",
                              width: 15,
                            ),
                            onPressed: () {},
                          ),
                        ),

                        const SizedBox(
                          height: 15,
                        ),

                        textoEtiquetaTwo("Recibir", 16),
                      ],
                    )

                  ],),
                  const SizedBox(
                    height: 45,
                  ), 
                ],
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: textoEtiquetaTwo("Movimientos", 16),
              ),

              BotonLink(
                textoLink: "Ver Todos",
                colorText: CustomColors.colorGris_1,
                onPressed: () {
                  context.push("/Movimientos");
                },
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: const BarNavigation(page: true),
    );
  }
}
