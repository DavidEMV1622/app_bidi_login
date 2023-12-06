import 'package:app_credibanco_login/src/pages/Filtros%20original/Filtro_screens/provider/dropdown_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

// Video de ayuda para hacer los filtros: https://www.youtube.com/watch?v=Ldg_TO988no&ab_channel=dbestech
// Pagina para obtener la posicion de un widget: https://morioh.com/a/c62b5d2eb8b3/como-obtener-las-coordenadas-x-e-y-de-un-widget-en-flutter



/* class FiltroScreen extends StatefulWidget {
  const FiltroScreen({super.key});

  @override
  State<FiltroScreen> createState() => _FiltroScreenState();
}

class _FiltroScreenState extends State<FiltroScreen> {

  void _showMultiSelect(List<String> listProvider) async {
    await showGeneralDialog<List<String>>(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 100),
      pageBuilder: (_, __, ___) {
        return MultiSelect(listContents: listProvider);
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    final mywidgetkey = GlobalKey();
    
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
            
            Stack(
              children:[ SizedBox(
                width: size.width,
                child: ElevatedButton(
                  key: mywidgetkey,
                  onPressed: () {
                    _showMultiSelect(["Nequi", "Bancolombia", "Banco Bogota", "Visa"]);
                  },
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
              ),]
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
      print(context.read<DropDown>().listMediosPagoSeleccionado);
    } else {
      context.read<DropDown>().removelistMediosPagoSeleccionado(itemValue);
      print(context.read<DropDown>().listMediosPagoSeleccionado);
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
} */






class FiltroScreen extends StatefulWidget {
  const FiltroScreen({super.key});

  @override
  State<FiltroScreen> createState() => _FiltroScreenState();
}

class _FiltroScreenState extends State<FiltroScreen> {

  //List<String> _selectedItems = [];

  //void _showMultiSelect(List<String> listProvider) async {
  void _showMultiSelect(List<String> list, RenderBox renderBox) async {
    //final List<String>? results = 
    await showGeneralDialog<List<String>>(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return MultiSelect(listContents: list, renderBox: renderBox);
      },
    );

    /* if (results != null) {
      setState(() {
        _selectedItems = results;
      });
    } */
  }

  @override
  Widget build(BuildContext context) {

    final mywidgetkey = GlobalKey();
    
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
            
            Stack(
              children:[ SizedBox(
                key: mywidgetkey,
                width: size.width,
                child: ElevatedButton(                  
                  onPressed: () {
                    RenderBox renderbox = mywidgetkey.currentContext!.findRenderObject() as RenderBox;
                    _showMultiSelect(["Nequi", "Bancolombia", "Banco Bogota", "Visa"], renderbox);
                  },
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
                      //_selectedItems.isEmpty ?
                      context.watch<DropDown>().listMediosPagoSeleccionado.isEmpty ?
                      const Text("Metodo de Pago", style: TextStyle(color: Colors.black87)) : 
                      Wrap(
                        //children: _selectedItems.map((e) => Text("$e, ", style: const TextStyle(color: Colors.black),))
                        children: context.watch<DropDown>().listMediosPagoSeleccionado.map((e) => Text("$e, ", style: const TextStyle(color: Colors.black),))
                        .toList(),
                      ),
                      const Icon(Icons.arrow_drop_down_outlined, color: Colors.black),
                    ],
                  ),
                ),
              ),]
            ),

            const SizedBox(
              height: 30,
            ),
            Row(
              children: [Wrap(
                children: context.watch<DropDown>().listMediosPago.map((e) => Text("$e, ", style: const TextStyle(color: Colors.black54),))
                .toList(),
              ),]
            ),
          ],
        ),
      ),
    );
  }
}

class MultiSelect extends StatefulWidget {
  final List<String> listContents;
  final RenderBox renderBox;
  const MultiSelect({Key? key, required this.listContents, required this.renderBox}) : super(key: key);

  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {

  //List<String> _selectedItems = [];

  // Metodo para agregar y eliminar un valor de la lista
  void _listChange(String itemValue, bool isSelected) {
    //setState(() {
      if (isSelected) {
        /* _selectedItems.add(itemValue);
        print(_selectedItems); */
        context.read<DropDown>().setListMediosPagoSeleccionado(itemValue);
      } else {
        //_selectedItems.remove(itemValue);
        //print(_selectedItems);
        context.read<DropDown>().removelistMediosPagoSeleccionado(itemValue);
      }
    //});
  }

  /* void _cancel() {
    Navigator.pop(context);
  }

  void _submit() {
    context.read<DropDown>().clearlistMediosPago();
    context.read<DropDown>().setAddAlllistMediosPago(_selectedItems);
    //Navigator.pop(context, _selectedItems);
    Navigator.pop(context);
  } */

  @override
  Widget build(BuildContext context) {
    Offset position = widget.renderBox.localToGlobal(Offset.zero);
    double x = position.dx;
    double y = position.dy;
    print(x);
    print(y);
    return Stack(
      children: [
        Positioned(
          left: x - 4,
          top: y + 60,
          child: SizedBox(
            //margin: const EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width * 0.90,
            child: Card(
              color: Colors.amber,
              child: Column(
                children: [
                  SingleChildScrollView(
                    child: ListBody(
                      children: widget.listContents.map((item) => CheckboxListTile(
                          //value: _selectedItems.contains(item),
                          value: context.watch<DropDown>().listMediosPagoSeleccionado.contains(item),
                          title: Text(item),
                          controlAffinity: ListTileControlAffinity.leading, 
                          onChanged: (isChecked) => _listChange(item, isChecked!)
                        )
                      ).toList(),
                    ),
                  ),
                  /* Row(children: [
                    TextButton(onPressed: _cancel, child: Text("Cancel")),
                    TextButton(onPressed: _submit, child: Text("submit"))
                  ],) */
                ],
              ),
            ),
          ),
        ),
      ]
    );
  }
}