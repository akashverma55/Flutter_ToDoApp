import 'package:flutter/material.dart';
import 'package:ftoast/ftoast.dart';

//// For warning user for empty title or subtitle field.
Future<void> emptyWarning(BuildContext context){
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
Future<void> updateEmptyWarning(BuildContext context){
  return FToast.toast(
    context,
    msg: "Oops!",
    msgStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
    subMsg: "You must edit the tasks then try to update it",
    subMsgStyle: TextStyle(color: Colors.white, fontSize: 15), 
    corner: 20,
    duration: 3000,
    color: Colors.blue[900]!.withOpacity(0.5),
  );
}