import 'package:app_assistance/config/theme/theme_app.dart';
import 'package:app_assistance/config/validator/form_validator.dart';
import 'package:app_assistance/widgets/button.dart';
import 'package:app_assistance/widgets/form/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isDNISelected = false;
  bool isCarnetSelected = false;
  bool isTextFieldEnabled = false;
  final TextEditingController _documentController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _documentController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/Fondo2.png',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100, left: 30),
              child: Text(
                "Bienvenido.",
                style: GoogleFonts.raleway(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 250,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60))),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Center(
                            child: Text(
                              "Iniciar Sesión",
                              style: GoogleFonts.raleway(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                      value: isDNISelected,
                                      onChanged: (value) {
                                        setState(() {
                                          isDNISelected = value!;
                                          isCarnetSelected = !value;
                                          isTextFieldEnabled = value;
                                          if (!isTextFieldEnabled) {
                                            // Limpiar el texto si se deshabilita
                                            _documentController.clear();
                                          }
                                        });
                                      }),
                                  Text(
                                    'DNI',
                                    style: GoogleFonts.raleway(fontSize: 15),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                      value: isCarnetSelected,
                                      onChanged: (value) {
                                        setState(() {
                                          isCarnetSelected = value!;
                                          isDNISelected =
                                              !value; // Deshabilitar el otro
                                          isTextFieldEnabled =
                                              value; // Habilitar/deshabilitar TextField
                                          if (!isTextFieldEnabled) {
                                            // Limpiar el texto si se deshabilita
                                            _documentController.clear();
                                          }
                                        });
                                      }),
                                  Text(
                                    'Carné Extranjeria',
                                    style: GoogleFonts.raleway(fontSize: 15),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextFormField(
                            labelText: 'N° Documento',
                            controller: _documentController,
                            isEnabled: isTextFieldEnabled,
                            validator: isDNISelected
                                ? FormValidators.validateDocumentNumber
                                : FormValidators.validateCExtrajNumber,
                            keyboardType: isDNISelected
                                ? TextInputType.number
                                : TextInputType.text,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFormField(
                            labelText: 'Contraseña',
                            isEnabled: true,
                            controller: _passwordController,
                            suffixIcon: Icons.visibility_off,
                            keyboardType: TextInputType.visiblePassword,
                            obsText: true,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Checkbox(value: true, onChanged: (value) {}),
                              Text(
                                'Recordarme',
                                style: GoogleFonts.raleway(fontSize: 15),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomButton(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height * 0.07,
                              text: 'Acceder',
                              backgroundColor: ColorsApp.btnPrimary,
                              textColor: ColorsApp.whiteColor,
                              onPressed: () => {
                                    if (_formKey.currentState!.validate())
                                      {
                                        // El formulario es válido, puedes proceder con la acción deseada
                                        context.go('/home')
                                      }
                                  }),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () => {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Olvide mi contraseña',
                                  style: GoogleFonts.raleway(
                                      fontWeight: FontWeight.w300,
                                      color: ColorsApp.iconColor),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
