import 'package:flutter/material.dart';
import '../../../Utils/color.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({super.key});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: AnimatedContainer(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
        duration: const Duration(milliseconds: 600),
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ListTile(
          leading: GestureDetector(
            onTap: () {
              ///
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 600),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey, width: 2),
              ),
              child: Icon(Icons.check, color: Colors.white),
            ),
          ),

          ////Task Name
          title: const Padding(
            padding: EdgeInsets.only(top: 1),
            child: Text(
              "Done",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                // decoration: TextDecoration.lineThrough
              ),
            ),
          ),

          ////Task Description
          subtitle: const Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Description",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w300,
                  ),
                ),

                ////Date of Task
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 1, top: 1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Date",
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        Text(
                          "SubDate",
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
