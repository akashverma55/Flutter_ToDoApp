import 'package:flutter/material.dart';
import 'package:todolist/main.dart';
import 'package:todolist/utils/app_colors.dart';
import 'package:todolist/views/tasks/task_view.dart';

class Fab extends StatelessWidget {
  const Fab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius:BorderRadius.circular(10),
      child: Container(
        width:50,
        height:50,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=> BaseWidget(TaskView(
              titleTaskController: null,
              descriptionTaskController: null,
              task:null,
            ))));
            print("Add Icon Clicked");
          },
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}