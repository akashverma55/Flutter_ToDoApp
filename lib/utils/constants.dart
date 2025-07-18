import 'package:flutter/material.dart';
import 'package:ftoast/ftoast.dart';
import 'package:todolist/main.dart';
import 'package:todolist/utils/app_str.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

/// For Empty title and subtitle in textform field ///
dynamic emptyWarning(BuildContext context){
  return FToast.toast(
    context,
    msg: AppStr.oopsMsg,
    subMsg: "Please fill both field first!",
    corner: 20, //for round corners
    duration: 2000,
    padding: EdgeInsets.all(20)
  );
}

/// Nothing entered when user try to update or edit anything ///
dynamic updateWarning(BuildContext context){
  return FToast.toast(
    context,
    msg: AppStr.oopsMsg,
    subMsg: "You must edit the task then try to update it!",
    corner: 20, //for round corners
    duration: 3000,
    padding: EdgeInsets.all(20)
  );
}

/// For Empty title and subtitle in textform field ///
dynamic noTaskWarning(BuildContext context){
  return PanaraInfoDialog.showAnimatedGrow(
    context, 
    title: AppStr.oopsMsg,
    message: "There is no Task to Delete.\nTry adding some then try to delete it!", 
    buttonText: "Okay", 
    onTapDismiss: (){
      Navigator.pop(context);
    }, 
    panaraDialogType: PanaraDialogType.warning,
  );
}

/// Delete all the task form Hive Database ///
dynamic deleteAllTaskWarning(BuildContext context){
  return PanaraConfirmDialog.showAnimatedGrow(
    context, 
    title: AppStr.areYouSure,
    message: "Do you really want to delete all tasks? You will not be able to undo this action!", 
    confirmButtonText: "Yes", 
    cancelButtonText: "No", 
    onTapConfirm: (){
      BaseWidget.of(context).dataStore.box.clear();
      Navigator.pop(context);
    }, 
    onTapCancel: (){
      Navigator.pop(context);
    }, 
    panaraDialogType: PanaraDialogType.error,
    barrierDismissible: false
  );
}