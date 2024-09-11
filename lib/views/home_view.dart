import 'package:beautilly/widgets/constant.dart';
import 'package:beautilly/widgets/fellow.dart';
import 'package:beautilly/widgets/services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final Constant constant = Constant();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 13, top: 15),
        child: Padding(
          padding: EdgeInsets.only(top: 20, left: 5, right: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 9,
                ),
                Container(
                  height: size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            // mainAxisAlignment:
                            // MainAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("Hello, ",
                                      style: GoogleFonts.manrope(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold)),
                                  Text("Ali Abbas",
                                      style: GoogleFonts.manrope(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Text(
                                  "Find the service you want, and treat yourself",
                                  style: GoogleFonts.manrope(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                    color: constant.primaryColor,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Icon(
                                  Icons.search,
                                  color: constant.whiteC,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 108,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/homSlidBg.png",
                                ),
                                fit: BoxFit.cover)),
                        child: Container(
                          height: 78,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 20),
                                    child: Container(
                                      width: 166,
                                      child: Text(
                                          "Look more beautiful and save more discount",
                                          style: GoogleFonts.manrope(
                                            fontSize: 14,
                                            color: constant.whiteC,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                    height: 90,
                                    width: 110,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(12),
                                            bottomRight: Radius.circular(12)),
                                        color: Color(0xffFFF9E5)),
                                    child: Center(
                                      child: Text("Get offer now!",
                                          style: GoogleFonts.manrope(
                                            fontSize: 14,
                                            color: Color(0xffF98600),
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                  )),
                                  SizedBox(
                                    height: 7,
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0,vertical: 5),
                                child: Container(
                                  width: 88,
                                  height: 84,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Center(
                                      child: Text("Up To 50%",
                                          style: GoogleFonts.manrope(
                                              fontSize: 24,
                                              color: constant.whiteC,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Color(0xffF98600)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("What do you want to do?",
                          style: GoogleFonts.manrope(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 12,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Services(
                              imgPath: "assets/images/on2.png",
                              title: "Hair",
                            ),
                          ),
                          Container(
                            child: Services(
                              imgPath: "assets/images/on2.png",
                              title: "Hair",
                            ),
                          ),
                          Container(
                            child: Services(
                              imgPath: "assets/images/on2.png",
                              title: "Hair",
                            ),
                          ),
                          Container(
                            child: Services(
                              imgPath: "assets/images/on2.png",
                              title: "Hair",
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 12,
                      ),

                      // servicess //////
                      //         ///

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Services(
                              imgPath: "assets/images/on2.png",
                              title: "Hair",
                            ),
                          ),
                          Container(
                            child: Services(
                              imgPath: "assets/images/on2.png",
                              title: "Hair",
                            ),
                          ),
                          Container(
                            child: Services(
                              imgPath: "assets/images/on2.png",
                              title: "Hair",
                            ),
                          ),
                          Container(
                            child: Services(
                              imgPath: "assets/images/on2.png",
                              title: "Hair",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text("Salon you follow",
                          style: GoogleFonts.manrope(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                              SizedBox(height: 12,),

                      SingleChildScrollView(
                        scrollDirection:Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            
                            Fellow(imgPath: "assets/images/on2.png"),
                            SizedBox(width: 12,),
                            Fellow(imgPath: "assets/images/on2.png"),
                            SizedBox(width: 12,),

                            Fellow(imgPath: "assets/images/on2.png"),
                            SizedBox(width: 12,),

                            Fellow(imgPath: "assets/images/on2.png"),
                            SizedBox(width: 12,),

                            Fellow(imgPath: "assets/images/on2.png"),
                            SizedBox(width: 12,),

                            Fellow(imgPath: "assets/images/on2.png"),
                            SizedBox(width: 12,),

                          
                          
                          ],
                        ),
                      ),
                      SizedBox(height: 12,),
                      Text("Featured Salon",style: GoogleFonts.manrope(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold))
                    ],
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
