import 'package:app_assistance/config/theme/theme_app.dart';
import 'package:flutter/material.dart';

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = ColorsApp.whiteColor
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    double dashWidth = 7;
    double dashSpace = 7;
    double startY = size.height / 2;
    double endX = size.width;

    while (endX > 0) {
      canvas.drawLine(
          Offset(endX - dashWidth, startY), Offset(endX, startY), paint);
      endX -= (dashWidth + dashSpace);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
