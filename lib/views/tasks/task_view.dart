import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:todolist/main.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/utils/app_colors.dart';
import 'package:todolist/utils/app_str.dart';
import 'package:todolist/utils/constants.dart';
import 'package:todolist/views/tasks/components/date_time_selection.dart';
import 'package:todolist/views/tasks/components/rep_textfield.dart';
import 'package:todolist/views/tasks/widgets/task_view_app_bar.dart';
import 'package:intl/intl.dart';

class TaskView extends StatefulWidget {
  const TaskView({
    super.key,
    this.titleTaskController,
    this.descriptionTaskController,
    this.task,
  });

  final TextEditingController? titleTaskController;
  final TextEditingController? descriptionTaskController;
  final Task? task;

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  String? title;
  String? subTitle;
  DateTime? time;
  DateTime? date;

  late final TextEditingController _titleController;
  late final TextEditingController _descController;

  @override
  void initState() {
        // Now you can safely access widget.*
    _titleController = widget.titleTaskController ?? TextEditingController();
    _descController = widget.descriptionTaskController ?? TextEditingController();
    super.initState();
  }

  //Show selected time as string format //
  String showTime(DateTime? time){
    if(widget.task?.createdAtTime==null){
      if(time==null){
        return DateFormat('hh:mm a').format(DateTime.now()).toString();
      }
      else{
        return DateFormat('hh:mm a').format(time).toString();
      }
    }
    else{
      return DateFormat('hh:mm a').format(widget.task!.createdAtTime).toString();
    }
  }

  //Show selected date as string format //
  String showDate(DateTime? date){
    if(widget.task?.createdAtDate==null){
      if(date==null){
        return DateFormat.yMMMEd().format(DateTime.now()).toString();
      }
      else{
        return DateFormat.yMMMEd().format(date).toString();
      }
    }
    else{
      return DateFormat.yMMMEd().format(widget.task!.createdAtDate).toString();
    }
  }

  // show selected date as Dateformat  for init time
  DateTime showDateAsDateTime(DateTime? date){
    if(widget.task?.createdAtDate==null){
      if(date==null){
        return DateTime.now();
      }
      else{
        return date;
      }
    }
    else{
      return widget.task!.createdAtDate;
    }
  }

  /// If any task already exist return true otherwise false
  bool isTaskAlreadyExist() {
    if (widget.titleTaskController?.text != null &&
        widget.descriptionTaskController?.text != null) {
      return false; // Task exists, so we're editing (return false for "Add New Task")
    } else {
      return true; // No existing task, so we're creating new (return true for "Add New Task")
    }
  }


  /// Main Function for creating and updating the task ///
  dynamic isTaskAlreadyExistUpdateOtherwiseCreate(){
    //// here we update the current task
    if (widget.titleTaskController?.text != null && widget.descriptionTaskController?.text != null){
      try{
        widget.titleTaskController?.text = title!;
        widget.descriptionTaskController?.text = subTitle!;

        widget.task?.save();
        Navigator.pop(context);
      }
      catch(e){
        updateWarning(context);
      }
    }
    /// Here we create new task ///
    else{
      if(title!=null && subTitle!=null){
        var task =Task.create(
            title: title,
            subTitle: subTitle,
            createdAtTime: time,
            createdAtDate: date
          );

        /// we are adding new task in hive database using inherited widget ///
        BaseWidget.of(context).dataStore.addtask(task: task);
        Navigator.pop(context);
      }
      else{
        emptyWarning(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        appBar: const TaskViewAppBar(),

        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                /// Top Side Text ///
                _buildTopSideTexts(textTheme),

                /// Main Task View Activity ///
                _buildMainTaskViewActivity(textTheme, context),

                /// Bottom Side Buttons ///
                _buildBottomSideButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Bottom Side Buttons ///
  Widget _buildBottomSideButtons() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 100),
      child: Row(
        
        mainAxisAlignment: isTaskAlreadyExist()? MainAxisAlignment.center:MainAxisAlignment.spaceAround,
        children: [
          
          

          /// Add or Update Task
          MaterialButton(
            onPressed: () {
              isTaskAlreadyExistUpdateOtherwiseCreate();
              print("Current task is added");
            },
            minWidth: 150,
            height: 55,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: AppColors.primaryColor,
            child: Row(
              children: [
                Icon(isTaskAlreadyExist()? Icons.add_circle_outlined:Icons.update_sharp, color: Colors.white),
                const SizedBox(width: 5),
                Text(isTaskAlreadyExist()? AppStr.addNewTask:AppStr.updateCurrentTask, style: const TextStyle(color: Colors.white)),
              ],
            ),
          ),


          isTaskAlreadyExist()?
          Container():


          /// Delete Current Task Button
          MaterialButton(
            onPressed: () {
              widget.task?.delete();
              print("Current task is delete");
              Navigator.pop(context);
            },
            minWidth: 150,
            height: 55,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Colors.white,
            child: const Row(
              children: [
                Icon(Icons.close, color: AppColors.primaryColor),
                const SizedBox(width: 5),
                Text(
                  AppStr.deleteTask,
                  style: TextStyle(color: AppColors.primaryColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///Main Task View Activity///
  Widget _buildMainTaskViewActivity(TextTheme textTheme, BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              AppStr.titleOfTitleTextField,
              style: textTheme.headlineMedium,
            ),
          ),

          RepTextField(
            controller: _titleController,
            isDesc: false,
            onFieldSubmit: (String inputTitle) {
              title = inputTitle;
            },
            onChanged: (String inputTitle) {
              title = inputTitle;
            },
          ),
          const SizedBox(height: 10),
          RepTextField(
            controller: _descController,
            isDesc: true,
            onFieldSubmit: (String inputSubTitle) {
              subTitle = inputSubTitle;
            },
            onChanged: (String inputSubTitle) {
              subTitle = inputSubTitle;
            },
          ),

          /// Time Selection ///
          DateTimeSelectionWidget(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (_) {
                  return SizedBox(
                    height: 280,
                    child: TimePickerWidget(
                      initDateTime: showDateAsDateTime(time),
                      onChange: (_, __) {},
                      dateFormat: ("HH:mm"),
                      onConfirm: (dateTime, _) {
                        setState(() {
                          if (widget.task?.createdAtTime == null) {
                            time = dateTime;
                          } else {
                            widget.task!.createdAtTime = dateTime;
                          }
                          print(time);
                        });
                      },
                    ),
                  );
                },
              );
            },
            title: AppStr.timeString,
            time: showTime(time), 
            isTime: true,
          ),

          /// Date Selection ///
          DateTimeSelectionWidget(
            onTap: () {
              DatePicker.showDatePicker(
                context,
                initialDateTime: showDateAsDateTime(date),
                maxDateTime: DateTime(2030, 12, 31),
                minDateTime: DateTime.now(),
                onConfirm: (dateTime, _) {
                  setState(() {
                    if (widget.task?.createdAtDate == null) {
                      date = dateTime;
                    } else {
                      widget.task!.createdAtDate = dateTime;
                    }
                    print(date);
                  });
                },
              );
            },
            title: AppStr.dateString,
            time: showDate(date), 
            isTime: false,
          ),
        ],
      ),
    );
  }

  ///Top Side Text///
  Widget _buildTopSideTexts(TextTheme textTheme) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 80, child: Divider(thickness: 2)),
          RichText(
            text: TextSpan(
              text: isTaskAlreadyExist()
                  ? AppStr.addNewTask
                  : AppStr.updateCurrentTask,
              style: textTheme.titleLarge,
              children: const [
                TextSpan(
                  text: AppStr.taskStrnig,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 70, child: Divider(thickness: 2)),
        ],
      ),
    );
  }
}
