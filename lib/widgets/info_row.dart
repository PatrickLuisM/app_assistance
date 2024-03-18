import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final EdgeInsets padding;

  const InfoRow({
    required this.label,
    required this.value,
    this.padding = const EdgeInsets.only(right: 25),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Row(
        children: [
          Text(label,
              style: GoogleFonts.raleway(
                  fontSize: 17, fontWeight: FontWeight.w500)),
          const SizedBox(width: 30),
          Text(
            value,
            style: GoogleFonts.raleway(fontSize: 17),
          ),
        ],
      ),
    );
  }
}
