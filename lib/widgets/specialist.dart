import 'package:flutter/material.dart';

class SpecialListWidget extends StatelessWidget {
  final String imgPath;
  final String title;

  SpecialListWidget({required this.imgPath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 133,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(imgPath,height: 99,width: 120,scale: 0.5,),
            SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 17),
            )
          ],
        ),
      ),
    );
  }
}
