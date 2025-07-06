import 'package:flutter/material.dart';
import 'package:ftoast/ftoast.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:todolist/main.dart';

//// For warning user for empty title or subtitle field.
dynamic emptyWarning(BuildContext context){
  return FToast.toast(
    context,
    msg: "Oops!",
    msgStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
    subMsg: "Please fill all the fields.",
    subMsgStyle: TextStyle(color: Colors.white, fontSize: 15), 
    corner: 20,
    duration: 2000,
    color: Colors.blue[900]!.withOpacity(0.5),
  );
}


//// For warning user for empty title or subtitle field during editing task.
dynamic updateEmptyWarning(BuildContext context){
  return FToast.toast(
    context,
    msg: "Oops!",
    msgStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
    subMsg: "You must edit the tasks then try to update it",
    subMsgStyle: TextStyle(color: Colors.white, fontSize: 15), 
    corner: 20,
    duration: 5000,
    color: Colors.blue[900]!.withOpacity(0.5),
  );
}


//No Task warning
dynamic noTaskWarning(BuildContext context){
  return PanaraInfoDialog.showAnimatedGrow(
    context,
    title: "Oops",
    textColor: Colors.redAccent,
    message: "There is no Task for Delete!\nTry adding some and then try to delete it!",
    buttonText: "Okay",
    onTapDismiss: (){
      Navigator.pop(context);
    },
    panaraDialogType: PanaraDialogType.warning,
  );
}

dynamic deleteAllTaskWarning(BuildContext context){
  return PanaraConfirmDialog.show(
    context,
    title: "Are You Sure?",
    message: "Do you want to delete all Tasks?\nThis action can't be undone!",
    confirmButtonText: "Yes",
    cancelButtonText: "Cancel",
    onTapCancel: (){
      Navigator.pop(context);
    },
    onTapConfirm: (){
      BaseWidget.of(context).datastore.deleteAllTask();
      Navigator.pop(context);
    }, 
    panaraDialogType: PanaraDialogType.warning,
    //You cannot tap outside dialog box to dismiss it.
    barrierDismissible: false,
  );
}

