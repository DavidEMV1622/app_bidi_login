import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../colors/colors.dart';
import '../common/enumValidate.dart';
import '../common/inputValidate.dart';
import '../utils/TextFormatter.dart';

// ---- Clase para un input general con validación ----
class InputTextValidations extends StatefulWidget {
  final String textoInput; // // texto del input
  final inputType; // tipo de teclado a mostrar
  TextEditingController controller; // controlar cada input
  ValidateText? validateText; // Tipo de validacion a utilizar

  // Uso de cada parametro asignado
  InputTextValidations(
      {required this.textoInput,
      required this.inputType,
      required this.controller,
      this.validateText});

  @override
  _InputTextValidationsState createState() => _InputTextValidationsState();
}

class _InputTextValidationsState extends State<InputTextValidations> {
  String hasError =
      "Base"; // Variable de estado para indicar si hay un error en el formulario

  @override
  Widget build(BuildContext context) {
    return Container(
      // Definir el diseño de la caja de texto "BoxDecoration"
      decoration: BoxDecoration(
        color: CustomColors.colorBlanco, // Color del input
        borderRadius:
            BorderRadius.circular(4.0), // Define los bordes redondeados
        // Define el grosor y color de borde
        border: Border.all(
          // Cambiar color del borde a rojo si es true
          //color: hasError ? Colors.red : CustomColors.colorNegro,
          color:
              _miColor(hasError), // Llamada de la funcion para cambiar el color
          width:
              _miBorde(hasError), // Llamada de la funcion para cambiar el borde
        ),
      ),
      // Espaciado entre el borde y el contenido
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      //margin: EdgeInsets.symmetric(horizontal: 10.0),

      // Uso de un input (Campo de texto)
      child: TextFormField(
        keyboardType: widget.inputType, // tipo de teclado a mostrar en el movil

        // Contenido del TextFormField
        decoration: InputDecoration(
          hintText: widget.textoInput, // Place holder en el input
          border: InputBorder
              .none, // Quita la línea que viene por defecto en el TextField
          counterText:
              "", // Oculta el contador de caracteres de la propiedad "maxLength"
        ),

        controller: widget.controller, // maneja cada input a utilizar
        maxLength:
            ValidateFormulations.validateMaxLength(widget.validateText), // Cantidad de caracteres que tiene el input
        inputFormatters: [ValidateFormulations.validateinputFormatters(widget.validateText)], // Tipo de dato del input

        /* Valida si la estructura del formulario es correcta */
        validator: (String? value) {
          return validateStructure(
              value!); // retorna si la estructura esta bien escrita
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

  // Funcion para manejar la estructura del contenido del input
  validateStructure(String? value) {
    // Condicion si el campo es o no requerido
    //if(widget.isEmptyInput! && value!.isEmpty) {
    if (value!.length == 0) {
      setState(() {
        hasError =
            "Error"; // Establecer hasError en true si el campo está vacío
      });
      return "El campo es requerido llenarlo";
    } else {
      // rectificar el error
      setState(() {
        hasError = "Error";
      });

      // Uso de un switch
      switch (widget.validateText) {
        case ValidateText.name:
          return validateName(value)
              ? setState(() {
                  hasError = "Correct";
                })
              : "El nombre debe tener 3 o más caracteres";

        case ValidateText.lastname:
          return validateName(value)
              ? setState(() {
                  hasError = "Correct";
                })
              : "El apellido debe tener 3 o más caracteres";

        case ValidateText.phoneNumber:
          return validatePhoneNumber(value)
              ? setState(() {
                  hasError = "Correct";
                })
              : "El número de teléfono debe tener entre 10 o 15 digitos";

        case ValidateText.email:
          return validateEmail(value)
              ? setState(() {
                  hasError = "Correct";
                })
              : message("email");

        default: // si no se da ninguno de los casos, no se muestra mensaje
          return null;
      }
    }
  }

  // Funcion para mostrar el mismo mensaje de error
  message(String textMessage) => "La estructura del $textMessage es incorrecta";

  // Funcion para cambiar el color del borde del formulario
  _miColor(String hasError) {
    if (hasError == "Error") {
      return Colors.red;
    } else if (hasError == "Correct") {
      return Colors.green;
    } else if (hasError == "Base") {
      return CustomColors.colorNegro;
    }
  }

  // Funcion para cambiar el borde del formulario
  _miBorde(String hasError) {
    if (hasError == "Error") {
      return 2.5;
    } else if (hasError == "Correct") {
      return 2.5;
    } else if (hasError == "Base") {
      return 1.0;
    }
  }
}

// ---- Clase para un input general con validación ----
class InputPasswordValidations extends StatefulWidget {
  final String textoInput; // // texto del input
  final inputType; // tipo de teclado a mostrar
  TextEditingController controller; // controlar cada input
  ValidateText? validateText; // Tipo de validacion a utilizar
  TextEditingController? passwordComparar; // input a comparar

  InputPasswordValidations(
      {required this.textoInput,
      required this.inputType,
      required this.controller,
      this.validateText,
      this.passwordComparar});

  @override
  _InputPasswordValidationsState createState() =>
      _InputPasswordValidationsState();
}

class _InputPasswordValidationsState extends State<InputPasswordValidations> {
  String hasError = "Base"; // Variable de estado para indicar si hay un error en el formulario
  // Variable de tipo boolean para icono de si o no mostrar contrasenia
  bool passenable = true;

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
          //color: hasError ? Colors.red : CustomColors.colorNegro,
          color: _miColor(hasError), // Llamada de la funcion para cambiar el color
          width: _miBorde(hasError), // Llamada de la funcion para cambiar el borde
        ),
      ),
      // Espaciado entre el borde y el contenido
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      //margin: EdgeInsets.symmetric(horizontal: 10.0),

      // Uso de un input (Campo de texto)
      child: TextFormField(
        obscureText: passenable,

        // Maneja el contenido del "TextFormField"
        decoration: InputDecoration(
          hintText: widget.textoInput, // Place holder en el input
          border: InputBorder.none, // Quita la línea que viene por defecto en el TextField
          counterText: "", // Quita el contador de caracteres

          // Manejar un icono dentro del input
          suffixIcon: IconButton(
            // Agrega un icono para mostrar y otro para no mostrar contrasenia
            icon: new Icon(
                passenable == true ? Icons.visibility_off : Icons.visibility),

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
        ),

        controller: widget.controller, // maneja cada input a utilizar
        inputFormatters: [ValidateFormulations.validateinputFormatters(widget.validateText)], // Tipo de dato del input
        
        /* Valida si la estructura del input es correcta */
        validator: (String? value) {
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

  // Funcion para manejar la estructura del contenido del input
  validateStructure(String? value) {
    // Condicion si el campo es o no requerido
    //if(widget.isEmptyInput! && value!.isEmpty) {
    if (value!.length == 0) {
      setState(() {
        hasError = "Error"; // Establecer hasError en true si el campo está vacío
      });
      return "El campo es requerido llenarlo";
    } else {
      // rectificar el error
      setState(() {
        hasError = "Error";
      });

      // Uso de un switch
      switch (widget.validateText) {
        case ValidateText.password:
          return validatePassword(value)
            ? setState(() {
                hasError = "Correct";
              })
            : "Una minuscula, mayuscula, caracter especial y un número";

        case ValidateText.confirmPassword:
          //print("valor: $value passsword a comparar: ${widget.passwordComparar?.text}");
          // Condicion para comparar si son iguales los dos formularios
          return widget.controller.text == widget.passwordComparar?.text
            ? setState(() {
                hasError = "Correct";
              })
            : "El campo no es igual a la contraseña";

        default: // si no se da ninguno de los casos, no se muestra mensaje
          return null;
      }
    }
  }

  // Funcion para mostrar el mismo mensaje de error
  message(String textMessage) => "La estructura del $textMessage es incorrecta";

  // Funcion para cambiar el color del borde del formulario
  _miColor(String hasError) {
    if (hasError == "Error") {
      return Colors.red;
    } else if (hasError == "Correct") {
      return Colors.green;
    } else if (hasError == "Base") {
      return CustomColors.colorNegro;
    }
  }

  // Funcion para cambiar el borde del formulario
  _miBorde(String hasError) {
    if (hasError == "Error") {
      return 2.5;
    } else if (hasError == "Correct") {
      return 2.5;
    } else if (hasError == "Base") {
      return 1.0;
    }
  }
}

// Clase para manejar el inputCode
class InputCodeValidations extends StatefulWidget {
  // Parametros a manejar
  final String textoInput; // // texto del input
  final inputType; // tipo de teclado a mostrar
  FocusNode nombreFocus; // Nombre de cada focus
  TextEditingController nombreController; // controlar cada input
  FocusNode? cambiarFocus; // Nombre del focus a cambiar 
  FocusNode? cambiarFocusAnterior; // Nombre del focus a  retroceder
  ValidateText? validateText; // Tipo de validacion a utilizar

  // Utilizar los parametros como constructores
  InputCodeValidations(
      {required this.textoInput,
      required this.inputType,
      required this.nombreFocus,
      required this.nombreController,
      this.cambiarFocus,
      this.cambiarFocusAnterior,
      this.validateText});

  @override
  _InputCodeValidationsState createState() => _InputCodeValidationsState();
}

class _InputCodeValidationsState extends State<InputCodeValidations> {
  String hasError =
      "Base"; // Variable de estado para indicar si hay un error en el formulario

  @override
  Widget build(BuildContext context) {
    return Container(
      // Permite definir el diseño de la caja de texto "BoxDecoration"
      decoration: BoxDecoration(
        color: CustomColors.colorBlanco, // Color del input
        borderRadius:
            BorderRadius.circular(10.0), // Define los bordes redondeados
        // Define el grosor y color del borde
        border: Border.all(
          color: _miColor(hasError),
          width: _miBorde(hasError),
        ),
      ),

      padding: EdgeInsets.symmetric(
          horizontal: 14.0,
          vertical: 2.0), // Espaciado entre el contenido y el borde
      //margin: EdgeInsets.symmetric(horizontal: 10.0),

      child: ListView(
        children: <Widget>[
          // Input que permite guardar, reiniciar o validar operaciones (TextFormField)
          TextFormField(
            keyboardType: TextInputType
                .number, // Aparece un teclado númerico en el dispositivo movil
            
            style: TextStyle(
              fontSize: 25,
            ), // Tamanio del texto

            decoration: InputDecoration(
              hintText: widget.textoInput, // Place holder en el input
              border: InputBorder
                  .none, // Quita la línea que viene por defecto en el TextField
              counterText:
                  "", // Oculta el contador de caracteres de la propiedad "maxLength"
            ),

            controller: widget.nombreController,
            /* Define el controlador de cada input para 
                                                  poder manejarlos con el focusNode*/
            maxLength:
            ValidateFormulations.validateMaxLength(widget.validateText), // Cantidad de caracteres que tiene el input
            inputFormatters: [ValidateFormulations.validateinputFormatters(widget.validateText)], // Tipo de dato del input

            validator: (String? value) {
              /* Valida si la estructura del input es
                                            correcta */
              return validateStructure(
                  value!); // retorna si la estructura esta bien escrita
            },

            // ---- Manejo primordial del focusNode para pasar de input ----
            focusNode: widget.nombreFocus, // Uso de cada Focus
            onChanged: (String cantidadCaracteres) {
              // Aplicar un evento para cambiar de input
              // Condicion para cambiar de input
              if (cantidadCaracteres.length == 1) {
                widget.nombreFocus
                    .unfocus(); // No acepta texto adicional en el input
                FocusScope.of(context)
                    .requestFocus(widget.cambiarFocus); // Cambia de input
              // Condicion para cambiar al anterior input
              } else if (cantidadCaracteres.length == 0) {
                widget.nombreFocus
                    .unfocus(); // No acepta texto adicional en el input
                FocusScope.of(context)
                    .requestFocus(widget.cambiarFocusAnterior); // Cambia de input
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

  // Funcion para manejar la estructura del contenido del input
  validateStructure(String? value) {
    // Condicion si el campo es o no requerido
    //if(widget.isEmptyInput! && value!.isEmpty) {
    if (value!.length == 0) {
      setState(() {
        hasError =
            "Error"; // Establecer hasError en true si el campo está vacío
      });
      return "El campo es requerido llenarlo";
    } else {
      // rectificar el error
      setState(() {
        hasError = "Error";
      });

      // Uso de un switch
      switch (widget.validateText) {
        case ValidateText.codeOTP:
          return validateCodeOTP(value)
              ? setState(() {
                  hasError = "Correct";
                })
              : null;

        default: // si no se da ninguno de los casos, no se muestra mensaje
          return null;
      }
    }
  }

  // Funcion para cambiar el color del borde del formulario
  _miColor(String hasError) {
    if (hasError == "Error") {
      return Colors.red;
    } else if (hasError == "Correct") {
      return Colors.green;
    } else if (hasError == "Base") {
      return CustomColors.colorNegro;
    }
  }

  // Funcion para cambiar el borde del formulario
  _miBorde(String hasError) {
    if (hasError == "Error") {
      return 2.5;
    } else if (hasError == "Correct") {
      return 2.5;
    } else if (hasError == "Base") {
      return 1.0;
    }
  }
}