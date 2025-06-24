import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:todolist/Utils/color.dart';
import 'package:todolist/Utils/string.dart';
import 'package:todolist/Views/Tasks/widget/task_view_appbar.dart';
import 'Components/rep_text.dart';
import 'Components/datetime.dart';


class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      ///Task View AppBar
      appBar: TaskViewAppbar(),

      ///Body of the task view
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ///Top side texts
              _buildTopSideTexts(textTheme),


              ///
              _buildMainTaskViewActivity(textTheme, context),
 

              ////Bottom Side button
              buildBottomButtons()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBottomButtons() {
    return Padding(
              padding:EdgeInsets.only(bottom:20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ////Delete current task button
                  MaterialButton(
                    onPressed: (){
                      log("Delete current task from database");
                    },
                    color: Colors.grey.shade100,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    minWidth: 150,
                    height: 55,
                    child: Row(
                      children: [
                        Icon(Icons.close, color: AppColors.primaryColor),
                        SizedBox(width:5),
                        const Text(
                          AppStrings.deleteTask,
                          style: TextStyle(color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                  ),

                  ///Add or Update Button
                  MaterialButton(
                    onPressed: (){
                      log("Added new task to database");
                    },
                    color: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    height: 55,
                    minWidth: 150,
                    child: const Text(
                      AppStrings.addTaskString,
                      style: TextStyle(color: Colors.white)
                    )
                  )
                ]
              )
            );
  }

  Widget _buildMainTaskViewActivity(TextTheme textTheme, BuildContext context) {
    return SizedBox(
              height: 530,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      AppStrings.titleofTitleTextField,
                      style: textTheme.headlineMedium,
                    ),
                  ),

                  //// Title TextField
                  RepTextField(
                    controller: _titleController
                  ),


                  ////Description TextField
                  RepTextField(
                    controller: _descriptionController,
                    isForDescription: true,
                  ),

                  ////Time Selection
                  DateTimeSelection(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (_) => SizedBox(
                          height: 254,
                          child: TimePickerWidget(
                            onChange: (_, __) {},
                            dateFormat: 'HH:mm',
                            onConfirm: (dateTime, _) {
                              ///dateTime is a DateTime object
                              print(dateTime);
                            },
                          ),
                        ),
                      );
                    }, 
                    title: AppStrings.timeString,
                  ),


                  ////Date Selection
                  DateTimeSelection(
                    onTap: () {
                      DatePicker.showDatePicker(
                        context,
                        maxDateTime: DateTime(2030,4,5),
                        minDateTime: DateTime.now(),
                        initialDateTime: DateTime.now(),
                        onConfirm: (dateTime,_){
                          print(dateTime);
                        }
                      );
                    }, 
                    title: AppStrings.dateString,
                  ),
                ],
              ),
            );
  }

  Widget _buildTopSideTexts(TextTheme textTheme) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 100, child: Divider(thickness: 2)),
            RichText(
              text: TextSpan(
                text: AppStrings.addNewTask,
                style: textTheme.titleLarge,
                children: [
                  TextSpan(
                    text: AppStrings.taskString,
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 100, child: Divider(thickness: 2)),
          ],
        ),
      ),
    );
  }
}

