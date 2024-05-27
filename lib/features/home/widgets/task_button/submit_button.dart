import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_foundation/features/home/bloc/tasks_bloc.dart';

class SubmitButton extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController descriptionController;

  const SubmitButton({
    super.key,
    required this.titleController,
    required this.descriptionController,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Готово'),
      onPressed: () {
        if (titleController.text.isNotEmpty) {
          BlocProvider.of<TasksBloc>(context).add(AddTask(
            titleController.text,
            descriptionController.text,
          ));
          titleController.clear();
          descriptionController.clear();
          Navigator.pop(context);
        }
      },
    );
  }
}
