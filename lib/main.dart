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

  runApp(const MyApp());
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

