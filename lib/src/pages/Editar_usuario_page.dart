// ignore_for_file: file_names, use_build_context_synchronously

import 'package:app_credibanco_login/src/Back-end/Dto/User/update_user.dart';
import 'package:app_credibanco_login/src/Back-end/Dto/User/user_DTO.dart';
import 'package:app_credibanco_login/src/widgets/buttons.dart';
import 'package:app_credibanco_login/src/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../config/arrow_router.dart';
import '../Back-end/Dto/User/get_user.dart';
import '../common/enumValidate.dart';
import '../utils/TextFormatter.dart';

import '../colors/colors.dart';
import '../widgets/pop-up.dart';

class UpdateUserPage extends StatefulWidget {
  const UpdateUserPage({super.key});
  @override
  State<UpdateUserPage> createState() => _UpdateUserPageState();
}

class _UpdateUserPageState extends State<UpdateUserPage> {

  @override
  void initState() {
    super.initState();
    fetchProviderData();
  }

  // Metodo para actualizar los valores en cada input
  Future <void> fetchProviderData() async {
    //await getUserDTO(context: context);
    ctrlUserProfile.text = context.read<User>().getUserName!;
    ctrlName.text = context.read<User>().getFirstName!;
    ctrlApellido.text = context.read<User>().getLastName!;
    ctrlEmail.text = context.read<User>().getEmail!;
  }

  // Variable de tipo boolean para icono de si o no mostrar contrasenia
  bool passenable = true;

  // Variable para saber si el contenido de los controladores (ctrlConfirmPassword, ctrlPassword) son iguales
  bool confirmPasswordTrueOrFalse = true;

  // Controladores que se manejan en cada formulario
  TextEditingController ctrlUserProfile = TextEditingController();
  TextEditingController ctrlName = TextEditingController();
  TextEditingController ctrlApellido = TextEditingController();
  TextEditingController ctrlEmail = TextEditingController();
  
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>(); /* Clave que se utiliza para identificar y 
                                                    controlar el estado o validacion de un formulario  */

  @override
  Widget build(BuildContext context) {
    // Plantilla principal "Scaffold"
    return Scaffold(
      // Barra principal de navegación "AppBar"
      appBar: AppBar(
        backgroundColor: CustomColors
            .colorBlanco, // Color del AppBar por medio de la clase "CustomColors"
        leading: const ArrowRouter(),
      ),

      // ---- Cuerpo o contenido de la aplicación "body" ----
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _keyForm, // Define un formulario con una llave para controlarlo
          child: ListView(
            children: [
              tituloEncabezadoUno("bidi"),
                
              // ---- Agregar un espacio entre los dos widgets (Text, Align)----
              const SizedBox(
                height: 35.0,
              ),
          
              Align(
                alignment: Alignment.centerLeft,
                child: subtituloUno("Editar Usuario")
              ),

              // input de perfil del usuario
              InputTextValidations(
                textoInput: "Perfil de usuario",
                enabledInput: false,
                inputType: TextInputType.name,
                controller: ctrlUserProfile,
                validateText: ValidateText.password,
                imageIcon: 'assets/icons/user_profile.svg',
              ),

              const SizedBox(
                height: 15.0,
              ),
          
              // input de nombre
              InputTextValidations(
                textoInput: "Nombre",
                inputType: TextInputType.name,
                controller: ctrlName,
                validateText: ValidateText.name,
                imageIcon: 'assets/icons/name.svg',
              ),

              const SizedBox(
                height: 15.0,
              ),
          
              // input de apellido
              InputTextValidations(
                textoInput: "Apellido",
                inputType: TextInputType.name,
                controller: ctrlApellido,
                validateText: ValidateText.lastname,
                imageIcon: 'assets/icons/name.svg',
              ),

              const SizedBox(
                height: 15.0,
              ),
          
              // input de email
              InputTextValidations(
                textoInput: "Correo electronico",
                enabledInput: false,
                inputType: TextInputType.emailAddress,
                controller: ctrlEmail,
                validateText: ValidateText.email,
                imageIcon: 'assets/icons/email.svg',
              ),
          
              const SizedBox(
                height: 15.0,
              ),

              Align(
                alignment: Alignment.centerRight,
                child: FloatingActionButton(
                  elevation: 10.0,
                  backgroundColor: CustomColors.colorAmarilloMostaza, 
                  onPressed: () {
                    DialogChangePassword.showMyGeneralDialog(context: context);
                  },
                  child: SvgPicture.asset( 
                    "assets/icons/password.svg",
                    width: 25,
                    color: CustomColors.colorBlanco,
                  ),
                ),
              ),

              const SizedBox(
                height: 15.0,
              ),

              Row(children: <Widget>[
                const Expanded(
                  child: Divider(
                  color: CustomColors.colorNegro,
                  thickness: 1,
                )),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: const Text("O"),
                ),
                const Expanded(
                  child: Divider(
                  color: CustomColors.colorNegro,
                  thickness: 1,
                )),
              ]),

              const SizedBox(
                height: 35.0,
              ),
          
              ButtonPrimary(
                textButton: "Guardar",
                colorBox: CustomColors.colorAmarilloMostaza,
                widthButton: MediaQuery.of(context).size.width,
                onPressed: save,
              ),
            ]
          ),
        ),
      ),
    );
  }
  // funcion para saber si los inputs tienen correcto su contenido
  save() async {
    if (_keyForm.currentState!.validate()) {

      final response = await updateUserDTO(
        username: ctrlUserProfile.text, 
        firstName: ctrlName.text, 
        lastName: ctrlApellido.text, 
        email: ctrlEmail.text, 
        context: context,
      );

      if (response == 200) {
        print("Se edito el usuario");
        _mostrarPopupCorrecto(context);
      
      } else {
        print("El usuario no se pudo editar");
        _mostrarPopupError(context);
      }
    }
  }


  void _mostrarPopupCorrecto(BuildContext context) {
    DialogUtils.showMyGeneralDialog(context: context, 
    iconoMostrar: Icons.verified_user,
    mensajePopUp: "Se ha editado tus datos correctamente",
    //onPressed: () => context.pushReplacement("/loginPage"),
    onPressed: () async{
      await getUser(context: context);
      context.go("/userLogin");
    },
    );
  }

  void _mostrarPopupError(BuildContext context) {
    DialogUtils.showMyGeneralDialog(context: context, 
      iconoMostrar: Icons.error_outline,
      mensajePopUp: "No se pudo editar los datos",
      onPressed: () {
        context.pop();
      }
    );
  }
}