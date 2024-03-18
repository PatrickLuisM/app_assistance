import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String initialValue;
  final bool isEditable;
  final double boxSize;
  final TextInputType inputType;
  final String hintText;
  // final Color editingColor; // Agregar el color de fondo para la edición
  // final Color normalColor;

  const CustomTextField({
    Key? key,
    required this.initialValue,
    required this.isEditable,
    required this.boxSize,
    required this.inputType,
    required this.hintText,
    // required this.editingColor,
    // required this.normalColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * boxSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
        // color: isEditable ? editingColor : normalColor,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        initialValue: initialValue,
        readOnly: !isEditable,
        keyboardType: inputType,
        style: const TextStyle(fontSize: 15),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(color: isEditable ? Colors.grey : null),
        ),
      ),
    );
  }
}
