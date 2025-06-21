import 'package:flutter/rendering.dart';
import 'package:todolist/Utils/color.dart';
import '../../extensions/space_exs.dart';
import 'widget/fab.dart';
import 'package:flutter/material.dart';
import '../../Utils/string.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,

      floatingActionButton: Fab(),
      body: SizedBox(
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
                      valueColor: AlwaysStoppedAnimation(
                        AppColors.primaryColor,
                      ),
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
                      Text(AppStrings.maintitle, style: textTheme.displayLarge),
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
              padding: EdgeInsets.only(top: 100.0),
              child: Divider(thickness: 2, indent: 100),
            ),

            //Tasks List
            Expanded(
              child: SizedBox(
                width: double.infinity,
                height: 745,
                child: ListView.builder(
                  itemCount: 20,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return AnimatedContainer(
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                      duration: const Duration(milliseconds: 600),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey,width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0,4)
                          )
                        ],
                      ),
                      child: ListTile(
                        leading: GestureDetector(
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 600),
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey, width: 2)
                            ),
                            child: Icon(Icons.check,color: Colors.white),
                          ),
                        ),

                        ////Task Name
                        title: const Text(
                          "Done", style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500,
                            // decoration: TextDecoration.lineThrough
                          ),
                        ),

                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
