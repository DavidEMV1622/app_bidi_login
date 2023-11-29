// ignore_for_file: file_names
import 'package:app_credibanco_login/src/widgets/dropBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../models/movimientos_model.dart';
import '../colors/colors.dart';
import '../common/inputValidate.dart';
import '../utils/TextFormatter.dart';
import '../widgets/buttons.dart';
import '../widgets/movimientos_card.dart';

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

    List<Movimiento> listMovimientos = [
      Movimiento(1, "David Méndez", 500000, "13/12/2023", true),
      Movimiento(2, "Jesus Borda", 1000000, "10/10/2023", false),
      Movimiento(3, "Juan Carlos", 30000, "11/11/2023", false),
      Movimiento(4, "Laura Alarccon", 50000, "09/07/2023", true),
      Movimiento(5, "David Méndez", 500000, "13/12/2023", true),
      Movimiento(6, "Jesus Borda", 1000000, "10/10/2023", false),
      Movimiento(7, "Juan Carlos", 30000, "11/11/2023", false),
      Movimiento(8, "Laura Alarccon", 50000, "09/07/2023", true),
      Movimiento(9, "David Méndez", 500000, "13/12/2023", true),
      Movimiento(10, "Jesus Borda", 1000000, "10/10/2023", false),
      Movimiento(11, "Juan Carlos", 30000, "11/11/2023", false),
      Movimiento(12, "Laura Alarccon", 50000, "09/07/2023", true),
    ];

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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center, 
                    crossAxisAlignment: CrossAxisAlignment.end, 
                    children: [textoEtiquetaTwo(simboloDolar, 30), textoEtiquetaTwo(formatNumber(500000), 40)],
                  ),
                  
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

          Padding(
            padding: const EdgeInsets.only(left: 23, right: 23, top: 43, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            ),
          ),

          Container(
            height: size.height * 0.3,
            width: size.width,
            margin: const EdgeInsets.symmetric(horizontal: 23),
            child: ListView.builder(
              itemCount: listMovimientos.length >= 6 ? 6 : listMovimientos.length,
              itemBuilder: (context, index) {
                return MovimientosCard(movimientosList: listMovimientos[index],);
              }, 
            ),
          )
        ],
      ),
      bottomNavigationBar: const BarNavigation(page: true),
    );
  }
}