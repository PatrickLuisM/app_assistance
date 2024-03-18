import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeRow extends StatelessWidget {
  final DateTime currentTime;
  final IconData icon;

  const DateTimeRow({
    Key? key,
    required this.currentTime,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(currentTime);
    String formattedTime = DateFormat('HH:mm:ss').format(currentTime);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon),
            const SizedBox(width: 10),
            Text(formattedDate),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.schedule),
            const SizedBox(width: 10),
            Text(formattedTime),
          ],
        ),
      ],
    );
  }
}
