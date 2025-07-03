import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';

class Task extends StatefulWidget{
  const Task({super.key});

  @override
  State<Task> createState() => _Task();
}

class _Task extends State<Task>{
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: ()=> FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 10,
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
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
              
                RepTextField(Controller: titleController,desc:false),
            
                RepTextField(Controller: descriptionController,desc:true),
            
                DateTimeWidget(isDate: false),
            
                DateTimeWidget(isDate: true),
            
                Padding(
                  padding: EdgeInsetsGeometry.only(top:120, bottom: 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MaterialButton(
                        onPressed: (){
                          
                        },
                        minWidth: 150,
                        height: 50,
                        color: Colors.blueAccent,
                        elevation: 10,
                        splashColor: Colors.blue[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(10)
                        ),
                        child: Text(
                          "Add Task 😁",
                          style: TextStyle(color: Colors.white,fontSize:16),
                        ),
                      ),
                      MaterialButton(
                        onPressed: (){
                          
                        },
                        minWidth: 150,
                        height: 50,
                        color: Colors.blue[100],
                        elevation: 10,
                        splashColor: Colors.lightBlueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(10)
                        ),
                        child: Text(
                          "Cancel",
                          style: TextStyle(color: Colors.blueAccent,fontSize:16),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}

class DateTimeWidget extends StatelessWidget {
  const DateTimeWidget({
    super.key,
    required this.isDate,
  });

  final bool isDate;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        isDate?
        DatePicker.showDatePicker(
          context,
          maxDateTime: DateTime(2030,12,31),
          minDateTime: DateTime.now(),
          onConfirm: (dateTime,_){
            ////on confirm it will show on UI and store in variable
          }
        ):
        showModalBottomSheet(
          context: context, 
          builder: (_)=>SizedBox(
            height: 280,
            child: TimePickerWidget(
              onChange: (_,_){   ////on change it will show on UI and store in variable

              },
              dateFormat: 'HH:mm',
              onConfirm: (dateTime,_){ ////on enter it will confirm the variable
                print(dateTime);
              },
            ),
          )
        );
      },
      child: Container(
        margin: EdgeInsets.only(left: 60,right: 60, top: 20),
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.blue[200],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2,color: Colors.grey)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              isDate?
              "Date":"Time",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            isDate?
            Icon(Icons.calendar_month_outlined):Icon(Icons.timer_outlined)
          ],
        ),
      ),
    );
  }
}

class RepTextField extends StatelessWidget {
  const RepTextField({
    super.key,
    required this.Controller,
    required this.desc,
  });

  final TextEditingController Controller;
  final bool desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            desc ?
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Give A Description Of The Task!🧐",
                style: TextStyle(color: Colors.deepPurple, fontSize: 16),
              ),
            ):
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "What Are You Planning?🥳",
                style: TextStyle(color: Colors.deepPurple, fontSize: 16),
              ),
            ),
            ListTile(
              title: TextFormField(
                controller: Controller,
                maxLines: desc? 2:1,  
                cursorHeight: 20,
                onFieldSubmitted: (value){}, ////on clicking enter key it will submit the form and move to next field.
                onChanged: (value){},  ////on changing the value in the textfield it will process each time.
                style: TextStyle(fontSize: 18, color: Colors.black),
                decoration: InputDecoration(
                  prefixIcon: desc ? Icon(Icons.description,color: Colors.blue,) : Icon(Icons.title,color: Colors.blue),
                  hintText: desc?"Describe Your Task Here..." : "Enter Your Task Here...",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.deepPurple,
                    ),
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),                  
              )
            )
          ],
        ),
      ),
    );
  }
}