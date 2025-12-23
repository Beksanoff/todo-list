import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_foundation/features/home/bloc/tasks_bloc.dart';
import 'package:go_foundation/features/settings/view/settings_screen.dart';
import '../widgets/task_button/task_button.dart';
import '../widgets/task_item/task_item.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TasksBloc _tasksBloc;

  @override
  void initState() {
    _tasksBloc = context.read<TasksBloc>();
    _tasksBloc.add(LoadTasks());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Image.asset('assets/icons/gofound.png'),
        ],
        leading: IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SettingsScreen()));
          },
        ),
        title: Text(
          'Заметки',
          style: themeData.textTheme.titleLarge,
        ),
      ),
      body: BlocBuilder<TasksBloc, TasksState>(
        builder: (context, state) {
          if (state is TasksLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TasksLoaded) {
            if (state.tasks.isEmpty) {
              return const Center(child: Text('Список задач пуст'));
            }
            return ListView.builder(
              itemCount: state.tasks.length,
              itemBuilder: (context, index) {
                final task = state.tasks[index];
                return TaskItem(task: task, tasksBloc: _tasksBloc);
              },
            );
          } else if (state is TasksError) {
            return Center(
              child: Text(state.message),
            );
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: AddTaskButton(),
    );
  }
}
