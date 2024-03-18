// ignore_for_file: library_private_types_in_public_api

import 'package:app_assistance/config/theme/theme_app.dart';
import 'package:flutter/material.dart';

import 'date_utils_state.dart';

class StateDialog extends StatefulWidget {
  const StateDialog({Key? key}) : super(key: key);

  @override
  _StateDialogState createState() => _StateDialogState();
}

class _StateDialogState extends State<StateDialog> {
  late String _selectedState;

  @override
  void initState() {
    super.initState();
    _selectedState = getStateName(
        1); // Establecer el primer estado como seleccionado inicialmente
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double dialogWidth = screenSize.width * 0.7; // Ancho del AlertDialog
    final double buttonMaxWidth = dialogWidth * 0.43; // Ancho máximo del botón
    return Theme(
      data: Theme.of(context).copyWith(
        dialogBackgroundColor: ColorsApp.backgroundColor,
      ),
      child: AlertDialog(
        title: const Text('Selecciona Estado', textAlign: TextAlign.center),
        content: SizedBox(
          width: dialogWidth,
          child: WillPopScope(
            onWillPop: () async {
              // Impide que el diálogo se cierre al tocar fuera de él
              return false;
            },
            child: StatefulBuilder(builder: (context, setState) {
              return Column(mainAxisSize: MainAxisSize.min, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButton<String>(
                      value: _selectedState,
                      items: List.generate(3, (index) {
                        return DropdownMenuItem<String>(
                          value: getStateName(index + 1),
                          child: Text(getStateName(index + 1)),
                        );
                      }),
                      onChanged: (value) {
                        setState(() {
                          _selectedState = value!;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: buttonMaxWidth,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsApp.btnPrimary,
                          maximumSize: Size(buttonMaxWidth, double.infinity),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancelar',
                            style: TextStyle(color: ColorsApp.whiteColor)),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsApp.btnPrimary,
                        maximumSize: Size(buttonMaxWidth, double.infinity),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(_selectedState);
                      },
                      child: const Text(
                        'OK',
                        style: TextStyle(color: ColorsApp.whiteColor),
                      ),
                    ),
                  ],
                ),
              ]);
            }),
          ),
        ),
      ),
    );
  }
}
