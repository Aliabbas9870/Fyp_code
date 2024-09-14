
import 'package:flutter/material.dart';
import 'package:fypapp/auth/login_auth.dart';
import 'package:fypapp/widgets/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBordingStart extends StatefulWidget {
  @override
  _OnBordingStartState createState() => _OnBordingStartState();
}

class _OnBordingStartState extends State<OnBordingStart> {
  final Constant constant = Constant();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87.withOpacity(.4),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/on3.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.black87.withOpacity(0.4),
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 132,
              ),
              // Two Headings about Beauty
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 90,
                  ),
                  Text(
                    "Beauty Redefined",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Discover a new level of beauty with our products.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 70.0),

              // Google Sign In Button
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: constant.whiteC,
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/g.png',
                      width: 30,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text('Google',
                        style: GoogleFonts.manrope(
                            color: constant.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
              SizedBox(height: 20.0),

              // Email Sign In Button
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: constant.primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.email,
                      color: constant.whiteC,
                      size: 30,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text('Email',
                        style: GoogleFonts.manrope(
                            color: constant.whiteC,
                            fontSize: 16,
                            fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
              SizedBox(height: 40.0),

              // Already have an account? Sign in
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?",
                        style: GoogleFonts.manrope(
                          color: constant.whiteC,
                          fontSize: 16,
                        )),
                    TextButton(
                      onPressed: () {
                        // Navigate to the login page
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (c) => LoginAuth()));
                      },
                      child: Text(
                        "Sign in",
                        style: GoogleFonts.manrope(
                          color: constant.secondColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
