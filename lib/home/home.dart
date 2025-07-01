import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'widget/home_appbar.dart';
import 'widget/drawer.dart';
import 'widget/fab.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<int> test = [1, 2, 3];

  List<IconData> icons = [
    CupertinoIcons.home,
    CupertinoIcons.person_fill,
    CupertinoIcons.settings,
    CupertinoIcons.info_circle_fill
  ];
  List<String> titles = [
    "Home","Profile","Settings","Details"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //// App Bar ////
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                test.clear();
              });
              print("Delete All Button Pressed");
            }, 
            icon: const Icon(Icons.delete)
          )
        ],
      ),
      drawer: drawer(icons: icons, titles: titles),

      //// Body ////
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            //// Home AppBar ////
            home_appbar(),

            const SizedBox(height: 10),

            //// Divider ////
            divider(),

            //// List View ////
            Expanded(
              child: test.isNotEmpty

                  //// If there is any data in the list, show this List Builder////
                  ? listBuilder()


                    //// if there is no data in the list, show this Animation and text////
                  : animation(),
            ),
          ],
        ),
      ),

      //Floating Action Button
      floatingActionButton: floatingActionButton(),
    );
  }

  Column animation() {
    return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeIn(
                        child: SizedBox(
                          width: 250,
                          height: 250,
                          child: Lottie.asset(
                            "lotties/Task.json",
                            animate: test.isNotEmpty ? false : true,
                          ),
                        ),
                      ),
                      FadeInUp(
                        from: 30,
                        child: Text(
                          "All Tasks are deleted.\nPlease add new ones!",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  );
  }

  ListView listBuilder() {
    return ListView.builder(
                    itemCount: test.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      final item = test[index];
                      return Dismissible(
                        key: ValueKey(item),
                        direction: DismissDirection.horizontal,
                        onDismissed: (_) {
                          setState(() {
                            test.remove(item);
                          });
                        },
                        background: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.delete, size: 30, color: Colors.blue),
                            SizedBox(width: 10),
                            Text(
                              "Task Deleted",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                        child: GestureDetector(
                          onTap: () {
                            print("List Item Pressed");
                          },
                          child: AnimatedContainer(
                            margin: EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 10,
                            ),
                            duration: Duration(milliseconds: 500),
                            decoration: BoxDecoration(
                              color: Colors.blueAccent.withOpacity(0.5),
                              border: Border.all(
                                color: Colors.blue,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: ListTile(
                              //// Checkbox ////
                              leading: GestureDetector(
                                onTap: () {
                                  print("Checkbox Pressed");
                                },
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 500),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black54,
                                  ),
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  ),
                                ),
                              ),

                              //// Title ////
                              title: const Text('Task Completed'),

                              //// Subtitle ////
                              subtitle: const Text(
                                'This is a completed task.',
                              ),

                              //// Start Date & End Date ////
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.end,
                                    children: const [
                                      Text(
                                        'Start: 2025-06-01',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Text(
                                        'End: 2025-06-30',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 12),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.delete),
                                    color: Colors.black54,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
  }
}

