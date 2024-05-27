import 'package:go_foundation/repository/models/tasks.dart';
import 'package:go_foundation/repository/tasks/tasks_repository.dart';
import 'package:meta/meta.dart';
import 'package:realm/realm.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final TasksRepository tasksRepository;

  TasksBloc(this.tasksRepository) : super(TasksInitial()) {
    on<LoadTasks>(_onLoadTasks);
    on<AddTask>(_onAddTask);
    on<ToogleTaskCompletion>(_onToogleTaskCompletion);
    on<DeleteTask>(_onDeleteTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteAll>(_onDeleteAll);
  }

  Future<void> _onLoadTasks(LoadTasks event, Emitter<TasksState> emit) async {
    try {
      emit(TasksLoading());
      final tasks = await tasksRepository.getAllTasks();
      emit(TasksLoaded(tasks));
    } catch (e) {
      emit(TasksError(e.toString()));
    }
  }

  Future<void> _onAddTask(AddTask event, Emitter<TasksState> emit) async {
    emit(TasksLoading());
    try {
      final newTask = TasksModels(
        ObjectId(),
        event.title,
        event.description!,
        false,
      );
      await tasksRepository.createTask(newTask);
      add(LoadTasks());
    } catch (e) {
      emit(TasksError(e.toString()));
    }
  }

  Future<void> _onToogleTaskCompletion(
      ToogleTaskCompletion event, Emitter<TasksState> emit) async {
    try {
      await tasksRepository.updateTaskCompletion(event.id, event.isDone);
      add(LoadTasks());
    } catch (e) {
      emit(TasksError(e.toString()));
    }
  }

  Future<void> _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) async {
    try {
      await tasksRepository.deleteTask(event.id);
      add(LoadTasks());
    } catch (e) {
      emit(TasksError(e.toString()));
    }
  }

  Future<void> _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) async {
    try {
      final taskToUpdate = await tasksRepository.getTask(event.id);
      final updatedTask = TasksModels(
        event.id,
        event.title,
        event.description ?? '',
        taskToUpdate.isDone,
      );

      await tasksRepository.updateTask(updatedTask);
      add(LoadTasks());
    } catch (e) {
      emit(TasksError(e.toString()));
    }
  }

  Future<void> _onDeleteAll(DeleteAll event, Emitter<TasksState> emit) async {
    try {
      await tasksRepository.deleteAll();
      add(LoadTasks());
    } catch (e) {
      emit(TasksError(e.toString()));
    }
  }
}
