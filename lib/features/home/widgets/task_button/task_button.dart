import 'package:flutter/material.dart';
import 'package:go_foundation/ui/widgets/custom_textfield.dart';
import 'package:go_foundation/features/home/widgets/task_button/submit_button.dart';

class AddTaskButton extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  AddTaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      CustomTextField(
                          controller: titleController, labelText: 'Заголовок'),
                      const SizedBox(height: 16),
                      CustomTextField(
                          controller: descriptionController,
                          labelText: 'Описание'),
                      const SizedBox(height: 16),
                      SubmitButton(
                          titleController: titleController,
                          descriptionController: descriptionController)
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      tooltip: 'Add Task',
      child: const Icon(Icons.add),
    );
  }
}
