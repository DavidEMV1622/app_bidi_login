import 'package:flutter/material.dart';
import '../colors/colors.dart';

// Variable de tipo boolean para icono de si o no mostrar contrasenia
  bool passenable = true;

// ---- Widget para el campo de texto "Correo" ----
Widget inputText(String textoCorreo) {
  return Container(
    // Permite definir el diseño de la caja de texto "BoxDecoration"
    decoration: BoxDecoration(
      color: CustomColors.colorInput, // Color del input
      borderRadius:
          BorderRadius.circular(10.0), // Define los bordes redondeados
      border: Border.all(
        // Define el grosor y color de borde
        color: Colors.black,
        width: 1.0,
      ),
    ),
    // Espaciado entre el borde y el contenido
    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
    //margin: EdgeInsets.symmetric(horizontal: 10.0),

    // Uso de un input (Campo de texto)
    child: TextField(
        style: TextStyle(fontSize: 25), // Tamanio del texto
        decoration: InputDecoration.collapsed(
          /* Quita la linea que viene por 
                                                  defecto en el input "InputDecoration.collapsed" */
          hintText: textoCorreo, // Place holder en el input
        )),
    /*
          height: 40.0,
          width: 1000.0,
          */
    margin: EdgeInsets.symmetric(
      horizontal: 0,
      vertical: 5,
    ),
  );
}

/*
// ---- Widget para el campo de texto "Contrasenia" ----
Widget inputPassword(String textoContrasenia, context) {
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

/* Clase para manejar el inputPassword, ya que el setState necesita un build para poder 
actualizar el estado del mismo */
class PasswordInput extends StatefulWidget {
  final String hintText;

  PasswordInput({required this.hintText});

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool passEnable = true;

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        color: CustomColors.colorInput,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.black,
          width: 1.0,
        ),
      ),

      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),

      child: TextField(
        obscureText: passEnable,
        style: TextStyle(fontSize: 25),

        decoration: InputDecoration(
          hintText: widget.hintText,
          border: InputBorder.none,

          suffixIcon: IconButton(
            icon: Icon(
              passEnable ? Icons.visibility_off : Icons.visibility,
            ),
            
            onPressed: () {
              setState(() {
                passEnable = !passEnable;
              });
            },
          ),
        ),
      ),
    );
  }
}

// ---- Widget para el campos de texto de los codigos de confirmacion  ----
  Widget inputCode(String texto, FocusNode nombreFocus, final nombreController, FocusNode cambiarFocus, context) {
    return Container(
      // Permite definir el diseño de la caja de texto "BoxDecoration"
      decoration: BoxDecoration(
        color: CustomColors.colorInput, // Color del input
        borderRadius: BorderRadius.circular(10.0), // Define los bordes redondeados
        // Define el grosor y color del borde
        border: Border.all(
          color: Colors.black,
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
        vertical: 5,
      ),
    );
  }