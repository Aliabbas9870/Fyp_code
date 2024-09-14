import 'package:flutter/material.dart';
import 'package:fypapp/widgets/constant.dart';

class AboutView extends StatefulWidget {
  const AboutView({super.key});

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  final Constant constant = Constant();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text(
          "About",
          style: TextStyle(
              color: constant.whiteC,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        elevation: 20,
        backgroundColor: Color(0xff156778),
      ),
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/bgProfile.png",
                    ),
                    fit: BoxFit.cover)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      width: 120,
                      height: 148,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: Image.asset(
                              'assets/images/gobar.png',
                              width: 70,
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text("Gobar")
                        ],
                      )),
                  SizedBox(
                    height: 88,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        color: constant.whiteC,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 29),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "About Gobar",
                            style: TextStyle(
                                color: constant.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Gobar: The Best Solution for Online Barber Bookings"
                              "Want a more practical and efficient hair shaving experience? Gobar is the best solution for you! Gobar is an online barber booking application that makes"
                              " it easy for you to search, select and order haircut services easily and quickly.",
                              style: TextStyle(
                                  color: constant.primaryColor, fontSize: 15),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 6.9,
                          ),
                          Center(
                            child: Container(
                              height: 45,
                              width: MediaQuery.sizeOf(context).width / 4.9,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: constant.primaryColor),
                              child: Center(
                                child: Text(
                                  "Logout",
                                  style: TextStyle(
                                      color: constant.whiteC, fontSize: 17),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
