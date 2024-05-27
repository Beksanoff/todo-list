import 'package:go_foundation/repository/models/tasks.dart';
import 'package:realm/realm.dart';

abstract class TasksInterface {
  Future<TasksModels> createTask(TasksModels task);
  Future<TasksModels> getTask(ObjectId id);
  Future<void> updateTask(TasksModels task);
  Future<void> deleteTask(ObjectId id);
  Future<void> deleteAll();
  Future<List<TasksModels>> getAllTasks();
  Future<void> updateTaskCompletion(ObjectId id, bool isDone);
}
