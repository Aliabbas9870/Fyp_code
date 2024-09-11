import 'package:beautilly/auth/emai_verify.dart';
import 'package:beautilly/auth/signup_auth.dart';
import 'package:beautilly/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final Constant constant = Constant();
  var emailControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constant.whiteC,
      body: Container(
        padding: EdgeInsets.only(top: 55, left: 17, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Forgot password,",
              style: GoogleFonts.manrope(
                color: constant.primaryColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Please type your email below and we will give you a OTP code",
              style: GoogleFonts.manrope(
                color: constant.primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            // text field //
            SizedBox(
              height: 140,
            ),
            Container(
              child: Column(
                children: [
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        prefixIconColor: constant.primaryColor,
                        hintText: "Email Address",
                        hintStyle: TextStyle(color: constant.primaryColor),
                        prefixIcon: Icon(Icons.email_outlined),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Use Phone Number?",
                      style: GoogleFonts.manrope(
                        color: constant.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                      ),
                    )),
              ],
            ),
            // end text field
            SizedBox(
              height: 60,
            ),

            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (c) => EmailVerify()));
                    },
                    child: Container(
                      width: 348,
                      height: 55,
                      decoration: BoxDecoration(
                          color: constant.primaryColor,
                          border: Border.all(color: constant.primaryColor),
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {},
                          child: Text("Send Code",
                              style: GoogleFonts.manrope(
                                  color: constant.whiteC,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
