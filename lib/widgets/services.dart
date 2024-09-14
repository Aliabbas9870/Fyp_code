import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Services extends StatelessWidget {
  final String title;
  final String imgPath;

  Services({required this.imgPath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          // backgroundColor:   Color(0xff156778),
          // backgroundImage: AssetImage(imgPath),
          child: Image.asset(imgPath),
          radius: 30.0, // Increase the radius to make the CircleAvatar larger
        ),
        SizedBox(height: 8.0), // Add some space between the avatar and text
        Text(title, style: GoogleFonts.manrope(
                              fontSize: 14,
                              color: Color(0xff156778),
                              fontWeight: FontWeight.w500)),
      ],
    );
  }
}
