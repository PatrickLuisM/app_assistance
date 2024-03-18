import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../config/theme/theme_app.dart';
import '../../widgets/button.dart';
import '../../widgets/drawer/boton_drawer.dart';
import '../../widgets/drawer/drawer.dart';
import '../../widgets/form/custom_field_info.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({super.key});

  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isEditable = false;

  // Valores iniciales para los campos
  final String _initialName = 'John Doe';
  final String _initialWork = 'GeekCorp EIRL';
  final String _initialDNI = '89312013';
  final String _initialNumber = '999999999';
  final String _initialDate = '1/11/1000';
  final String _initialHor = '14:00 - 23:00';
  final String _initialHotmail = 'patricklmo32@gmail.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backgroundColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
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
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                  margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  decoration: BoxDecoration(
                    color: ColorsApp.whiteColor,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  _isEditable = false;
                                });
                              },
                              icon: const Icon(
                                Icons.cancel,
                                size: 40,
                                color: ColorsApp.iconColor,
                              )),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  _isEditable = true;
                                });
                              },
                              icon: const Icon(
                                Icons.edit_square,
                                size: 40,
                                color: ColorsApp.iconColor,
                              )),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              CustomTextField(
                                  initialValue: _initialWork,
                                  isEditable: false,
                                  boxSize: 0.8,
                                  hintText: 'Empresa',
                                  inputType: TextInputType.streetAddress),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextField(
                                    initialValue: _initialName,
                                    isEditable: false,
                                    boxSize: 0.8,
                                    hintText: 'Nombre Completo',
                                    inputType: TextInputType.streetAddress),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextField(
                                    initialValue: _initialHotmail,
                                    isEditable: _isEditable,
                                    boxSize: 0.8,
                                    hintText: 'Correo Electronico',
                                    inputType: TextInputType.streetAddress),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextField(
                                    initialValue: _initialDNI,
                                    isEditable: false,
                                    boxSize: 0.8,
                                    hintText: 'N° Documento',
                                    inputType: TextInputType.number),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: CustomTextField(
                                    initialValue: _initialDate,
                                    isEditable: false,
                                    boxSize: 0.8,
                                    hintText: 'F.Nac',
                                    inputType: TextInputType.streetAddress),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextField(
                                    initialValue: _initialNumber,
                                    isEditable: _isEditable,
                                    boxSize: 0.8,
                                    hintText: 'Telefono',
                                    inputType: TextInputType.number),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: CustomTextField(
                                    initialValue: _initialHor,
                                    isEditable: _isEditable,
                                    boxSize: 0.8,
                                    hintText: 'Horario',
                                    inputType: TextInputType.streetAddress),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          CustomButton(
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: MediaQuery.of(context).size.height * 0.07,
                              text: 'Grabar',
                              backgroundColor: ColorsApp.btnPrimary,
                              textColor: ColorsApp.whiteColor,
                              onPressed: () => {
                                    if (_formKey.currentState!.validate())
                                      {
                                        // El formulario es válido, puedes proceder con la acción deseada
                                      }
                                  }),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const DrawerOpener(),
        ],
      ),
      drawer: const DrawerWidget(),
    );
  }
}
