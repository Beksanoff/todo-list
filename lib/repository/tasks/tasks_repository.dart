import 'package:go_foundation/repository/models/tasks.dart';
import 'package:go_foundation/repository/tasks/tasks_interface.dart';
import 'package:realm/realm.dart';

class TasksRepository implements TasksInterface {
  TasksRepository({required this.realm});
  final Realm realm;

  @override
  Future<TasksModels> createTask(TasksModels task) {
    realm.write(() => realm.add(task));
    return Future.value(task);
  }

  @override
  Future<void> deleteTask(ObjectId id) async {
    final taskToDelete = realm.find<TasksModels>(id);
    if (taskToDelete != null) {
      realm.write(() => realm.delete(taskToDelete));
    } else {
      throw Exception('Task not found');
    }
  }

  @override
  Future<TasksModels> getTask(ObjectId id) {
    final task = realm.find<TasksModels>(id);
    if (task != null) {
      return Future.value(task);
    } else {
      throw Exception('Task not found');
    }
  }

  @override
  Future<void> updateTask(TasksModels task) async {
    final taskToUpdate = realm.find<TasksModels>(task.id);
    if (taskToUpdate != null) {
      realm.write(() {
        taskToUpdate.title = task.title;
        taskToUpdate.description = task.description;
      });
    } else {
      throw Exception('Task not found');
    }
  }

  @override
  Future<void> deleteAll() {
    realm.deleteAll();
    return Future.value();
  }

  @override
  Future<List<TasksModels>> getAllTasks() async {
    final tasks = realm.all<TasksModels>().toList();
    return tasks;
  }

  @override
  Future<void> updateTaskCompletion(ObjectId id, bool isDone) async {
    final taskToUpdate = realm.find<TasksModels>(id);
    if (taskToUpdate != null) {
      realm.write(() {
        taskToUpdate.isDone = isDone;
      });
    } else {
      throw Exception('Task not found');
    }
  }
}
