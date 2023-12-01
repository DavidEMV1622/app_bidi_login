import 'package:app_credibanco_login/src/pages/Filtros%20original/Filtro_screens/provider/dropdown_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Video de ayuda para hacer los filtros: https://www.youtube.com/watch?v=Ldg_TO988no&ab_channel=dbestech


class FiltroScreen extends StatefulWidget {
  const FiltroScreen({super.key});

  @override
  State<FiltroScreen> createState() => _FiltroScreenState();
}

class _FiltroScreenState extends State<FiltroScreen> {

  void _showMultiSelect(List<String> listProvider) async {
    final List<String>? results = await showGeneralDialog<List<String>>(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return MultiSelect(listContents: listProvider);
      },
    );

    if (results != null) {
      context.read<DropDown>().setAddAllListMediosPagoSeleccionado(results);
    }
  }

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Movimientos", style: TextStyle(fontSize: 16)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 34),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            
            SizedBox(
              width: size.width,
              child: ElevatedButton(
                onPressed: () => _showMultiSelect(["Nequi", "Bancolombia", "Banco Bogota", "Visa"]),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  shadowColor: Colors.transparent,
                  side: const BorderSide(color: Colors.black54, width: 1),
                  elevation: 0.0,
                  backgroundColor: const Color(0xFFFFFFFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
          
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    context.watch<DropDown>().listMediosPagoSeleccionado.isEmpty ? 
                    const Text("Metodo de Pago", style: TextStyle(color: Colors.black87)) : 
                    Wrap(
                      children: context.watch<DropDown>().listMediosPagoSeleccionado.map((e) => Text("$e, ", style: const TextStyle(color: Colors.black),))
                      .toList(),
                    ),
                    const Icon(Icons.arrow_drop_down_outlined, color: Colors.black),
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 30,
            ),
            Wrap(
              children: context.watch<DropDown>().listMediosPagoSeleccionado.map((e) => Text("$e, ", style: const TextStyle(color: Colors.black54),))
              .toList(),
            ),
          ],
        ),
      ),
    );
  }
}



class MultiSelect extends StatefulWidget {
  final List<String> listContents;
  const MultiSelect({Key? key, required this.listContents}) : super(key: key);

  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {

  // Metodo para agregar y eliminar un valor de la lista
  void _listChange(String itemValue, bool isSelected) {
    if (isSelected) {
      context.read<DropDown>().setListMediosPagoSeleccionado(itemValue);
    } else {
      context.read<DropDown>().removelistMediosPagoSeleccionado(itemValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: MediaQuery.of(context).size.width,
        child: Card(
          color: Colors.amber,
          child: SingleChildScrollView(
            child: ListBody(
              children: widget.listContents.map((item) => CheckboxListTile(
                  value: context.watch<DropDown>().listMediosPagoSeleccionado.contains(item),
                  title: Text(item),
                  controlAffinity: ListTileControlAffinity.leading, 
                  onChanged: (isChecked) => _listChange(item, isChecked!)
                )
              ).toList(),
            ),
          ),
        ),
      ),
    );
  }
}