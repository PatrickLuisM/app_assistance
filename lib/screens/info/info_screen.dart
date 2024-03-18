import 'package:app_assistance/screens/info/datepick/date_utils_month.dart';
import 'package:app_assistance/screens/info/list_date_hours.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../config/theme/theme_app.dart';
import '../../widgets/drawer/boton_drawer.dart';
import '../../widgets/drawer/drawer.dart';
import 'datepick/month_year.dart';
import 'datestate/state_user.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  String _selectedDateText = '';
  String _selectedState = 'Seleccione';

  @override
  void initState() {
    super.initState();
    _selectedDateText = _getFormattedDate(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backgroundColor,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              Text(
                'CheckIn Trace',
                style: GoogleFonts.raleway(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: ColorsApp.textprimary),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      IconButton(
                          color: const Color(0xFF44BF49),
                          onPressed: () {
                            _showMonthPicker(context);
                          },
                          icon: const Icon(Icons.calendar_month)),
                      Text(
                        _selectedDateText,
                        style: const TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                          color: const Color(0xFFC60303),
                          onPressed: () {
                            _showStatusDialog(context);
                          },
                          icon: const Icon(Icons.calendar_month)),
                      Text(
                        _selectedState,
                        style: const TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Asistencia mes actual',
                textAlign: TextAlign.start,
                style: GoogleFonts.raleway(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: ColorsApp.textprimary),
              ),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        height: MediaQuery.of(context).size.width * 0.15,
                        color: ColorsApp.whiteColor,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(dateListMonth[index]),
                              Text(hourListMounth[index]),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Divider(),
                        ),
                    itemCount: dateListMonth.length),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
          const DrawerOpener(),
        ],
      ),
      drawer: const DrawerWidget(),
    );
  }

  String _getFormattedDate(DateTime date) {
    return '${getMonthName(date.month)} ${date.year}';
  }

  Future<void> _showMonthPicker(BuildContext context) async {
    final result = await showDialog<String>(
      context: context,
      builder: (context) => const MonthPickerDialog(),
    );

    if (result != null) {
      setState(() {
        _selectedDateText = result;
      });
    }
  }

  Future<void> _showStatusDialog(BuildContext context) async {
    final result = await showDialog<String>(
      context: context,
      builder: (context) => const StateDialog(),
    );

    if (result != null) {
      setState(() {
        _selectedState = result;
      });
    }
  }
}
