import 'package:app_assistance/config/theme/theme_app.dart';
import 'package:app_assistance/screens/screens.dart';
import 'package:app_assistance/widgets/drawer/drawer.dart';
import 'package:flutter/material.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavBar> createState() => _MyButtomNavBarState();
}

class _MyButtomNavBarState extends State<MyBottomNavBar> {
  int myCurrentIndex = 0;
  List pages = const [HomeScreen(), QrScreen(), InfoScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      drawer: const DrawerWidget(),
      body: Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: false,
            extendBody: true,
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: ColorsApp.blackColor,
              unselectedItemColor: ColorsApp.iconColor,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              backgroundColor: ColorsApp.backgroundColor,
              currentIndex: myCurrentIndex,
              onTap: (index) {
                setState(() {
                  myCurrentIndex = index;
                });
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: "Inicio"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle), label: "Datos"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.signal_cellular_alt), label: "Informe"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.logout), label: "Salir"),
              ],
            ),
            body: pages[myCurrentIndex],
          ),
          Builder(
            builder: (BuildContext context) {
              return Positioned(
                top: 50,
                left: 0,
                child: Container(
                  width: 48,
                  height: 56,
                  decoration: const BoxDecoration(
                    color: ColorsApp.blackColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(200),
                      bottomRight: Radius.circular(200),
                    ),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.border_all_rounded),
                    color: ColorsApp.whiteColor,
                    iconSize: 33,
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
