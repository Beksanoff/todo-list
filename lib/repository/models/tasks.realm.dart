// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class TasksModels extends _TasksModels
    with RealmEntity, RealmObjectBase, RealmObject {
  TasksModels(
    ObjectId id,
    String title,
    String description,
    bool isDone,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set(this, 'isDone', isDone);
  }

  TasksModels._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  String get description =>
      RealmObjectBase.get<String>(this, 'description') as String;
  @override
  set description(String value) =>
      RealmObjectBase.set(this, 'description', value);

  @override
  bool get isDone => RealmObjectBase.get<bool>(this, 'isDone') as bool;
  @override
  set isDone(bool value) => RealmObjectBase.set(this, 'isDone', value);

  @override
  Stream<RealmObjectChanges<TasksModels>> get changes =>
      RealmObjectBase.getChanges<TasksModels>(this);

  @override
  Stream<RealmObjectChanges<TasksModels>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<TasksModels>(this, keyPaths);

  @override
  TasksModels freeze() => RealmObjectBase.freezeObject<TasksModels>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'title': title.toEJson(),
      'description': description.toEJson(),
      'isDone': isDone.toEJson(),
    };
  }

  static EJsonValue _toEJson(TasksModels value) => value.toEJson();
  static TasksModels _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'title': EJsonValue title,
        'description': EJsonValue description,
        'isDone': EJsonValue isDone,
      } =>
        TasksModels(
          fromEJson(id),
          fromEJson(title),
          fromEJson(description),
          fromEJson(isDone),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(TasksModels._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, TasksModels, 'TasksModels', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('description', RealmPropertyType.string),
      SchemaProperty('isDone', RealmPropertyType.bool),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
