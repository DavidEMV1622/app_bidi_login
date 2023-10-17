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
  const barNavigation({super.key});

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
                //color: Colors.white,
                color: Colors.transparent,
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
                      onPressed: () {},
                      icon: const Iconify(Bi.house),
                      color: const Color(0xFF008D89), //#008D89
                      highlightColor: const Color.fromARGB(255, 0, 0, 0),
                    ),
                    const Text("Inicio")
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
                      onPressed: () {},
                      //icon: const Iconify(Bi.wallet),
                      icon: Icon(Icons.access_time_filled),
                      color: const Color.fromARGB(255, 0, 0, 0), //#008D89
                      splashColor: const Color(0xFF008D89),
                    ),
                    const Text("Bolisllo"),
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
