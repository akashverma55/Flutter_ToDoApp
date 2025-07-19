import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todolist/main.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/utils/app_colors.dart';
import 'package:todolist/utils/app_str.dart';
import 'package:todolist/utils/constants.dart';
import 'package:todolist/views/home/components/fab.dart';
import 'package:todolist/views/home/components/drawer.dart';
import 'package:todolist/views/home/widget/task_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:animate_do/animate_do.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // Check Value for circle progress indicator //
  dynamic valueOfIndicator(List<Task> task) {
    if (task.isNotEmpty) {
      return task.length;
    } else {
      return 3;
    }
  }

  // Check Done Task //
  int checkDoneTask(List<Task> tasks) {
    int count = 0;
    for (Task done in tasks) {
      if (done.isCompleted) {
        count++;
      }
    }
    return count;
  }

  final List<IconData> icons = [
    Icons.home,
    Icons.person,
    Icons.settings,
    Icons.info,
  ];
  final List<String> titles = ["Home", "Profile", "Settings", "Details"];

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    final base = BaseWidget.of(context);

    return ValueListenableBuilder(
      valueListenable: base.dataStore.listenToTask(),
      builder: (ctx, Box<Task> box, Widget? child) {
        var tasks = box.values.toList();

        tasks.sort((a, b) => a.createdAtDate.compareTo(b.createdAtDate));

        return Scaffold(
          backgroundColor: Colors.white,

          floatingActionButton: Fab(),

          appBar: AppBar(
            backgroundColor:
                Colors.transparent, // ✅ make background transparent
            elevation: 0,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (tasks.isEmpty) {
                        noTaskWarning(context);
                      } else {
                        deleteAllTaskWarning(context);
                      }
                    });
                    print("Delete All Button Pressed");
                  },
                  icon: const Icon(Icons.delete),
                ),
              ),
            ],
          ),
          drawer: drawer(icons: icons, titles: titles),

          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://tse2.mm.bing.net/th/id/OIP.q4Hn4agDhu4m-s7Ef76BKgHaEK?pid=ImgDet&w=184&h=103&c=7&dpr=1.3&o=7&rm=3',
                ),
                fit: BoxFit.cover, // makes the image cover the whole screen
              ),
            ),
            child: _buildHomeBody(
              textTheme,
              base,
              tasks,
            ), // 👈 your content on top
          ),
        );
      },
    );
  }

  /// Home Body ///
  Widget _buildHomeBody(
    TextTheme textTheme,
    BaseWidget base,
    List<Task> tasks,
  ) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          /// Custom App Bar ///
          Container(
            margin: const EdgeInsets.only(top: 60),
            width: double.infinity,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// Progress Indicator ///
                SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(
                    value: checkDoneTask(tasks) / valueOfIndicator(tasks),
                    backgroundColor: Colors.white,
                    valueColor: AlwaysStoppedAnimation(AppColors.primaryColor),
                    strokeWidth: 10,
                    strokeAlign: BorderSide.strokeAlignOutside,
                    strokeCap: StrokeCap.round,
                    trackGap: 50,
                  ),
                ),

                /// Space ///
                SizedBox(width: 25),

                /// Top Level Task Info ///
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppStr.mainTitle, style: textTheme.displayLarge),
                    SizedBox(height: 3),
                    Text(
                      "${checkDoneTask(tasks)} out of ${tasks.length} tasks has been completed",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// Divider ///
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Divider(thickness: 2, indent: 100,color: Colors.black,),
          ),

          /// Task List  ///
          SizedBox(
            width: double.infinity,
            height: 400,
            child: tasks.isNotEmpty
                ///When task list is not empty///
                ? ListView.builder(
                    itemCount: tasks.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      /// we are getting single task from list
                      var task = tasks[index];
                      return Dismissible(
                        direction: DismissDirection.horizontal,
                        onDismissed: (direction) {
                          setState(() {
                            base.dataStore.deleteTask(task: task);
                          });
                        },
                        key: Key(task.id),
                        background: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.delete, color: Colors.grey),
                            SizedBox(width: 10),
                            Text(
                              AppStr.deletedTask,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        child: TaskWidget(task: task),
                      );
                    },
                  )
                /// when task list is empty ///
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeInDown(
                        duration: Duration(milliseconds: 1000),
                        child: SizedBox(
                          height: 300,
                          width: 300,
                          child: Lottie.asset(
                            "assets/lotties/Task.json",
                            animate: tasks.isNotEmpty ? false : true,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      FadeInUp(
                        from: 30,
                        child: Text(
                          "All Tasks are deleted.\nPlease add new ones!",
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
