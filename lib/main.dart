import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todolist/data/hive_data_store.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/views/home/home_view.dart';

Future<void> main()async{

  //// Initialize DB before runApp //// 
  await Hive.initFlutter();

  //// Register Hive Adapter ////
  Hive.registerAdapter<Task>(TaskAdapter());

  //// Open a box ////
  Box box = await Hive.openBox<Task>(HiveDataStore.boxName);

  //// To delete the previous day task ////
  for (var task in box.values) {
      if (task.createdAtTime.day != DateTime.now().day){
        task.delete();
      }
    }
  runApp(const MyApp());
}

class BaseWidget extends InheritedWidget{
  BaseWidget(this.child,{super.key}) : super(child: child);

  final HiveDataStore dataStore = HiveDataStore();
  final Widget child;

  static BaseWidget of(BuildContext context){
    final base = context.dependOnInheritedWidgetOfExactType<BaseWidget>();

    if (base!=null){
      return base;
    }
    else{
      throw StateError("Could not find ancestor widget of type Basewidget");
    }
  }
  
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Hive Todo App",
      theme: ThemeData(
        textTheme: const TextTheme(


          displayLarge: TextStyle(
            color: Colors.black,
            fontSize: 45,
            fontWeight: FontWeight.bold
          ),


          titleMedium: TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w300
          ),


          displayMedium: TextStyle(
            color: Colors.white,
            fontSize: 21
          ),


          displaySmall: TextStyle(
            color: Color.fromARGB(255, 234, 234, 234),
            fontSize: 14,
            fontWeight: FontWeight.w400
          ),


          headlineMedium: TextStyle(
            color: Colors.grey,
            fontSize: 17
          ),


          headlineSmall: TextStyle(
            color: Colors.grey,
            fontSize: 16
          ),


          titleSmall: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500
          ),


          titleLarge: TextStyle(
            fontSize: 40,
            color: Colors.black,
            fontWeight: FontWeight.w300
          ),
        ),
      ),

      ////Home////
      home: BaseWidget(HomeView()),
    );
  }
}

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState()=> _HomeState();
}

class _HomeState extends State<Home>{
  @override
  Widget build(BuildContext context){
    return Scaffold(

    );
  }
}