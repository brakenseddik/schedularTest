import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserOption extends StatefulWidget {
  const UserOption({
    Key? key,
  }) : super(key: key);

  @override
  State<UserOption> createState() => _UserOptionState();
}

class _UserOptionState extends State<UserOption> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        height: 60,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: isSelected
                ? Colors.green.withOpacity(.2)
                : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8)),
        child: isSelected
            ? const Icon(
                CupertinoIcons.checkmark_alt_circle,
                color: Colors.green,
              )
            : Icon(
                CupertinoIcons.question_circle,
                color: Colors.grey.shade500,
              ),
      ),
    );
  }
}
