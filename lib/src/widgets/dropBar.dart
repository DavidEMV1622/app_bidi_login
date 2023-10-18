import 'package:app_credibanco_login/src/pages/Logeado.dart';
import 'package:app_credibanco_login/src/pages/logeado2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/cib.dart';

// class BottomNavigation extends StatefulWidget {
//   const BottomNavigation({super.key});

//   @override
//   State<BottomNavigation> createState() => _BottomNavigationState();
// }

// class _BottomNavigationState extends State<BottomNavigation> {
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       items: <BottomNavigationBarItem>[
//         BottomNavigationBarItem(
//             icon: SvgPicture.asset(
//               'assets/icons/icon_home.svg',
//               width: 10,
//               height: 10,
//             ),
//             label: 'Inicio '),
//         BottomNavigationBarItem(
//             icon: SvgPicture.asset(
//               'assets/icons/icon_wallet.svg',
//               width: 10,
//               height: 10,
//             ),
//             label: 'Bolsillo'),
//       ],
//       currentIndex: _selectedIndex,
//       selectedItemColor: Colors.amber,
//       onTap: _onItemTapped,
//     );
//   }
// }

// bottomNavigationBar

class barNavigation extends StatefulWidget {
  final bool page;

  const barNavigation({super.key, required this.page});

  @override
  State<barNavigation> createState() => _barNavigationState();
}

class _barNavigationState extends State<barNavigation> {
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
                color: Color.fromARGB(255, 255, 255, 255),
                border: Border.all(color: Colors.black54),
                borderRadius: BorderRadius.circular(35),
                boxShadow: [
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LogeadoPage()));
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LogeadoPage2()));
                      },
                      icon: Iconify(
                        Bi.wallet,
                        color: widget.page == true
                            ? Color.fromARGB(255, 7, 7, 7)
                            : Color(0xFF008D89),
                      ),

                      disabledColor: const Color.fromARGB(255, 0, 0, 0),
                      //splashColor: ,
                    ),
                    Text(
                      "Bolisllo",
                      style: TextStyle(
                        color: widget.page == true
                            ? Color.fromARGB(255, 7, 7, 7)
                            : Color(0xFF008D89),
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
