import 'package:app_credibanco_login/src/pages/Logeado.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';

import '../pages/my_pocket.dart';

class BarNavigation extends StatefulWidget {
  final bool page;

  const BarNavigation({super.key, required this.page});

  @override
  State<BarNavigation> createState() => _BarNavigationState();
}

class _BarNavigationState extends State<BarNavigation> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 80,
            width: 200,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                border: Border.all(color: Colors.black54),
                borderRadius: BorderRadius.circular(35),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(25, 0, 0, 0),
                    offset: Offset(0, 3),
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      isSelected: true,
                      icon: Iconify(
                        Bi.house,
                        color: widget.page == true
                            ? Color(0xFF008D89)
                            : Color.fromARGB(255, 7, 7, 7),
                      ),
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        context.go("/logeadoPage");
                      },
                    ),
                    Text(
                      "Inicio",
                      style: TextStyle(
                        color: widget.page == true
                            ? Color(0xFF008D89)
                            : Color.fromARGB(255, 7, 7, 7),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        /* Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PocketList())); */
                        context.go("/ListPocket");
                      },
                      icon: Iconify(
                        Bi.wallet,
                        color: widget.page == true
                            ? const Color.fromARGB(255, 7, 7, 7)
                            : const Color(0xFF008D89),
                      ),

                      disabledColor: const Color.fromARGB(255, 0, 0, 0),
                      //splashColor: ,
                    ),
                    Text(
                      "Bolisllo",
                      style: TextStyle(
                        color: widget.page == true
                            ? const Color.fromARGB(255, 7, 7, 7)
                            : const Color(0xFF008D89),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
