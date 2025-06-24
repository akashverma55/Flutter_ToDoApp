import 'package:flutter/material.dart';

class DateTimeSelection extends StatelessWidget {
  const DateTimeSelection({super.key, required this.onTap,required this.title});

  final VoidCallback onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(20,20,20,0),
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                title,
                style: textTheme.headlineSmall,
              ),
            ),

            Container(
              width: 80,
              height: 35,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: Text(title)),
            ),
          ],
        ),
      ),
    );
  }
}
