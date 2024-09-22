import 'package:flutter/material.dart';
import 'package:fypapp/widgets/constant.dart';

class TimeGetWidget extends StatefulWidget {
  const TimeGetWidget({super.key});

  @override
  State<TimeGetWidget> createState() => _TimeGetWidgetState();
}

class _TimeGetWidgetState extends State<TimeGetWidget> {
  final Constant constant = Constant();

  // store the selected time
  String? selectedTime;


  final List<String> times = [
    "8:00 AM",
    "9:30 AM",
    "11:00 AM",
    "12:30 PM",
    "2:00 PM",
    "3:00 PM",
    "4:00 PM"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Time",
          style: TextStyle(fontSize: 21),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: times.map((time) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedTime = time;
                  });
                },
                child: Container(
                  
                  width: 88,
                  height: 50,
                  margin: EdgeInsets.only(right: 8,top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    // Change color if the time is selected
                    border: Border.all(),
                    color: selectedTime == time
                        ? constant.primaryColor
                        : constant.whiteC, // Default
                  ),
                  child: Center(
                    child: Text(
                      time,
                      style: TextStyle(
                        color:
                            selectedTime == time ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
