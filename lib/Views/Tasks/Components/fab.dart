import 'package:flutter/material.dart';
import '../../../Utils/color.dart';
import 'dart:developer';
import '../task_view.dart';

class Fab extends StatelessWidget {
  const Fab({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> TaskView()));
          log('Add Task');
        },
        child: Material(
          borderRadius: BorderRadius.circular(15),
          elevation: 20,
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(Icons.add, color: Colors.white, size: 30,),
          ),
        ),
      );
  
  }
}