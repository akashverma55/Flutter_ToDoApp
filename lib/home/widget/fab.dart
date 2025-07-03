import 'package:flutter/material.dart';
import 'package:todolist/Task/task.dart';

class floatingActionButton extends StatelessWidget {
  const floatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("FAB Pressed");
        Navigator.push(context, MaterialPageRoute(builder: (_) => Task()));
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
    );
  }
}