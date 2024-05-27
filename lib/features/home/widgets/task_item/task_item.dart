import 'package:flutter/material.dart';
import 'package:go_foundation/features/home/bloc/tasks_bloc.dart';
import 'package:go_foundation/ui/widgets/custom_textfield.dart';
import 'package:go_foundation/features/home/widgets/task_item/cancel_button.dart';
import 'package:go_foundation/features/home/widgets/task_item/check_button.dart';
import 'package:go_foundation/features/home/widgets/task_item/delete_button.dart';
import 'package:go_foundation/features/home/widgets/task_item/save_button.dart';
import 'package:go_foundation/repository/models/tasks.dart';

class TaskItem extends StatelessWidget {
  final TasksModels task;
  final TasksBloc tasksBloc;

  const TaskItem({Key? key, required this.task, required this.tasksBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          task.title,
          style: themeData.textTheme.bodyLarge,
        ),
        subtitle: Text(task.description),
        onTap: () {
          final titleController = TextEditingController();
          final descriptionController = TextEditingController();
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Редактировать задачу'),
                content: Column(
                  children: <Widget>[
                    CustomTextField(
                        controller: titleController, labelText: 'Заголовок'),
                    const SizedBox(height: 16),
                    CustomTextField(
                        controller: descriptionController,
                        labelText: 'Описание'),
                  ],
                ),
                actions: <Widget>[
                  const CancelButton(),
                  SaveButton(
                    onPressed: () {
                      tasksBloc.add(UpdateTask(
                        task.id,
                        titleController.text,
                        descriptionController.text,
                      ));
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CheckButton(
              isDone: task.isDone,
              onPressed: () {
                tasksBloc.add(ToogleTaskCompletion(task.id, !task.isDone));
              },
            ),
            DeleteButton(
              onPressed: () {
                tasksBloc.add(DeleteTask(task.id));
              },
            ),
          ],
        ),
      ),
    );
  }
}
