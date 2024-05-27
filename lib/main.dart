import 'package:flutter/material.dart';
import 'package:go_foundation/app.dart';
import 'package:go_foundation/repository/models/tasks.dart';
import 'package:realm/realm.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final configure = Configuration.local([TasksModels.schema]);
  final realm = Realm(configure);
  runApp(MyApp(realm: realm));
}
