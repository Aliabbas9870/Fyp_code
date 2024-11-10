import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:fypapp/views/splash_view.dart';
import 'package:fypapp/widgets/constant.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
    Gemini.init(apiKey: "AIzaSyDf3GSMQjwCJuRNItySQM7DZ8Igk3F_vcs");
  runApp(MyApp()); 
}
class MyApp extends StatelessWidget {
  final Constant constant = Constant();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( 
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











