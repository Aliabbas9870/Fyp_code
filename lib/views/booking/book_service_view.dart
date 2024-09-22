import 'package:flutter/material.dart';
import 'package:fypapp/views/booking/date_get_widget.dart';
import 'package:fypapp/views/booking/specialList.dart';
import 'package:fypapp/views/booking/time_get_widget.dart';
import 'package:fypapp/widgets/bottomBar.dart';
import 'package:fypapp/widgets/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class BookServiceView extends StatefulWidget {
  const BookServiceView({super.key});

  @override
  State<BookServiceView> createState() => _BookServiceViewState();
}

class _BookServiceViewState extends State<BookServiceView> {
  final Constant constant = Constant();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constant.whiteC,

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: constant.whiteC,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (c) => BottomBarStart()));
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: constant.primaryColor,
                )),
            Text("Book Service",
                style: TextStyle(
                    color: constant.primaryColor, fontWeight: FontWeight.bold)),
            SizedBox()
          ],
        ),
        centerTitle: true,
        elevation: 20,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Our Specialist",
                        style: GoogleFonts.manrope(
                            fontSize: 18,
                            color: constant.primaryColor,
                            fontWeight: FontWeight.bold)),
                    Text("view all",
                        style: GoogleFonts.manrope(
                            fontSize: 16,
                            color: constant.primaryColor,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SpecialListWidgetBok(
                        imgPath: "assets/images/Sp1.png", title: "Ali Abas"),
                    SpecialListWidgetBok(
                        imgPath: "assets/images/SpG2.png", title: "Dr. Binya"),
                    SpecialListWidgetBok(
                        imgPath: "assets/images/SpG3.png", title: "Sn. Aqib"),
                    SpecialListWidgetBok(
                        imgPath: "assets/images/Sp4.png", title: "Rao Aqib"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DateTimeWidget(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TimeGetWidget(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Notes",
                    style: GoogleFonts.manrope(
                        fontSize: 18,
                        color: constant.primaryColor,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                      hintText: "Type your notes here",
                      border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                height: 110,
              )
            ],
          ),
        ),
      ),

      // botm shett

      bottomSheet: Container(
        height: 80,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Total (1 Service)",
                  style: TextStyle(color: constant.primaryColor, fontSize: 16),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '\$20 ',
                        style: TextStyle(
                            color: constant.primaryColor,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: '\$30',
                        style: TextStyle(
                          color: constant.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(right: 10),
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  border: Border.all(color: constant.primaryColor),
                  borderRadius: BorderRadius.circular(30)),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.message,
                    color: constant.primaryColor,
                  )),
            ),
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (c) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AlertDialog(
                            title: Text("Congrets"),
                            content: Column(
                              children: [
                                Text("Booking Successfuly booked"),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: 55,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: constant.primaryColor),
                                        child: Center(
                                            child: Text(
                                          "Ok",
                                          style: TextStyle(
                                              color: constant.whiteC,
                                              fontSize: 18),
                                        ))),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                          width: 65,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: constant.primaryColor),
                                          child: Center(
                                              child: Text(
                                            "Cancel",
                                            style: TextStyle(
                                                color: constant.whiteC,
                                                fontSize: 18),
                                          ))),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    });
              },
              child: Container(
                  margin: EdgeInsets.only(right: 10),
                  width: 130,
                  height: 60,
                  decoration: BoxDecoration(
                      color: constant.primaryColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Text(
                      "Checkout",
                      style: TextStyle(color: constant.whiteC, fontSize: 18),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
