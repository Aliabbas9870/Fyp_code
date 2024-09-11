import 'package:beautilly/views/onBording.dart';
import 'package:beautilly/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final Constant constant = Constant();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (c) => OnBording())));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: constant.primaryColor,
      body: Center(
          child: Container(
        padding: EdgeInsets.only(left: 35),
        width: 250,
        // color: constant.whiteC,
        child: Stack(
          children: [
            Positioned(child: Image.asset("assets/images/Logo.png")),
            Positioned(
                left: 70,
                top: 26,
                child: Text(
                  "Beautilly",
                  style: GoogleFonts.cabin(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: constant.whiteC),
                ))
          ],
        ),
      )),
    );
  }
}
