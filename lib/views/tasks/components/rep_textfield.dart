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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isDesc ?
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Give A Description Of The Task!🧐",
                style: TextStyle(color: Colors.deepPurple, fontSize: 16),
              ),
            ):
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "What Are You Planning?🥳",
                style: TextStyle(color: Colors.deepPurple, fontSize: 16),
              ),
            ),  
          ListTile(
            title: TextFormField(
              controller: controller,
              maxLines: isDesc? 2:1,
              cursorHeight: 20,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: isDesc? "Describe Your Task Here..." : "Enter Your Task Here...",
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: isDesc? Icon(Icons.description,color: Colors.blue,) : Icon(Icons.title,color: Colors.blue),
                
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                    borderRadius: BorderRadius.circular(10)
                  ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.deepPurple,
                    ),
                    borderRadius: BorderRadius.circular(10)
                  ),
              ),
              onFieldSubmitted: onFieldSubmit,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
