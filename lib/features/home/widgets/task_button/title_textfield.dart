import 'package:flutter/material.dart';

class TitleTextField extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  TitleTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: titleController,
      decoration: const InputDecoration(
        labelText: 'Заголовок',
        border: InputBorder.none,
      ),
    );
  }
}
