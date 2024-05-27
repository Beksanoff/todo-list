part of 'tasks_bloc.dart';

@immutable
sealed class TasksState {}

final class TasksInitial extends TasksState {}

final class TasksLoading extends TasksState {}

final class TasksLoaded extends TasksState {
  final List<TasksModels> tasks;

  TasksLoaded(this.tasks);
}

final class TasksError extends TasksState {
  final String message;

  TasksError(this.message);
}

final class TasksAdding extends TasksState {}
