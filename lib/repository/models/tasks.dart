import 'package:realm/realm.dart';

part 'tasks.realm.dart';

@RealmModel()
class _TasksModels {
  @PrimaryKey()
  late ObjectId id;
  late String title;
  late String description;
  late bool isDone;
}
