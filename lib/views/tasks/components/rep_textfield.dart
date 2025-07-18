import 'package:flutter/material.dart';
import 'package:todolist/utils/app_str.dart';

class RepTextField extends StatelessWidget {
  const RepTextField({
    super.key,
    required this.controller,
    required this.isDesc, 
    required this.onFieldSubmit, 
    required this.onChanged
  });

  final TextEditingController controller;
  final Function(String)? onFieldSubmit;
  final Function(String)? onChanged;
  final bool isDesc;
 
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: ListTile(
        title: TextFormField(
          controller: controller,
          maxLines: isDesc? 2:6,
          cursorHeight: 60,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintText: isDesc? AppStr.addNote: "Add Title",
            hintStyle: TextStyle(color: Colors.grey),
            prefixIcon: isDesc? Icon(Icons.bookmark):null,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
          ),
          onFieldSubmitted: onFieldSubmit,
          onChanged: onChanged,
        ),
      ),
    );
  }
}