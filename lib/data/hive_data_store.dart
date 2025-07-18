import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todolist/models/task.dart';


//// All the crud Operations is done here ////
class HiveDataStore {
  static const boxName = "taskBox";

  final Box<Task> box = Hive.box<Task>(boxName);

  //Add new Task//
  Future<void> addtask({required Task task}) async{
    await box.put(task.id, task);
  }

  // Show Task //
  Future<Task?> getTask({required String id}) async{
    return box.get(id);
  }

  // Update Task //
  Future<void> updatetask({required Task task}) async{
    await task.save();
  }

  // Delete Task //
  Future<void> deleteTask({required Task task}) async{
    await task.delete();
  }


  /// Listen to Box Changes ///
  ValueListenable<Box<Task>> listenToTask() => box.listenable();
}