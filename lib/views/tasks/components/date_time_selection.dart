import 'package:flutter/material.dart';

class DateTimeSelectionWidget extends StatelessWidget {
  const DateTimeSelectionWidget({super.key, required this.onTap, required this.title, required this.time, required this.isTime});

  final VoidCallback onTap;
  final String title;
  final String time;
  final bool isTime;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical:5),
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title, style: textTheme.headlineSmall),
            ),
            Container(
              margin: EdgeInsets.all(10),
              width:isTime?80:120,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade300,
              ),
              child: Center(
                child: Text(
                  time,
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}