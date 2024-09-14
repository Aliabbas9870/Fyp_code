import 'package:flutter/material.dart';

class SearchInterest extends StatelessWidget {
  final String imgPath;
  final String title;

  SearchInterest({required this.imgPath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 133,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Color(0xffE1F5FA)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(imgPath),
            // SizedBox(width: 5,),
            Text(title)
          ],
        ),
      ),
    );
  }
}
