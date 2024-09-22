import 'package:flutter/material.dart';
import 'package:fypapp/views/splash_view.dart';
import 'package:fypapp/widgets/constant.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  final Constant constant = Constant();
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      title: 'Beautilly',
      theme: ThemeData(
        fontFamily: GoogleFonts.cabin().fontFamily,
        colorScheme: ColorScheme.fromSeed(seedColor: constant.whiteC),
        useMaterial3: true,
      ),
      home: SplashView(),
    );
  }
}
