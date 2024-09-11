import 'package:flutter/material.dart';

class Fellow extends StatelessWidget {
  final String imgPath;

  Fellow({required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor:   Color(0xff156778),
          backgroundImage: AssetImage(imgPath),
          radius: 30.0, // Increase the radius to make the CircleAvatar larger
        ),
        
      ],
    );
  }
}
