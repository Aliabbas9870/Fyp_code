import 'package:flutter/material.dart';
import 'package:fypapp/widgets/constant.dart';

class HelpView extends StatefulWidget {
  const HelpView({super.key});

  @override
  State<HelpView> createState() => _HelpViewState();
}

class _HelpViewState extends State<HelpView> {
  final Constant constant = Constant();
  // final Constant constant = Constant();
  // final Constant constant = Constant();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool obscurePass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: constant.whiteC,
        title: Text(
          "Help",
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
                  Image.asset("assets/images/QMrk.png"),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 150,
                    child: Text(
                      "How we can help you today ?",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 270,
                    child: Text(
                      "Please enter your personal data and describe your care needs or something we can help you with",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
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
                        Text("Name", style: TextStyle(
                        fontSize: 15,
                      ),),

                        TextField(
                          decoration: InputDecoration(
                              hintText: "Enter the Name",
                              prefixIcon: Icon(Icons.person,color: constant.primaryColor,),
                              suffixIconColor: constant.primaryColor,
                              border: OutlineInputBorder()),
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        Text("Email", style: TextStyle(
                        fontSize: 15,
                      ),),
                        TextField(
                          obscureText: obscurePass,
                          decoration: InputDecoration(
                              hintText: "Enter the Email",
                              prefixIcon: Icon(Icons.email,color: constant.primaryColor,),
                              suffixIconColor: constant.primaryColor,
                             
                              border: OutlineInputBorder()),
                        ),
                        // Spacer(),
                         SizedBox(
                          height: 10,
                        ),
                        Text("Describe", style: TextStyle(
                        fontSize: 15,
                      ),),

                        TextField(
                          minLines: 3,
                          maxLines: 5,
                          decoration: InputDecoration(
                            
                              hintText: "Enter a description here",
                            
                              suffixIconColor: constant.primaryColor,
                              border: OutlineInputBorder()),
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 20,
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
