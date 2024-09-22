import 'package:flutter/material.dart';
import 'package:fypapp/views/booking/book_service_view.dart';
import 'package:fypapp/widgets/bottomBar.dart';
import 'package:fypapp/widgets/constant.dart';
import 'package:fypapp/widgets/gallery.dart';
import 'package:fypapp/widgets/specialist.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopDetailView extends StatefulWidget {
  const ShopDetailView({super.key});

  @override
  State<ShopDetailView> createState() => _ShopDetailViewState();
}

class _ShopDetailViewState extends State<ShopDetailView> {
  final Constant constant = Constant();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            // height: MediaQuery.sizeOf(context).height / 2.2,
            height: 248,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/shopbg.png"),
                    fit: BoxFit.cover)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color(0xffF9FAFA),
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: IconButton(
                        onPressed: () {
                               Navigator.push(context, MaterialPageRoute(builder: (c)=>BottomBarStart()));
                        },
                        icon: Center(
                            child: Icon(
                          Icons.arrow_back_ios,
                          color: constant.primaryColor,
                        ))),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color(0xffF9FAFA),
                          borderRadius: BorderRadius.circular(30)),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      width: 66,
                      height: 66,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)),
                      child: IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            "assets/images/mp.png",
                            fit: BoxFit.cover,
                            height: 55,
                            width: 55,
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Gallery",
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
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GalleryWidget(imgPath: "assets/images/G1.png"),
                SizedBox(
                  width: 10,
                ),
                GalleryWidget(imgPath: "assets/images/G2.png"),
                GalleryWidget(imgPath: "assets/images/G3.png"),
                GalleryWidget(imgPath: "assets/images/G4.png"),
              ],
            ),
          ),
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
                SpecialListWidget(
                    imgPath: "assets/images/Sp1.png", title: "Ali Abas"),
                SpecialListWidget(
                    imgPath: "assets/images/SpG2.png", title: "Dr. Binya"),
                SpecialListWidget(
                    imgPath: "assets/images/SpG3.png", title: "Sn. Aqib"),
                SpecialListWidget(
                    imgPath: "assets/images/Sp4.png", title: "Rao Aqib"),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          )
        ],
      ),
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
                        text: '\$5 ',
                        style: TextStyle(
                            color: constant.primaryColor,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: '\$10',
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
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (c) => BookServiceView()));
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
                      "Book Now",
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
