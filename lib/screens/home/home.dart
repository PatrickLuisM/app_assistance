import 'dart:async';
import 'package:app_assistance/config/theme/theme_app.dart';
import 'package:app_assistance/screens/home/event_button.dart';
import 'package:app_assistance/widgets/drawer/boton_drawer.dart';

import 'package:app_assistance/widgets/info_row.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import '../../widgets/customdash.dart';
import '../../widgets/drawer/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late DateTime _currentTime;
  late Timer _timer;
  int? selectedOption;

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now();
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        _currentTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Detiene el Timer cuando el widget se elimina
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(_currentTime);
    String formattedTime = DateFormat('HH:mm:ss').format(_currentTime);

    return Scaffold(
      extendBody: true,
      drawer: const DrawerWidget(),
      backgroundColor: ColorsApp.backgroundColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'CheckIn Trace',
                    style: GoogleFonts.raleway(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: ColorsApp.textprimary),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const InfoRow(
                    label: 'Horario: ',
                    value: '14:00 - 23:00',
                    padding: EdgeInsets.only(left: 100),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 30, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.calendar_month_outlined),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(formattedDate)
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.schedule),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(formattedTime)
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFFFD3CB),
                            blurRadius: 20,
                            spreadRadius: 0.2,
                            offset: Offset(0, 2),
                          ),
                        ],
                        color: ColorsApp.qrColor,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    width: 120,
                    height: 140,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () async {
                              String barcodeScanRes =
                                  await FlutterBarcodeScanner.scanBarcode(
                                '#ff6666', // Color personalizado para la línea de escaneo
                                'Cancelar', // Texto para el botón de cancelar
                                true, // Usar el escáner de códigos QR en modo oscuro
                                ScanMode.QR, // Tipo de código a escanear
                              );

                              if (barcodeScanRes != '-1') {
                                print('Codigo QR escaneado: $barcodeScanRes');
                              } else {
                                // Si se canceló el escaneo
                                print('Escaneo cancelado');
                              }
                            },
                            icon: const Icon(
                              Icons.qr_code_sharp,
                              size: 60,
                            )),
                        Stack(
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  'Scannear',
                                  style: GoogleFonts.raleway(
                                      color: ColorsApp.blackColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                            CustomPaint(
                              size: const Size(
                                  100, 1), // Tamaño de la línea punteada
                              painter: DashedLinePainter(),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 230,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Text(
                            'Seleccione el evento',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 15),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            EventButton(
                              urlImage: 'assets/capacitacion.png',
                              textButton: 'Capacitacioón',
                              onTapButton: () {},
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            EventButton(
                              urlImage: 'assets/capacitacion.png',
                              textButton: 'Capacitacioón',
                              onTapButton: () {},
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            EventButton(
                              urlImage: 'assets/capacitacion.png',
                              textButton: 'Capacitacioón',
                              onTapButton: () {},
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            EventButton(
                              urlImage: 'assets/capacitacion.png',
                              textButton: 'Capacitacioón',
                              onTapButton: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const DrawerOpener(),
        ],
      ),
    );
  }
}
