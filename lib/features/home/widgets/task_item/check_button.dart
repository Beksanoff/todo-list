import 'package:flutter/material.dart';

class CheckButton extends StatelessWidget {
  final bool isDone;
  final VoidCallback onPressed;

  const CheckButton({super.key, required this.isDone, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(isDone ? Icons.check_box : Icons.check_box_outline_blank),
      onPressed: onPressed,
    );
  }
}
