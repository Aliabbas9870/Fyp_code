import 'package:flutter/material.dart';
import 'package:fypapp/auth/login_auth.dart';
import 'package:fypapp/views/about_view.dart';
import 'package:fypapp/views/account_view.dart';
import 'package:fypapp/views/help_view.dart';
import 'package:fypapp/views/seacurity_view.dart';
import 'package:fypapp/widgets/constant.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final Constant constant = Constant();
  bool isSwitched = false;
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        radius: 34,
                        backgroundColor: constant.primaryColor,
                        backgroundImage:
                            AssetImage("assets/images/profilepic.png"),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0, left: 8),
                            child: Container(
                                width: 80,
                                height: 25,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Color(0xffF98600)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/images/patim.png"),
                                    SizedBox(
                                      width: 5,
                                    ),
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
                            "Ali Abbas",
                            style: TextStyle(
                                color: constant.whiteC,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Image.asset(
                              "assets/images/editIcon.png",
                              color: constant.primaryColor,
                              scale: 0.8,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  padding: EdgeInsets.only(left: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.email,
                            color: constant.whiteC,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "aliabbas@gmail.com",
                            style:
                                TextStyle(color: constant.whiteC, fontSize: 17),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_city,
                            color: constant.whiteC,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Sahiwal, punjab pakistan",
                            style:
                                TextStyle(color: constant.whiteC, fontSize: 17),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      color: constant.whiteC,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(
                            25,
                          ),
                          topLeft: Radius.circular(25))),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0, left: 20),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "settings",
                          style: TextStyle(
                              color: constant.primaryColor, fontSize: 17),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Notification",
                              style: TextStyle(
                                  color: constant.primaryColor, fontSize: 17),
                            ),
                            Switch(
                              activeTrackColor: constant.primaryColor,
                              activeColor: constant.whiteC,
                              value: isSwitched,
                              inactiveThumbColor: constant.primaryColor,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (c) => AccountView()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Account",
                                style: TextStyle(
                                    color: constant.primaryColor, fontSize: 17),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: constant.primaryColor,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (c) => SeacurityView()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Security",
                                style: TextStyle(
                                    color: constant.primaryColor, fontSize: 17),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: constant.primaryColor,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (c) => HelpView()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Help",
                                style: TextStyle(
                                    color: constant.primaryColor, fontSize: 17),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: constant.primaryColor,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (c) => AboutView()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "About",
                                style: TextStyle(
                                    color: constant.primaryColor, fontSize: 17),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: constant.primaryColor,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 59,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (c) => LoginAuth()));
                          },
                          child: Center(
                            child: Container(
                              height: 45,
                              width: MediaQuery.sizeOf(context).width / 1.7,
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
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      
    );
  }
}
