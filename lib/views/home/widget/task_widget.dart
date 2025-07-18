import 'package:flutter/material.dart';
import 'package:todolist/main.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/utils/app_colors.dart';
import 'package:todolist/views/tasks/task_view.dart';
import 'package:intl/intl.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({
    super.key,
    required this.task
  });

  final Task task;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {

  TextEditingController textEditingControllerForTitle = TextEditingController();
  TextEditingController textEditingControllerForSubTitle = TextEditingController();

  @override
  void initState(){
    textEditingControllerForTitle.text = widget.task.title;
    textEditingControllerForSubTitle.text = widget.task.subTitle;
    super.initState();
  }

  @override
  void dispose(){
    textEditingControllerForTitle.dispose();
    textEditingControllerForSubTitle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=> BaseWidget(TaskView(
          titleTaskController: textEditingControllerForTitle,
          descriptionTaskController: textEditingControllerForSubTitle,
          task: widget.task,
        ))));
        print("List Is Clicked");
      },
      child: AnimatedContainer(
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 4),
              blurRadius: 10,
            ),
          ],
          color:widget.task.isCompleted? Color.fromARGB(154,119,144,229): Colors.white,
        ),
        duration: Duration(milliseconds: 600),
        child: ListTile(
          ///Check Icon Box///
          leading: GestureDetector(
            onTap: () {
              widget.task.isCompleted=!widget.task.isCompleted;
              widget.task.save();
              print("CheckBox Clicked");
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              decoration: BoxDecoration(
                color:widget.task.isCompleted? AppColors.primaryColor:Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey, width: .8),
              ),
              child: const Icon(Icons.check, color: Colors.white),
            ),
          ),
      
          ///Title in Task List
          title: Text(
            textEditingControllerForTitle.text,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              decoration: widget.task.isCompleted? TextDecoration.lineThrough:null
            ),
          ),
      
          ///Subtitle in task list///
          subtitle: Text(
            textEditingControllerForSubTitle.text,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w300,
              decoration: widget.task.isCompleted? TextDecoration.lineThrough:null
            ),
          ),
      
          ///Date & Time & Delete Icon///
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    DateFormat("HH:mm a").format(widget.task.createdAtTime)
                  ),
                  Text(
                    DateFormat.yMMMd().format(widget.task.createdAtDate)
                  ),
                ],
              ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () {
                  widget.task.delete();
                  print("Delete icon clicked");
                },
                icon: Icon(Icons.delete),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
