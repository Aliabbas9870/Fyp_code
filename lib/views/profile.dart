import 'package:beautilly/widgets/constant.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final Constant constant = Constant();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Profile",
          style: TextStyle(
              color: constant.whiteC,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        elevation: 20,
        backgroundColor: Color(0xff156778),
        actions: [
          Icon(Icons.cut, color: constant.whiteC),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Gobar",
              style: TextStyle(
                  color: constant.whiteC,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/profileBg.png"),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 44,
                    backgroundImage: AssetImage("assets/images/profilepic.png"),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, left: 8),
                        child: Container(
                            width: 90,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color(0xffF98600)),
                            child: Row(
                              children: [
                                Image.asset("assets/images/patim.png"),
                                Center(
                                  child: Center(
                                      child: Text(
                                    "Platinum",
                                    style: TextStyle(color: constant.whiteC),
                                  )),
                                ),
                              ],
                            )),
                      ),
                      Text(
                        "User",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 250,
                  ),
                  Row(
                    children: [Image.asset("assets/images/editIcon.png")],
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(
                        12,
                      ),
                      topLeft: Radius.circular(12))),        
              child: Column(
                children: [
                  Text(

                    "settings",


                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
