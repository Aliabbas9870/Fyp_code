import 'package:flutter/material.dart';
import 'package:fypapp/widgets/constant.dart';

class SeacurityView extends StatefulWidget {
  const SeacurityView({super.key});

  @override
  State<SeacurityView> createState() => _SeacurityViewState();
}

class _SeacurityViewState extends State<SeacurityView> {
  final Constant constant = Constant();
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
          "Seacurity",
          style: TextStyle(
              color: constant.primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 88),
        padding: EdgeInsets.all(12),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Password"),

            TextField(
              obscureText: obscurePass,
              decoration: InputDecoration(
                  hintText: "Enter the  password",
                  prefixIcon: Icon(Icons.key),
                  suffixIconColor: constant.primaryColor,
                  border: OutlineInputBorder()),
            ),

            SizedBox(
              height: 40,
            ),

            Text("Confirm Password"),
            TextField(
              obscureText: obscurePass,
              decoration: InputDecoration(
                  hintText: "Enter the Confirm password",
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
              height: 272,
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
                    style: TextStyle(color: constant.whiteC, fontSize: 17),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
