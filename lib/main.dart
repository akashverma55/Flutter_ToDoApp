import 'package:todolist/Hive/hiveDataStore.dart';
import 'package:todolist/Hive/hiveTask.dart';
import 'home/home.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';




Future<void> main() async{
  //Initiate Hive Database before runApp
  await Hive.initFlutter();

  // Register Hive Adapter
  Hive.registerAdapter<HiveTask>(HiveTaskAdapter());

  //Open a Box
  Box box = await Hive.openBox<HiveTask>(Hivedatastore.boxName);

  //Delete data from previous day
  box.values.forEach(
    (task){
      if (task.createdAtTime.day != DateTime.now().day){
        task.delete();
      }
    }
  );
  runApp(BaseWidget(childwidget:MyApp()));
}





////Create an inherited widget to pass the hive database object anywhere you want by wrapping it in under the basewidget
class BaseWidget extends InheritedWidget{
  BaseWidget({super.key,required this.childwidget}):super(child:childwidget);

  final Hivedatastore datastore = Hivedatastore();
  final Widget childwidget;

  /////This method will be called whenever we need to access the hive database object
  static BaseWidget of(BuildContext context){
    final base = context.dependOnInheritedWidgetOfExactType<BaseWidget>();
    if(base != null){
      return base;
    }
    else{
      throw StateError("Could not find ancestor widget of type BaseWidget");
    }
  }
  
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}






class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Home(), 
        debugShowCheckedModeBanner: false
    );
  } 
}

