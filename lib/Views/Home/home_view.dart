import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'Components/slider_drawer.dart';
import 'package:lottie/lottie.dart';
import 'package:todolist/Utils/color.dart';
import 'Components/fab.dart';
import 'package:flutter/material.dart';
import '../../Utils/string.dart';
import 'Widget/task_widget.dart';
import 'package:animate_do/animate_do.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  GlobalKey<SliderDrawerState> drawkey = GlobalKey<SliderDrawerState>();

  bool isOpen = false;
  final List<int> testing = [1];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor: Colors.white,
  floatingActionButton: Fab(),
  body: SliderDrawer(
    key: drawkey,
    isDraggable: false,
    animationDuration: 500,
    appBar: SliderAppBar(
      config: SliderAppBarConfig(
        title: const SizedBox(),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            setState(() {
              testing.clear();
            });
          },
        ),
      ),
    ),
    slider: Slider_Drawer(),
    child: _buildHomeBody(Theme.of(context).textTheme),
  ),
);

  }

  //// Build Home Body
  Widget _buildHomeBody(TextTheme textTheme) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          //AppBar
          Container(
            margin: EdgeInsets.only(top: 40),
            width: double.infinity,
            height: 100,
            color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ///Progress Indicator
                SizedBox(
                  width: 25,
                  height: 25,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(AppColors.primaryColor),
                    value: 1 / 3,
                    backgroundColor: Colors.grey,
                  ),
                ),

                SizedBox(width: 20),

                ///Appbar Title
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.maintitle,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "1 of 3 tasks completed.",
                      style: textTheme.titleMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),

          //Divider
          const Padding(
            padding: EdgeInsets.only(top: 60.0),
            child: Divider(thickness: 2, indent: 100),
          ),

          //Tasks List
          Expanded(
            child: SizedBox(
              width: double.infinity,
              height: 745,

              //// If Task list is not Empty then show this widget
              child: testing.isNotEmpty
                  ? ListView.builder(
                      itemCount: testing.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          direction: DismissDirection.horizontal,
                          onDismissed: (_) {
                            ///Task will be deleted from Database
                            setState(() {
                              testing.removeAt(index);
                            });
                          },
                          background: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.delete_forever_outlined,
                                color: Colors.red,
                                size: 30,
                              ),
                              SizedBox(width: 10),
                              Text(
                                AppStrings.deletedTask,
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                          key: Key(index.toString()),
                          child: const TaskWidget(),
                        );
                      },
                    )
                  //// Tasklist is empty then show this widget
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //// Lottie Animation
                        FadeIn(
                          child: SizedBox(
                            height: 200,
                            width: 200,
                            child: Lottie.asset(
                              "assets/lotties/Lego.json",
                              animate: testing.isNotEmpty ? false : true,
                            ),
                          ),
                        ),

                        //// Done All Tasks Message
                        FadeInUp(child: const Text(AppStrings.doneAllTask)),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
