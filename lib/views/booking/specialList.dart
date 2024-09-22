import 'package:flutter/material.dart';
import 'package:fypapp/widgets/constant.dart';

class SpecialListWidgetBok extends StatefulWidget {
  final String imgPath;
  final String title;

  SpecialListWidgetBok({required this.imgPath, required this.title});

  @override
  _SpecialListWidgetBokState createState() => _SpecialListWidgetBokState();
}

class _SpecialListWidgetBokState extends State<SpecialListWidgetBok> {
  bool isSelected = false;
  final Constant constant = Constant();


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
        
          width: 133,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(75),
            border: isSelected ? Border.all(color: constant.primaryColor, width: 3) : null,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // Image with blur effect when selected
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 90,
                    height: 89,
                    child: Stack(
                      children: [
                        ColorFiltered(
                          colorFilter: isSelected
                              ? ColorFilter.mode(
                                  Colors.black.withOpacity(0.3), BlendMode.srcATop)
                              : ColorFilter.mode(
                                  Colors.transparent, BlendMode.multiply),
                          child: Image.asset(widget.imgPath,
                              height: 89, width: 80, fit: BoxFit.cover),
                        ),
                        if (isSelected)
                          Positioned(
                            right: 8,
                            top: 8,
                            child: Icon(Icons.check_circle,
                                color: Colors.green, size: 24),
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5),
                // Text widget wrapped with flexible constraints
                Container(
                  width: 120, // Adding a fixed width to avoid unconstrained errors
                  child: Text(
                    widget.title,
                    style: TextStyle(fontSize: 17),
                    textAlign: TextAlign
                        .center, // Ensures the text is centered within the available space
                    softWrap: true, // Allows text to wrap within the box
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
