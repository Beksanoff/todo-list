part of 'tasks_bloc.dart';

@immutable
sealed class TasksEvent {}

class LoadTasks extends TasksEvent {}

class AddTask extends TasksEvent {
  final String title;
  final String? description;

  AddTask(this.title, this.description);
}

class UpdateTask extends TasksEvent {
  final ObjectId id;
  final String title;
  final String? description;

  UpdateTask(this.id, this.title, this.description);
}

class DeleteTask extends TasksEvent {
  final ObjectId id;

  DeleteTask(this.id);
}

class DeleteAll extends TasksEvent {}

class ToogleTaskCompletion extends TasksEvent {
  final ObjectId id;
  final bool isDone;

  ToogleTaskCompletion(this.id, this.isDone);
}
