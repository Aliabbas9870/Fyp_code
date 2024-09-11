import 'package:beautilly/auth/forget_pass.dart';
import 'package:beautilly/auth/signup_auth.dart';
import 'package:beautilly/widgets/bottomBar.dart';
import 'package:beautilly/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginAuth extends StatefulWidget {
  const LoginAuth({super.key});

  @override
  State<LoginAuth> createState() => _LoginAuthState();
}

class _LoginAuthState extends State<LoginAuth> {
  final Constant constant = Constant();
  var emailControl = TextEditingController();
  var passControl = TextEditingController();
  bool obscurePass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constant.whiteC,
      body: Container(
        padding: EdgeInsets.only(top: 55, left: 17, right: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Welcome back!",
                style: GoogleFonts.manrope(
                  color: constant.primaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Glad to meet you again!, please login to use the app.",
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
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      obscureText: obscurePass,
                      decoration: InputDecoration(
                          prefixIconColor: constant.primaryColor,
                          hintText: "Password",
                          hintStyle: TextStyle(color: constant.primaryColor),
                          prefixIcon: Icon(Icons.lock),
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
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (c) => ForgetPassword()));
                        // ForgetPassword
                      },
                      child: Text(
                        "Forgot password?",
                        style: GoogleFonts.manrope(
                          color: constant.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      )),
                ],
              ),
              // end text field
              SizedBox(
                height: 40,
              ),

              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (con)=>BottomBarStart()));
                      },
                      child: Container(
                        width: 348,
                        height: 55,
                        decoration: BoxDecoration(
                            color: constant.primaryColor,
                            border: Border.all(color: constant.primaryColor),
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text("Sign in",
                              style: GoogleFonts.manrope(
                                  color: constant.whiteC,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700)),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 42,
                    ),

                    Container(
                      width: 348,
                      child: Row(
                        children: [
                          Expanded(
                              child: Divider(
                            thickness: 1.5,
                          )),
                          SizedBox(
                            width: 5,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("Or",
                                style: GoogleFonts.manrope(
                                    color: constant.primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700)),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: Divider(
                            thickness: 1.5,
                          ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    // Google Sign In Button
                    Container(
                      height: 55,
                      width: 348,
                      decoration: BoxDecoration(
                          border: Border.all(color: constant.primaryColor),
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/g.png',
                            width: 30,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text('Sign in with Google',
                              style: GoogleFonts.manrope(
                                  color: constant.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don’t have an account?",
                        style: GoogleFonts.manrope(
                          color: constant.primaryColor,
                          fontSize: 16,
                        )),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (c) => SignupAuth()));
                        },
                        child: Text("Join Now",
                            style: GoogleFonts.manrope(
                                color: constant.primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w700)))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
