// import 'package:doctor_appointment_app/screens/home_page.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class MainLayout extends StatefulWidget {
//   const MainLayout({Key? key}) : super(key: key);

//   @override
//   State<MainLayout> createState() => _MainLayoutState();
// }

// class _MainLayoutState extends State<MainLayout> {
//   //variable declaration
//   int currentPage = 0;
//   final PageController _page = PageController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         controller: _page,
//         onPageChanged: ((value) {
//           setState(() {
//             currentPage = value;
//           });
//         }),
//         children: <Widget>[
//           const HomePage(),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: currentPage,
//         onTap: (page) {
//           setState(() {
//             currentPage = page;
//             _page.animateToPage(
//               page,
//               duration: const Duration(milliseconds: 500),
//               curve: Curves.easeInOut,
//             );
//           });
//         },
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: FaIcon(FontAwesomeIcons.home),
//             label: 'Home',
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:doctor_appointment_app/screens/home_page.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  late PageController _page;

  @override
  void initState() {
    super.initState();
    _page = PageController();
  }

  @override
  void dispose() {
    _page.dispose(); // Dispose the PageController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _page,
        children: const <Widget>[
          HomePage(), // Assuming HomePage is a StatefulWidget
        ],
      ),
    );
  }
}
