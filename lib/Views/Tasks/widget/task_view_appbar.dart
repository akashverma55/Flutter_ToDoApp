import 'package:flutter/material.dart';

class TaskViewAppbar extends StatelessWidget implements PreferredSizeWidget{
  const TaskViewAppbar({super.key});
  @override
  Size get preferredSize => Size.fromHeight(150);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child:Padding(
        padding: const EdgeInsets.only(left:20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:const EdgeInsets.only(top:20),
              child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back, color: Colors.black)
              ),
            ),
          ],
        ),
      )
    );
  }

  
}