import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist/Hive/hiveTask.dart';

class Hivedatastore{
  //Box Name - String
  static const boxName = "taskbox";

  //Our current Box with all the saved data inside - Box<HiveTask>
  final Box<HiveTask>box = Hive.box<HiveTask>(boxName);


  //add new task
  Future<void> addTask({required HiveTask task}) async{
    await box.put(task.id, task);
  }

  //Show Task
  Future<HiveTask?> getTask({required String KeyId}) async{
    return box.get(KeyId);
  }

  //Update Task
  Future<void> updateTask({required HiveTask task}) async{
    await task.save();
  }

  //Delete Task
  Future<void> deleteTask({required HiveTask task}) async{
    await task.delete();
  }

  //Delete All Tasks
  Future<void> deleteAllTask() async{
    await box.clear();
  }

  ///listen to box changes
  ///Using this method we will liesten to box changes and update the UI accordingly 
  ValueListenable<Box<HiveTask>> listenToTask() => box.listenable();
}