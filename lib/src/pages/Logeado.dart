// ignore_for_file: file_names
import 'package:app_credibanco_login/src/widgets/dropBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../Back-end/Dto/Token.dart';
import '../Back-end/Dto/User/get_user.dart';
import '../colors/colors.dart';
import '../utils/TextFormatter.dart';
import '../widgets/buttons.dart';
import '../widgets/pop-up.dart';

class LogeadoPage extends StatefulWidget {
  const LogeadoPage({super.key});

  @override
  State<LogeadoPage> createState() => _LogeadoPageState();
}

class _LogeadoPageState extends State<LogeadoPage> {

  @override
  void initState() {
    super.initState();
    fetchProviderData();
  }

  Future <void> fetchProviderData() async {
    await getUser(context: context);
  }

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async => false, // Permite no salir de la pantalla utilizando los botones dinamicos del celular
      child: Scaffold(
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
    
            textoEtiquetaTwo("Hola, ${context.watch<GetUserProvider>().firstName}", 20),
    
            ElevatedButton(onPressed: () {
              mostrarPopupAdvertencia(context);
            }, child: Text("data"))
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
    
                    Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.end, children: [textoEtiquetaTwo("\$", 30), textoEtiquetaTwo("500.000", 40)],),
                    
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
            ),
            
            const SizedBox(
              height: 45,
            ),
    
            ElevatedButton(
              onPressed: () async{
                final response = await getUser(context: context);
                
                if (response == 200) {
                  print("Informacion Obtenida");
                  context.push("/viewUserData");
                } else {
                  print("problemas al obtener la informacion del usuaario");
                }
              }, 
              child: const Text("Obtener datos del usuario")
            ),
          ],
        ),
        bottomNavigationBar: const BarNavigation(page: true),
      ),
    );
  }


  mostrarPopupAdvertencia(BuildContext context) {
    DialogUtils.showMyGeneralDialog(context: context, 
      iconoMostrar: Icons.details_rounded,
      mensajePopUp: "¿Deseas cerrar sesión?",
      onPressed: () {
        context.read<TokenProvider>().guardarDecodedToken(<String, dynamic>{});
        context.read<TokenProvider>().guardarToken("");
        context.pushReplacement("/loginPage");
      }
    );
  }
}
