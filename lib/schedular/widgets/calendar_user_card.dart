import 'package:flutter/material.dart';

class CalendarUserCard extends StatelessWidget {
  final String id;
  const CalendarUserCard({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      width: 140,
      height: 60,
      child: Row(
        children: [
          CircleAvatar(radius: 22, child: Text(id.toString())),
          const SizedBox(
            width: 8.0,
          ),
          const Expanded(
              child: Text(
            'User name',
            style: TextStyle(fontWeight: FontWeight.w400),
          ))
        ],
      ),
    );
  }
}
