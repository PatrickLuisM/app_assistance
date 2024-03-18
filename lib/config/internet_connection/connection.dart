import 'dart:async';

import 'package:app_assistance/screens/authentication/login_dart.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// Reemplaza 'your_app' con el nombre de tu aplicación

class ConnectivityScreen extends StatefulWidget {
  @override
  _ConnectivityScreenState createState() => _ConnectivityScreenState();
}

class _ConnectivityScreenState extends State<ConnectivityScreen> {
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        // No hay conexión a Internet
        print('No hay conexión a Internet');
      } else {
        // Hay conexión a Internet, cargar la aplicación principal
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => MyApp()), // Reemplaza 'MyApp' con el nombre de tu aplicación principal
        // );
        context.pushReplacement('/login');
      }
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'No hay conexión a Internet',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () {
                _checkInternetConnection();
              },
              child: Text('Reintentar'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult != ConnectivityResult.none) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                LoginScreen()), // Reemplaza 'MyApp' con el nombre de tu aplicación principal
      );
      // context.pushReplacement('/');
    }
  }
}
