import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../config/theme/theme_app.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final IconData? suffixIcon; // Icono opcional
  final FormFieldValidator<String>? validator;
  final GlobalKey<FormState>? formKey;
  final TextInputType keyboardType;
  bool obsText;
  bool isEnabled;

  CustomTextFormField({
    required this.labelText,
    required this.controller,
    this.suffixIcon,
    this.formKey,
    this.validator,
    this.isEnabled = false,
    this.obsText = false,
    required this.keyboardType, // Parámetro opcional
  }) : super(key: formKey);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: _autovalidateMode,
      enabled: widget.isEnabled,
      key: widget.formKey,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: widget.obsText,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorsApp.whiteColor,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        labelText: widget.labelText,

        labelStyle: GoogleFonts.raleway(
          color: ColorsApp.textTitle.withOpacity(0.7),
          fontWeight: FontWeight.w500,
          fontSize: 17,
        ),
        // Verifica si se proporciona un sufijo y, de ser así, agrégalo
        suffixIcon: widget.suffixIcon != null
            ? IconButton(
                onPressed: () {
                  setState(() {
                    // Cambia el estado de obscureText al presionar el icono
                    widget.obsText = !widget.obsText;
                  });
                },
                icon: Icon(
                    widget.obsText ? Icons.visibility_off : Icons.visibility),
              )
            : null,
      ),
      onChanged: (_) {
        setState(() {
          _autovalidateMode = AutovalidateMode.always;
        });
      },
      validator: widget.validator,
    );
  }
}
