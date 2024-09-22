import 'package:flutter/material.dart';
import 'package:fypapp/widgets/constant.dart';

class DateTimeWidget extends StatefulWidget {
  const DateTimeWidget({super.key});

  @override
  State<DateTimeWidget> createState() => _DateTimeWidgetState();
}

class _DateTimeWidgetState extends State<DateTimeWidget> {
  DateTime currentDate = DateTime.now();
  final Constant constant = Constant();
  DateTime? selectedDate;





  @override
  Widget build(BuildContext context) {
    // Calculate the Monday of the current week
    DateTime monday = currentDate
        .subtract(Duration(days: (currentDate.weekday - DateTime.monday) % 7));

    // List of days for the week starting from Monday
    List<DateTime> dates = List.generate(7, (index) {
      return monday.add(Duration(days: index));
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Date",
          style: TextStyle(fontSize: 21),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: _previousMonth,
              child: Icon(Icons.arrow_back_ios),
            ),
            Text("${_getMonthName(monday.month)}, ${monday.year}"),
            GestureDetector(
              onTap: _nextMonth,
              child: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: dates.map((date) {
              bool isSunday = date.weekday == DateTime.sunday;

              // Check if the date is today
              // bool isToday = date.year == currentDate.year &&
              //     date.month == currentDate.month &&
              //     date.day == currentDate.day;

              // Check if this date is selected
              bool isSelected = selectedDate != null &&
                  selectedDate!.day == date.day &&
                  selectedDate!.month == date.month &&
                  selectedDate!.year == date.year;
              return GestureDetector(
                onTap: (){
                   setState(() {
                  selectedDate=date;
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(left: 12, top: 12),
                  width: 55,
                  height: 80,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? constant.primaryColor
                        : isSunday
                            ? Colors.grey.withOpacity(0.5)
                            : const Color.fromARGB(255, 197, 197, 197),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _getWeekdayName(date.weekday),
                          style: TextStyle(
                            fontSize: 16,
                            color: isSelected
                                ? constant.whiteC
                                : isSunday
                                    ? Colors.black.withOpacity(0.5)
                                    : Colors.black,
                          ),
                        ),
                        Text(
                          date.day.toString(),
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color:    
                            
                          isSelected
                                ? constant.whiteC:
                             isSunday
                                ? Colors.black.withOpacity(0.1)
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        SizedBox(
          width: 12,
        )
      ],
    );
  }

  // Function to get the weekday name
  String _getWeekdayName(int weekday) {
    switch (weekday) {
      case DateTime.monday:
        return "Mon";
      case DateTime.tuesday:
        return "Tue";
      case DateTime.wednesday:
        return "Wed";
      case DateTime.thursday:
        return "Thu";
      case DateTime.friday:
        return "Fri";
      case DateTime.saturday:
        return "Sat";
      case DateTime.sunday:
        return "Sun";
      default:
        return "";
    }
  }

  // Function to get the month name
  String _getMonthName(int month) {
    List<String> months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    return months[month - 1];
  }

  // Function to go to the next month
  void _nextMonth() {
    setState(() {
      currentDate = DateTime(currentDate.year, currentDate.month + 1);
    });
  }

  // Function to go to the previous month
  void _previousMonth() {
    setState(() {
      currentDate = DateTime(currentDate.year, currentDate.month - 1);
    });
  }
}
