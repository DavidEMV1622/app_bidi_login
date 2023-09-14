import 'package:app_credibanco_login/src/pages/Logeado.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../colors/colors.dart';
import '../widgets/buttons.dart';
import '../widgets/widgets_avisos_Page/avisosPage_general.dart';
import '../widgets/widgets_avisos_Page/barrProgress.dart';

class AvisoPage extends StatefulWidget {
  final String activeArrow;
  const AvisoPage({super.key, required this.activeArrow});

  @override
  State<AvisoPage> createState() => _AvisoPageState();
}

class _AvisoPageState extends State<AvisoPage> {

  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Manejo del AppBar
      appBar: AppBar(
        backgroundColor: CustomColors.colorBlanco,
        elevation: 0.0,
        leading: widget.activeArrow == "1" ? IconButton(
          icon: Icon(Icons.arrow_back), // Personaliza flecha
          color: Colors.black,
          onPressed: () {
            print("${widget.activeArrow}");
            context.pop();
          },
        ) : null,
      ),
      

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Text("$page"),
            ProgressBarr(pageActual: page, cantidadBarr: 3,),

            // Inicio del manejo del PageView
            Expanded(
              child: PageView(
                
                onPageChanged: (currentpage){
                  setState(() {
                  page = currentpage;  
                  }); 
                },

                physics: const ScrollPhysics(), // animacion al llegar al final de la lista
                scrollDirection: Axis.horizontal, // Mover el slide en horizontal
            
                // Llamada de cada pantalla
                children: [
                  AvisosPageGeneral(
                    subtituloDosGeneral: "Bienvenido",
                    textoCuerpoGeneral: "En nuestra App además recibir los pagos de tus clientes con los distintos medios disponibles, podrás ver y gestionar las transacciones integrando a tu equipo de trabajo en el proceso.",
                    imageGeneralTwo: SvgPicture.asset( 
                      'assets/imageOnePointOne.svg',
                      width: 95,
                    ),
                    imageGeneral: SvgPicture.asset( 
                      'assets/imageOne.svg',
                      width: 400,
                    ),
                  ),
                  
                  AvisosPageGeneral(
                    subtituloDosGeneral: "Bienvenido", 
                    textoCuerpoGeneral: "Podrás realizar la administración de usuarios siempre que lo desees desde la opción de: ",
                    textoEtiquetaGeneral: "Más- Administración de usuarios",
                    imageGeneral: SvgPicture.asset( 
                      'assets/imagetwo.svg',
                      width: 230,
                    ),
                  ),
                  
                  AvisosPageGeneral(
                    textoCuerpoGeneral: "Podrás crear usuarios, activarlos, inactivarlos y editarlos",
                    imageGeneral: SvgPicture.asset( 
                      'assets/imageThree.svg',
                      width: 400,
                    ),
                  ),
                ]
              ),
            ),
          ],
        )
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(22, 10, 22, 20),

        child: page == 2? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          
          children: [
            BtnPrimaery(
              textButton: "Omitir",
              colorBox: CustomColors.colorBlanco,
              border: Border.all(width: 2),
              widthButton: MediaQuery.of(context).size.width * 0.40,
              onPressed: () {},
            ),

            const SizedBox(
              width: 15,
            ),

            BtnPrimaery(
              textButton: "Continuar",
              colorBox: CustomColors.colorAmarilloMostaza,
              widthButton: MediaQuery.of(context).size.width * 0.40,
              onPressed: () {
                context.go("/logeadoPage");
              },
            ),
          ]
        ) : null,
      ),
    );
  }
}