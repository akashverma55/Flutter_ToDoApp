import 'package:flutter/material.dart';

class Task extends StatefulWidget{
  const Task({super.key});

  @override
  State<Task> createState() => _Task();
}

class _Task extends State<Task>{
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Icon(Icons.arrow_back),
        backgroundColor: Colors.blue,
        elevation: 10,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 100,   ////This decides the length of the divider.
                    child: Divider(
                      color: Colors.black,
                      thickness: 2,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Add New ",
                      style: TextStyle(fontSize: 35),
                      children: [
                        TextSpan(
                          text: "Task", 
                          style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)
                        )
                      ]
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Divider(
                      color: Colors.black,
                      thickness: 2,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),

            Container(
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "What Are You Planning?",
                    style: TextStyle(color: Colors.red),
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Enter Your Task Title Here...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),

                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}