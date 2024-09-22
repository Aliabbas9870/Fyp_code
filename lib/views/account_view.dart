import 'package:flutter/material.dart';
import 'package:fypapp/widgets/constant.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  final Constant constant = Constant();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool obscurePass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: constant.whiteC,
        title: Text(
          "Account",
          style: TextStyle(
              color: constant.primaryColor,
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          Container(
              color: constant.whiteC,
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  CircleAvatar(
                    radius: 44,
                    child: Image.asset(
                      "assets/images/profilepic.png",
                      fit: BoxFit.cover,
                      height: 80,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
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
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Ali Abbas",
                    style: TextStyle(fontSize: 22),
                  ),
                  SizedBox(
                    height: 46,
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Email"),

                        TextField(
                          decoration: InputDecoration(
                              hintText: "Enter the Email",
                              prefixIcon: Icon(Icons.email_rounded),
                              suffixIconColor: constant.primaryColor,
                              border: OutlineInputBorder()),
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        Text("Password"),
                        TextField(
                          obscureText: obscurePass,
                          decoration: InputDecoration(
                  hintText: "Enter the password",

                              prefixIcon: Icon(Icons.key_sharp),
                              suffixIconColor: constant.primaryColor,
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      obscurePass = !obscurePass;
                                    });
                                  },
                                  icon: obscurePass
                                      ? Icon(Icons.visibility_off)
                                      : Icon(Icons.visibility)),
                              border: OutlineInputBorder()),
                        ),
                        // Spacer(),
                        SizedBox(
                          height: 172,
                        ),
                        Center(
                          child: Container(
                            height: 45,
                            width: MediaQuery.sizeOf(context).width / 1.7,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: constant.primaryColor),
                            child: Center(
                              child: Text(
                                "Save",
                                style: TextStyle(
                                    color: constant.whiteC, fontSize: 17),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
