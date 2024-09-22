import 'package:flutter/material.dart';
import 'package:fypapp/widgets/constant.dart';
import 'package:fypapp/widgets/feature.dart';
import 'package:fypapp/widgets/fellow.dart';
import 'package:fypapp/widgets/near_by_offer.dart';
import 'package:fypapp/widgets/search_interest.dart';
import 'package:fypapp/widgets/services.dart';
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
        height: double.infinity,
        margin: EdgeInsets.only(left: 5, top: 15),
        child: Padding(
          padding: EdgeInsets.only(top: 20, left: 5, right: 5),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 9,
                ),
                Container(
                  // height: size.height,
                  // height: double.infinity,

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
                                        horizontal: 10.0, vertical: 20),
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
                                    height: 98,
                                    width: 120,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(20),
                                            topLeft: Radius.circular(12),
                                            bottomLeft: Radius.circular(20),
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
                                    horizontal: 10.0, vertical: 5),
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
                              imgPath: "assets/images/hr.png",
                              title: "Haircut",
                            ),
                          ),
                          Container(
                            child: Services(
                              imgPath: "assets/images/nail.png",
                              title: "Nails",
                            ),
                          ),
                          Container(
                            child: Services(
                              imgPath: "assets/images/facial.png",
                              title: "Facial",
                            ),
                          ),
                          Container(
                            child: Services(
                              imgPath: "assets/images/coloring.png",
                              title: "Coloring",
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
                              imgPath: "assets/images/spa.png",
                              title: "Spa",
                            ),
                          ),
                          Container(
                            child: Services(
                              imgPath: "assets/images/waxing.png",
                              title: "Waxing",
                            ),
                          ),
                          Container(
                            child: Services(
                              imgPath: "assets/images/makeup.png",
                              title: "Makeup",
                            ),
                          ),
                          Container(
                            child: Services(
                              imgPath: "assets/images/message.png",
                              title: "Message",
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
                      SizedBox(
                        height: 12,
                      ),

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Fellow(imgPath: "assets/images/on2.png"),
                            SizedBox(
                              width: 12,
                            ),
                            Fellow(imgPath: "assets/images/on2.png"),
                            SizedBox(
                              width: 12,
                            ),
                            Fellow(imgPath: "assets/images/on2.png"),
                            SizedBox(
                              width: 12,
                            ),
                            Fellow(imgPath: "assets/images/on2.png"),
                            SizedBox(
                              width: 12,
                            ),
                            Fellow(imgPath: "assets/images/on2.png"),
                            SizedBox(
                              width: 12,
                            ),
                            Fellow(imgPath: "assets/images/on2.png"),
                            SizedBox(
                              width: 12,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Featured Salon",
                              style: GoogleFonts.manrope(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          Text("view all",
                              style: GoogleFonts.manrope(
                                  fontSize: 16,
                                  color: constant.primaryColor,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 228,
                  // color: Colors.black,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Feature(
                          image: "assets/images/f1.png",
                          title: "Salon de Elegance",
                          service: "Hair . Nails . Facial",
                          location: "360 Stillwater Rd. Palm City..",
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Feature(
                          image: "assets/images/f2.png",
                          service: "Hair . Nails . Facial",
                          title: "Salon de Elegance",
                          location: "2607  Haymond Rocks ..",
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 102,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Most Search Interest",
                                  style: GoogleFonts.manrope(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                SearchInterest(
                                  imgPath: "assets/images/hr.png",
                                  title: "Fair",
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                SearchInterest(
                                  imgPath: "assets/images/facial.png",
                                  title: "Facial",
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                SearchInterest(
                                  imgPath: "assets/images/nail.png",
                                  title: "Nails",
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
                Container(
                  height: 222,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Nearby Offers",
                                style: GoogleFonts.manrope(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            Text("view all",
                                style: GoogleFonts.manrope(
                                    fontSize: 16,
                                    color: constant.primaryColor,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(height: 5,),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              NearByOffer(
                                  image: "assets/images/f1.png",
                                  title: "Sophisticated Salon",
                                  service: "Hair . Facial",
                                  location: "360 Stillwater Rd. Palm City.."),
                              NearByOffer(
                                  image: "assets/images/f1.png",
                                  title: "Sophisticated Salon",
                                  service: "Hair . Facial",
                                  location: "360 Stillwater Rd. Palm City.."),
                            ],
                          ),
                        )
                      ],
                    ),
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
