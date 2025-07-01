import 'package:flutter/material.dart';

class home_appbar extends StatelessWidget {
  const home_appbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
        // color: Colors.blueGrey,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //// Progress Bar ////
          SizedBox(
            height: 50,
            width: 50,
            child: const CircularProgressIndicator(
              value: 3 / 5,
              strokeWidth: 10,
              color: Colors.black,
              backgroundColor: Colors.grey,
            ),
          ),
    
          //// My Task & Completed Tasks ////
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //// My Tasks ////
              Text(
                "My Tasks",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
    
              //// Completed Tasks ////
              Text(
                "2 out of 5 tasks completed",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class divider extends StatelessWidget {
  const divider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 2.0,
      indent: 20,
      endIndent: 20,
      color: Colors.black,
    );
  }
}