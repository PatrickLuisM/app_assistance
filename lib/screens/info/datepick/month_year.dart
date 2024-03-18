// ignore_for_file: deprecated_member_use

import 'package:app_assistance/config/theme/theme_app.dart';
import 'package:flutter/material.dart';
import 'date_utils_month.dart';

class MonthPickerDialog extends StatefulWidget {
  const MonthPickerDialog({Key? key}) : super(key: key);

  @override
  _MonthPickerDialogState createState() => _MonthPickerDialogState();
}

class _MonthPickerDialogState extends State<MonthPickerDialog> {
  int _selectedYear = DateTime.now().year;
  int _selectedMonth = DateTime.now().month;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dialogBackgroundColor: ColorsApp.backgroundColor,
      ),
      child: AlertDialog(
        title: const Text(
          'Selecciona Mes y Año',
          textAlign: TextAlign.center,
        ),
        content: StatefulBuilder(builder: (context, setState) {
          return WillPopScope(
            onWillPop: () async {
              // Impide que el diálogo se cierre al tocar fuera de él
              return false;
            },
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton<int>(
                    value: _selectedYear,
                    items: List.generate(10, (index) {
                      return DropdownMenuItem<int>(
                        value: DateTime.now().year - index,
                        child: Text('${DateTime.now().year - index}'),
                      );
                    }),
                    onChanged: (value) {
                      setState(() {
                        _selectedYear = value!;
                      });
                    },
                  ),
                  DropdownButton<int>(
                    value: _selectedMonth,
                    items: List.generate(12, (index) {
                      return DropdownMenuItem<int>(
                        value: index + 1,
                        child: Text(getMonthName(index + 1)),
                      );
                    }),
                    onChanged: (value) {
                      setState(() {
                        _selectedMonth = value!;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsApp.btnPrimary,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Cancelar',
                      style: TextStyle(color: ColorsApp.whiteColor),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsApp.btnPrimary,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(
                        '${getMonthName(_selectedMonth)} $_selectedYear',
                      );
                    },
                    child: const Text(
                      'OK',
                      style: TextStyle(color: ColorsApp.whiteColor),
                    ),
                  ),
                ],
              ),
            ]),
          );
        }),
      ),
    );
  }
}
