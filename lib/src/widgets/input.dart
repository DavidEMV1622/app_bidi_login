import 'package:flutter/material.dart';
import '../colors/colors.dart';
import '../common/enumValidate.dart';
import '../common/inputValidate.dart';

// ---- Clase para un input general con validación ----
class InputTextValidations extends StatefulWidget {
  final String textoInput; // // texto del input
  final TextInputType inputType; // tipo de teclado a mostrar
  final TextEditingController controller; // controlar cada input
  final ValidateText? validateText; // Tipo de validacion a utilizar

  // Uso de cada parametro asignado
  const InputTextValidations({
    super.key,
    required this.textoInput,
    required this.inputType,
    required this.controller,
    this.validateText
  });

  @override
  State<InputTextValidations> createState() => _InputTextValidationsState();
}

class _InputTextValidationsState extends State<InputTextValidations> {
  String hasError =
      "Base"; // Variable de estado para indicar si hay un error en el formulario
  
  String? messageValidations; // Variable de estado para almacenar el mensaje de error de las validaciones

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
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
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),

          //height: 35,
          //width: 1000.0,

          margin: const EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 5,
          ),
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
        ),
        // Mostrar el mensaje de error fuera del BoxDecoration
        Text(
          messageValidations ?? "", /* Muestra el mensaje si "messageValidations" no es nulo */
          style: const TextStyle(
            color: Colors.red,
          ),
        ),
      ],
    );
    
  }

  // Funcion para manejar la estructura del contenido del input
  validateStructure(String? value) {
    // Condicion si el campo es o no requerido
    //if(widget.isEmptyInput! && value!.isEmpty) {
    if (value!.isEmpty) {
    //if (value!.length == 0) {
      setState(() {
        hasError = "Error"; // Establecer hasError en true si el campo está vacío
        messageValidations = "";
      });
      messageValidations = "El campo es requerido llenarlo";
    } else {
      // rectificar el error
      setState(() {
        hasError = "Error";
        messageValidations = "";
      });

      // Uso de un switch
      switch (widget.validateText) {
        case ValidateText.name:
          validateName(value)
            ? setState(() {
                hasError = "Correct";
                messageValidations = "";
              })
            : messageValidations = "El nombre debe tener 3 o más caracteres";

        case ValidateText.lastname:
          validateName(value)
            ? setState(() {
                hasError = "Correct";
                messageValidations = "";
              })
            : messageValidations = "El apellido debe tener 3 o más caracteres";

        case ValidateText.phoneNumber:
          validatePhoneNumber(value)
            ? setState(() {
                hasError = "Correct";
                messageValidations = "";
              })
            : messageValidations = "El número de teléfono debe tener entre 10 o 15 digitos";

        case ValidateText.email:
          validateEmail(value)
            ? setState(() {
                hasError = "Correct";
                messageValidations = "";
              })
            : messageValidations = "La estructura del email es incorrecta";

        default: // si no se da ninguno de los casos, no se muestra mensaje
          return null;
      }
    }
  }

  // Funcion para mostrar el mismo mensaje de error
  // message(String textMessage) => "La estructura del $textMessage es incorrecta";

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



class InputTextValidationsPrueba extends StatefulWidget {
  final String textoInput; // // texto del input
  final TextInputType inputType; // tipo de teclado a mostrar
  final TextEditingController controller; // controlar cada input
  final ValidateText? validateText; // Tipo de validacion a utilizar

  // Uso de cada parametro asignado
  const InputTextValidationsPrueba({
    super.key,
    required this.textoInput,
    required this.inputType,
    required this.controller,
    this.validateText
  });

  @override
  State<InputTextValidationsPrueba> createState() => _InputTextValidationsPruebaState();
}

class _InputTextValidationsPruebaState extends State<InputTextValidationsPrueba> {
  String hasError = "Base"; // Variable de estado para indicar si hay un error en el formulario
  String? messageValidations; // Variable de estado para almacenar el mensaje de error de las validaciones

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
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
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),

          //height: 35,
          //width: 1000.0,

          margin: const EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 5,
          ),
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
        ),
        // Mostrar el mensaje de error fuera del BoxDecoration
        Text(
          messageValidations ?? "", /* Muestra el mensaje si "messageValidations" no es nulo */
          style: const TextStyle(
            color: Colors.red,
          ),
        ),
      ],
    );
    
  }

  // Funcion para manejar la estructura del contenido del input
  validateStructure(String? value) {
    // Condicion si el campo es o no requerido
    //if(widget.isEmptyInput! && value!.isEmpty) {
    if (value!.isEmpty) {
    //if (value!.length == 0) {
      setState(() {
        hasError = "Error"; // Establecer hasError en true si el campo está vacío
        messageValidations = "";
      });
      messageValidations = "El campo es requerido llenarlo";
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
                  messageValidations = "";
                })
              : messageValidations = "El nombre debe tener 3 o más caracteres";

        case ValidateText.lastname:
          return validateName(value)
              ? setState(() {
                  hasError = "Correct";
                  messageValidations = "";
                })
              : messageValidations = "El apellido debe tener 3 o más caracteres";

        case ValidateText.phoneNumber:
          return validatePhoneNumber(value)
              ? setState(() {
                  hasError = "Correct";
                  messageValidations = "";
                })
              : "El número de teléfono debe tener entre 10 o 15 digitos";

        case ValidateText.email:
          return validateEmail(value)
              ? setState(() {
                  hasError = "Correct";
                  messageValidations = "";
                })
              : setState(() {
                messageValidations = "La estructura del email es incorrecta"; // Asigna el mensaje de error o null
              });
              //message("email");

        default: // si no se da ninguno de los casos, no se muestra mensaje
          return null;
      }
    }
  }

  // Funcion para mostrar el mismo mensaje de error
  //message(String textMessage) => "La estructura del $textMessage es incorrecta";

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
  final TextInputType inputType; // tipo de teclado a mostrar
  final TextEditingController controller; // controlar cada input
  final ValidateText? validateText; // Tipo de validacion a utilizar
  final TextEditingController? passwordComparar; // input a comparar

  const InputPasswordValidations({
    super.key, 
    required this.textoInput,
    required this.inputType,
    required this.controller,
    this.validateText,
    this.passwordComparar
  });

  @override
  State<InputPasswordValidations> createState() =>
      _InputPasswordValidationsState();
}

class _InputPasswordValidationsState extends State<InputPasswordValidations> {
  String hasError = "Base"; // Variable de estado para indicar si hay un error en el formulario
  // Variable de tipo boolean para icono de si o no mostrar contrasenia
  bool passenable = true;

  String? messageValidations;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
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
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),

          //height: 35,
          //width: 1000.0,

          margin: const EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 5,
          ),
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
                icon: Icon(
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
        ),
        // Mostrar el mensaje de error fuera del BoxDecoration
        Text(
          messageValidations ?? "", /* Muestra el mensaje si "messageValidations" no esta vacio */
          style: const TextStyle(
            color: Colors.red,
          ),
        ),
      ],
    );
  }

  // Funcion para manejar la estructura del contenido del input
  validateStructure(String? value) {
    // Condicion si el campo es o no requerido
    //if(widget.isEmptyInput! && value!.isEmpty) {
    //if (value!.length == 0) {
    if (value!.isEmpty) {
      setState(() {
        hasError = "Error"; // Establecer hasError en true si el campo está vacío
        messageValidations = "";
      });
      messageValidations = "El campo es requerido llenarlo";
    } else {
      // rectificar el error
      setState(() {
        hasError = "Error";
        messageValidations = "";
      });

      // Uso de un switch
      switch (widget.validateText) {
        case ValidateText.password:
          validatePassword(value)
            ? setState(() {
                hasError = "Correct";
                messageValidations = "";
              })
            : messageValidations = "Una minuscula, mayuscula, caracter especial y un número";

        case ValidateText.confirmPassword:
          //print("valor: $value passsword a comparar: ${widget.passwordComparar?.text}");
          // Condicion para comparar si son iguales los dos formularios
          widget.controller.text == widget.passwordComparar?.text
            ? setState(() {
                hasError = "Correct";
                messageValidations = "";
              })
            : messageValidations = "El campo no es igual a la contraseña";

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

// Clase para manejar el inputCode
class InputCodeValidations extends StatefulWidget {
  // Parametros a manejar
  final String textoInput; // // texto del input
  final TextInputType inputType; // tipo de teclado a mostrar
  final FocusNode nombreFocus; // Nombre de cada focus
  final TextEditingController nombreController; // controlar cada input
  final FocusNode? cambiarFocus; // Nombre del focus a cambiar 
  final FocusNode? cambiarFocusAnterior; // Nombre del focus a  retroceder
  final ValidateText? validateText; // Tipo de validacion a utilizar

  // Utilizar los parametros como constructores
  const InputCodeValidations({
    super.key,
    required this.textoInput,
    required this.inputType,
    required this.nombreFocus,
    required this.nombreController,
    this.cambiarFocus,
    this.cambiarFocusAnterior,
    this.validateText
  });

  @override
  State<InputCodeValidations> createState() => _InputCodeValidationsState();
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

      padding: const EdgeInsets.symmetric(
          horizontal: 14.0,
          vertical: 2.0),

      // Definir largo y alto de los campos
      height: 60,
      width: 50,

      // Margen de separacion entre cada campo
      margin: const EdgeInsets.symmetric(
        horizontal: 4,
        //vertical: 5,
      ), // Espaciado entre el contenido y el borde
      //margin: EdgeInsets.symmetric(horizontal: 10.0),

      child: ListView(
        children: <Widget>[
          // Input que permite guardar, reiniciar o validar operaciones (TextFormField)
          TextFormField(
            keyboardType: TextInputType
                .number, // Aparece un teclado númerico en el dispositivo movil
            
            style: const TextStyle(
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
              //} else if (cantidadCaracteres.length == 0) {
              } else if (cantidadCaracteres.isEmpty) {
                widget.nombreFocus
                    .unfocus(); // No acepta texto adicional en el input
                FocusScope.of(context)
                    .requestFocus(widget.cambiarFocusAnterior); // Cambia de input
              }
            },
          ),
        ],
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
    //if (value!.length == 0) {
    if (value!.isEmpty) {
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