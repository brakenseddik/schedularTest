import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarDateCard extends StatelessWidget {
  const CalendarDateCard({
    Key? key,
    required this.now,
  }) : super(key: key);

  final DateTime now;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            DateFormat.MMMEd().format(now),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Text(
            '${DateFormat.jm().format(now)} - ${DateFormat.jm().format(now.add(const Duration(hours: 4)))}',
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
