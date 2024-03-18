import 'package:flutter/material.dart';
import 'package:app_assistance/config/theme/theme_app.dart';

class DrawerOpener extends StatelessWidget {
  const DrawerOpener({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: 50,
      child: Builder(
        builder: (BuildContext context) {
          return Container(
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
          );
        },
      ),
    );
  }
}
