import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Main(), debugShowCheckedModeBanner: false);
  }
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //// App Bar ////
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.delete))],
      ),
      drawer: Drawer(backgroundColor: Colors.blueAccent),

      //// Body ////
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            //// Home AppBar ////
            Container(
              height: 90,
              width: double.infinity,
              decoration: BoxDecoration(
                // color: Colors.blueGrey,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //// Progress Bar ////
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: const CircularProgressIndicator(
                      value: 3 / 5,
                      strokeWidth: 10,
                      color: Colors.black,
                      backgroundColor: Colors.grey,
                    ),
                  ),

                  //// My Task & Completed Tasks ////
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //// My Tasks ////
                      Text(
                        "My Tasks",
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      //// Completed Tasks ////
                      Text(
                        "2 out of 5 tasks completed",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            //// Divider ////
            const Divider(
              thickness: 2.0,
              indent: 20,
              endIndent: 20,
              color: Colors.black,
            ),

            //// List View ////
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                        print("List Item Pressed");
                    },
                    child: AnimatedContainer(
                      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      duration: Duration(milliseconds: 500),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent.withOpacity(0.5),
                        border: Border.all(color: Colors.blue, width: 2),
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
                          onTap: (){
                              print("Checkbox Pressed");
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black54
                            ),
                            child: Icon(Icons.check,color:Colors.white,)
                          ),
                        ),
                    
                    
                    
                      //// Title ////
                        title: const Text('Task Completed'),
                      
                    
                    
                    
                      //// Subtitle ////
                        subtitle: const Text('This is a completed task.'),
                    
                    
                    
                      //// Start Date & End Date ////
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
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
                              onPressed: () {
                                
                              }, 
                              icon: Icon(Icons.delete), color: Colors.black54,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      //Floating Action Button
      floatingActionButton: GestureDetector(
        onTap: () {
          print("FAB Pressed");
        },
        child: Material(
          elevation: 20,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueGrey,
            ),
            child: Center(child: Icon(Icons.add, color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
