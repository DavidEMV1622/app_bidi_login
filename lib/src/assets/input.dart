import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../colors/colors.dart';
import '../common/enumValidate.dart';
import '../common/inputValidate.dart';
import '../utils/TextFormatter.dart';

// Variable de tipo boolean para icono de si o no mostrar contrasenia
  bool passenable = true;

// ---- Widget para el campo de texto "Correo" ----
/*Widget inputText(String textoCorreo) {
  return Container(
    // Permite definir el diseño de la caja de texto "BoxDecoration"
    decoration: BoxDecoration(
      color: CustomColors.colorBlanco, // Color del input
      borderRadius:
          BorderRadius.circular(4.0), // Define los bordes redondeados
      border: Border.all(
        // Define el grosor y color de borde
        color: CustomColors.colorNegro,
        width: 1.0,
      ),
    ),
    // Espaciado entre el borde y el contenido
    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
    //margin: EdgeInsets.symmetric(horizontal: 10.0),

    // Uso de un input (Campo de texto)
    child: TextField(
        style: TextStyle(fontSize: 14.0), // Tamanio del texto
        decoration: InputDecoration.collapsed(
          /* Quita la linea que viene por 
                                                  defecto en el input "InputDecoration.collapsed" */
          hintText: textoCorreo, // Place holder en el input
        )),
    
          //height: 35,
          //width: 1000.0,
          
    margin: EdgeInsets.symmetric(
      horizontal: 0,
      vertical: 5,
    ),
  );
} */

// ---- Clase para un input general ----
class InputText extends StatefulWidget {

  final String textoInput;

  final inputType;

  InputText({required this.textoInput, required this.inputType});

  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {

  @override
  Widget build(BuildContext context) {
    return Container(
    // Definir el diseño de la caja de texto "BoxDecoration"
    decoration: BoxDecoration(
      color: CustomColors.colorBlanco, // Color del input
      borderRadius: BorderRadius.circular(4.0), // Define los bordes redondeados
      // Define el grosor y color de borde
      border: Border.all(
        color: CustomColors.colorNegro,
        width: 1.0,
      ),
    ),
    // Espaciado entre el borde y el contenido
    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
    //margin: EdgeInsets.symmetric(horizontal: 10.0),

    // Uso de un input (Campo de texto)
    child: TextField(
        keyboardType: widget.inputType, // tipo de teclado que aparecera en el dispositivo movil
        style: TextStyle(fontSize: 14.0), // Tamanio del texto
        decoration: InputDecoration.collapsed( /* Quita la linea que viene por 
                                              defecto en el input "InputDecoration.collapsed" */
          hintText: widget.textoInput, // Place holder en el input
        )),
    
          //height: 35,
          //width: 1000.0,
          
    margin: EdgeInsets.symmetric(
      horizontal: 0,
      vertical: 5,
    ),
  );
  }
}

// ---- Widget para el campo de texto "Contrasenia" ----
/*Widget inputPassword(String textoContrasenia, context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 254, 254, 1),
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.black,
          width: 1.0,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),

      // Uso de un input (Campo de texto)
      child: TextField(
        obscureText:
            passenable, // Oculta el contenido si es "true" y lo muestra si es "false"
        style: TextStyle(fontSize: 25),
        decoration: InputDecoration(
          hintText: textoContrasenia,
          border: InputBorder
              .none, // Quita la línea que viene por defecto en el TextField

          suffixIcon: IconButton(

            // Agrega un icono para mostrar y otro para no mostrar contrasenia
            icon: new Icon(passenable == true
                ? Icons.visibility_off
                : Icons.visibility),

            /* Agrega una animación al presionar el boton y permite realizar una accion 
            agregandolo entre las {} */
            onPressed: () {
              // Permite redibujar el widget para que se muestre los cambios en la aplicación
              setState(() {
                if (passenable) {
                  passenable = false;
                } else {
                  passenable = true;
                }
              });
            },
          ),
        )
      )
    );
  }
*/

/* Clase para manejar el inputPassword, ya que el setState necesita un build (context) para poder 
actualizar el estado del mismo */
class PasswordInput extends StatefulWidget {

  final String textoContrasenia;

  PasswordInput({required this.textoContrasenia});

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool passEnable = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      // ---- Diseño de la caja del input ----
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 254, 254, 1), // Color del campo
        borderRadius: BorderRadius.circular(4.0), // Borde de las esquinas
        // Color y grosor de los bordes
        border: Border.all(
          color: Colors.black,
          width: 1.0,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),

      // Uso de un input (Campo de texto)
      child: TextField(
        obscureText: passenable, // Oculta el contenido si es "true" y lo muestra si es "false"
        style: TextStyle(fontSize: 14),
        decoration: InputDecoration(
          hintText: widget.textoContrasenia, // place holder
          border: InputBorder.none, // Quita la línea que viene por defecto en el TextField

          // Manejar un icono dentro del input
          suffixIcon: IconButton(
            // Agrega un icono para mostrar y otro para no mostrar contrasenia
            icon: new Icon(passenable == true ? Icons.visibility_off : Icons.visibility),

            /* Agrega una animación al presionar el boton y permite realizar una accion 
            agregandolo entre las {} */
            onPressed: () {
              // Permite redibujar el widget para que se muestre los cambios del icono
              setState(() {
                if (passenable) {
                  passenable = false;
                } else {
                  passenable = true;
                }
              });
            },
          ),
        )
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 0,
        vertical: 5,
      ),
    );
  }
}

// Clase para manejar el inputCode
class InputCode extends StatefulWidget {

  // Parametros a manejar
  String texto; 
  FocusNode nombreFocus; 
  final nombreController; 
  FocusNode cambiarFocus;

  // Utilizar los parametros como constructores
  InputCode({
    required this.texto, 
    required this.nombreFocus, 
    required this.nombreController, 
    required this.cambiarFocus}
  );

  @override
  _InputCodeState createState() => _InputCodeState();
}

class _InputCodeState extends State<InputCode> {
  
  // Controlar y manipular el texto dentro de un widget de entrada de texto
  final focusControllerOne = TextEditingController();
  final focusControllerTwo = TextEditingController();
  final focusControllerThree = TextEditingController();
  final focusControllerFour = TextEditingController();
  final focusControllerFive = TextEditingController();
  final focusControllerSix = TextEditingController();
  
  // Instanciación de cada uno de los campos "FocusNode"
  late FocusNode focusNode1;
  late FocusNode focusNode2;
  late FocusNode focusNode3;
  late FocusNode focusNode4;
  late FocusNode focusNode5;
  late FocusNode focusNode6;

  // Cerrar cada focus para no consumir recursos del equipo
  @override
  void dispose() {
    super.dispose();
    focusControllerOne.dispose();
    focusControllerTwo.dispose();
    focusControllerThree.dispose();
    focusControllerFour.dispose();
    focusControllerFive.dispose();
    focusControllerSix.dispose();

    focusNode1.dispose();
    focusNode2.dispose();
    focusNode3.dispose();
    focusNode4.dispose();
    focusNode5.dispose();
    focusNode6.dispose();
  }

  // Creación de los Focus
  @override
  void initState() {
    super.initState();

    focusNode1 = FocusNode();
    focusNode2 = FocusNode();
    focusNode3 = FocusNode();
    focusNode4 = FocusNode();
    focusNode5 = FocusNode();
    focusNode6 = FocusNode();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      // Permite definir el diseño de la caja de texto "BoxDecoration"
      decoration: BoxDecoration(
        color: CustomColors.colorBlanco, // Color del input
        borderRadius: BorderRadius.circular(10.0), // Define los bordes redondeados
        // Define el grosor y color del borde
        border: Border.all(
          color: CustomColors.colorNegro,
          width: 1.0,
        ),
      ),

      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 17.0), // Espaciado entre el contenido y el borde
      //margin: EdgeInsets.symmetric(horizontal: 10.0),

      child: ListView(
        children: <Widget> [

          // Input que permite guardar, reiniciar o validar operaciones (TextFormField)
          TextFormField(
            keyboardType: TextInputType.number, // Aparece un teclado númerico en el dispositivo movil

            controller: widget.nombreController, /* Define el controlador de cada input para 
                                                  poder manejarlos con el focusNode*/
        
            inputFormatters: [LengthLimitingTextInputFormatter(1),], // Limitar cantidad caracteres
            style: TextStyle(fontSize: 25,), // Tamanio del texto
            decoration: InputDecoration.collapsed(/* Quita la linea que viene por 
                                                  defecto en el input "InputDecoration.collapsed" */
              hintText: widget.texto, // Place holder en el input
            ),

            // ---- Manejo primordial del focusNode para pasar de input ----
            focusNode: widget.nombreFocus, // Uso de cada Focus
            onChanged: (String cantidadCaracteres) { // Aplicar un evento para cambiar de input
              // Condicion para cambiar de input
              if (cantidadCaracteres.length == 1) {
                widget.nombreFocus.unfocus(); // No acepta texto adicional en el input
                FocusScope.of(context).requestFocus(widget.cambiarFocus); // Cambia de input
              }
            },
          ),
        ],
      ),

    // Definir largo y alto de los campos
    height: 60,
    width: 50,
    
    // Margen de separacion entre cada campo
    margin: EdgeInsets.symmetric(
      horizontal: 4,
      //vertical: 5,
    ),
    );
  }
  // Metodo aparte para ir cambiando de input
  void requestFocus(BuildContext context, FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
  }
}

// ---- Widget para el campos de texto de los codigos de confirmacion  ----
/*
Widget inputCode(String texto, FocusNode nombreFocus, final nombreController, FocusNode cambiarFocus, context) {
  return Container(
    // Permite definir el diseño de la caja de texto "BoxDecoration"
    decoration: BoxDecoration(
      color: CustomColors.colorBlanco, // Color del input
      borderRadius: BorderRadius.circular(10.0), // Define los bordes redondeados
      // Define el grosor y color del borde
      border: Border.all(
        color: CustomColors.colorNegro,
        width: 1.0,
      ),
    ),

    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 17.0), // Espaciado entre el contenido y el borde
    //margin: EdgeInsets.symmetric(horizontal: 10.0),

    child: ListView(
      children: <Widget> [

        // Uso de un input (Campo de texto)
        // Input que permite guardar, reiniciar o validar operaciones (TextFormField)
        TextFormField(
          keyboardType: TextInputType.number, // Tipo de dato del campo

          controller: nombreController,
      
          //inputFormatters: [LengthLimitingTextInputFormatter(1),], // Limitar cantidad caracteres
          style: TextStyle(fontSize: 25,), // Tamanio del texto
          decoration: InputDecoration.collapsed(/* Quita la linea que viene por 
                                                defecto en el input "InputDecoration.collapsed" */
            hintText: texto, // Place holder en el input

          ),

          focusNode: nombreFocus, // Uso de cada Focus
          onChanged: (String cantidadCaracteres) { // Aplicar un evento para cambiar de input
            // Condicion para cambiar de input
            if (cantidadCaracteres.length == 1) {
              nombreFocus.unfocus(); // No acepta texto adicional en el input
              FocusScope.of(context).requestFocus(cambiarFocus); // Cambia de input
            }
          },
        ),
      ],
    ),

      // Definir largo y alto de los campos
      height: 60,
      width: 50,
    
    // Margen de separacion entre cada campo
    margin: EdgeInsets.symmetric(
      horizontal: 4,
      //vertical: 5,
    ),
  );
} */


// ---- Clase para un input general con validación ----
class InputTextValidations extends StatefulWidget {

  final String textoInput; // // texto del input

  final inputType; // tipo de teclado a mostrar

  TextEditingController controller; // controlar cada input
  ValidateText? validateText; // Tipo de validacion a utilizar

  InputTextValidations({required this.textoInput, required this.inputType, required this.controller, this.validateText});

  @override
  _InputTextValidationsState createState() => _InputTextValidationsState();
}

class _InputTextValidationsState extends State<InputTextValidations> {
  bool hasError = false; // Variable de estado para indicar si hay un error en el formulario


  @override
  Widget build(BuildContext context) {
    return Container(
      // Definir el diseño de la caja de texto "BoxDecoration"
      decoration: BoxDecoration(
        color: CustomColors.colorBlanco, // Color del input
        borderRadius: BorderRadius.circular(4.0), // Define los bordes redondeados
        // Define el grosor y color de borde
        border: Border.all(
          // Cambiar color del borde a rojo si es true
          color: hasError ? Colors.red : CustomColors.colorNegro,
          width: 1.0,
        ),
      ),
      // Espaciado entre el borde y el contenido
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      //margin: EdgeInsets.symmetric(horizontal: 10.0),

      // Uso de un input (Campo de texto)
      child: TextFormField(
        decoration: InputDecoration.collapsed(/* Quita la linea que viene por 
                                                defecto en el input "InputDecoration.collapsed" */
          hintText: widget.textoInput, // Place holder en el input
        ),
        controller: widget.controller, // maneja cada input a utilizar
        inputFormatters: [validateinputFormatters()], // Tipo de dato del input
        validator: (String? value) { /* Valida si la estructura del input es
                                        correcta */
          return validateStructure(value!); // retorna si la estructura esta bien escrita
        },
      ),
      
            //height: 35,
            //width: 1000.0,
            
      margin: EdgeInsets.symmetric(
        horizontal: 0,
        vertical: 5,
      ),
    );
  }

  // Funcion para manejar la cantidad de caracteres del input
  validateMaxLength() {
    // Uso de un switch
    switch(widget.validateText){
      case ValidateText.rfc:
        return 13;
      
      case ValidateText.phoneNumber:
        return 10;
      
      case ValidateText.email:
        return 65;
      
      case ValidateText.zipCode:
        return 5;

      default: // si no se da ninguno de los casos, no se manda una longitud
        return null;
    
    }
  }

  // Funcion para manejar el tipo de caracter del input
  validateinputFormatters() {
    // Uso de un switch
    switch(widget.validateText){
      case ValidateText.rfc:
        return UpperCaseTextFormatter(); // deja el texto en mayuscula y acepta cualquier caracter
      
      case ValidateText.phoneNumber:
        return FilteringTextInputFormatter.digitsOnly; // maneja solo numeros
      
      case ValidateText.zipCode:
        return FilteringTextInputFormatter.digitsOnly; // maneja solo numeros

      default: // si no se da ninguno de los casos
        return FilteringTextInputFormatter.singleLineFormatter; // maneja cualquier caracter
    
    }
  }

  // Funcion para manejar la estructura del contenido del input
  validateStructure(String? value) {
    // Condicion si el campo es o no requerido 
    //if(widget.isEmptyInput! && value!.isEmpty) {
    if(value!.length == 0) {
      setState(() {
        hasError = true; // Establecer hasError en true si el campo está vacío
      });
      return "El campo es requerido llenarlo";
    } else {
      // Uso de un switch
      switch(widget.validateText){
        case ValidateText.rfc:
          return validateRFC(value)? null : message("RFC");
        
        case ValidateText.phoneNumber:
          return validatePhoneNumber(value)? null : setState(() {
            message("número de telefono");
        hasError = true; // Establecer hasError en true si el campo está vacío
      });
        
        case ValidateText.email:
          return validateEmail(value)? 
          setState(() {
            hasError = false; // Establecer hasError en false si el campo está aprobado
          }) : 
          message("email");
          // ignore: dead_code
          setState(() {
            hasError = true; // Establecer hasError en true si el campo no cumple con la estructura
          });
        
        case ValidateText.zipCode:
          return validateZipCode(value)? null : message("codigo postal");

        default: // si no se da ninguno de los casos, no se muestra mensaje
          return null;
      }
    }
  }

  // Funcion para mostrar el mismo mensaje de error
  message(String textMessage) => "La estructura del $textMessage es inccorrecta";
}
