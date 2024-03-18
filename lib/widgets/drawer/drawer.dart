import 'package:app_assistance/config/theme/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              'Hola',
              style: GoogleFonts.raleway(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: ColorsApp.whiteColor),
            ),
            accountEmail: Text('Patrick Luis Muñoz',
                style: GoogleFonts.raleway(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: ColorsApp.whiteColor)),
            decoration: const BoxDecoration(color: ColorsApp.blackColor),
          ),
          ListTile(
            title: Text('Inicio'),
            leading: Icon(Icons.home),
            onTap: () {
              // Cerrar el drawer y hacer algo
              context.go('/home');
            },
          ),
          ListTile(
            title: Text('Datos'),
            leading: Icon(Icons.account_circle),
            onTap: () {
              // Cerrar el drawer y hacer algo
              context.go('/qr');
            },
          ),
          ListTile(
            title: Text('Informe'),
            leading: Icon(Icons.signal_cellular_alt),
            onTap: () {
              // Cerrar el drawer y hacer algo
              context.go('/info');
            },
          ),
          ListTile(
            title: Text('Salir'),
            leading: Icon(Icons.logout),
            onTap: () {
              // Cerrar el drawer y hacer algo
              context.go('/info');
            },
          ),
        ],
      ),
    );
  }
}
