import 'package:flutter/material.dart';
import '../../../Utils/string.dart';

class RepTextField extends StatelessWidget {
  const RepTextField({
    super.key,
    required this.controller,
    this.isForDescription=false,
  });

  final TextEditingController controller;
  final bool isForDescription;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: ListTile(
        title: TextFormField(
          controller: controller,
          maxLines: !isForDescription ? 6:null,
          cursorHeight: !isForDescription ? 60:null,
          style:const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            border: isForDescription ? InputBorder.none:null,
            counter: Container(),
            hintText: isForDescription? AppStrings.addNote: "Add Title",
            prefixIcon: isForDescription
            ? const Icon(
              Icons.bookmark_border,
              color: Colors.grey,
            ):null,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade300
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade300
              ),
            ),
          ),
          onFieldSubmitted: (value){
        
          },
          onChanged: (value){
        
          },
        ),
      ),
    );
  }
}