import 'package:beautilly/views/onBording_start.dart';
import 'package:beautilly/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBording extends StatefulWidget {
  @override
  _OnBordingStartState createState() => _OnBordingStartState();
}

class _OnBordingStartState extends State<OnBording> {
  final Constant constant = Constant();

  int _currentIndex = 0;
  final List<String> _images = [
    'assets/images/on1.png',
    'assets/images/on2.png',
    'assets/images/on3.png',
  ];

  void _nextImage() {
    setState(() {
      if (_currentIndex < _images.length - 1) {
        _currentIndex = (_currentIndex + 1) % _images.length;
      } else {
        // Navigate to the login page if on the last page
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (c) => OnBordingStart()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(_images[_currentIndex]),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.black87.withOpacity(0.5), // Adjusts background overlay
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Two Headings about Beauty
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
              // Indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_images.length, (index) {
                  bool isSelected = _currentIndex == index;
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 8.0),
                    width: isSelected ? 24.0 : 12.0,
                    height: 12.0,
                    decoration: BoxDecoration(
                      shape: isSelected ? BoxShape.rectangle : BoxShape.circle,
                      borderRadius: isSelected
                          ? BorderRadius.circular(6.0)
                          : null, // Only apply borderRadius if it's a rectangle
                      color: isSelected
                          ? constant.secondColor
                          : Colors.white.withOpacity(0.5),
                    ),
                  );
                }),
              ),
              // Button to Change Image or Get Started
              ElevatedButton(
                onPressed: _nextImage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: constant.primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 60.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Text(
                  _currentIndex == _images.length - 1
                      ? 'Get Started'
                      : 'Next Image',
                  style: GoogleFonts.manrope(
                    color: constant.whiteC,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
             
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to the login page
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (c) => OnBordingStart()));
                    },
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                        color: constant.secondColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}