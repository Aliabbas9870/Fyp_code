
import 'package:flutter/material.dart';
import 'package:fypapp/widgets/constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';


class EmailVerify extends StatefulWidget {
  const EmailVerify({super.key});

  @override
  State<EmailVerify> createState() => _EmailVerifyState();
}

class _EmailVerifyState extends State<EmailVerify> {
  final Constant constant = Constant();
  var emailControl = TextEditingController();

  final defaultPinTheme = PinTheme(
    
    width: 56,
    height: 56,
    textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(20),
    ),
  );
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
              "Email verification,",
              style: GoogleFonts.manrope(
                color: constant.primaryColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Please type OTP code that we give you",
              style: GoogleFonts.manrope(
                color: constant.primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),

            SizedBox(
              height: 140,
            ),
            Container(
              child: Column(
                children: [
                  // TextField(
                  //   decoration: InputDecoration(
                  //       prefixIconColor: constant.primaryColor,
                  //       hintStyle: TextStyle(color: constant.primaryColor),
                  //       // prefixIcon: Icon(Icons.email_outlined),
                  //       border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(20))),
                  // ),
                  Center(
                    child: Form(
                      // key: formKey,
                      child: Pinput(
                        controller: emailControl,
                    
                        forceErrorState: true,
                                     
                        errorText: 'Error',
                        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                        validator: (pin) {
                          if (pin == '111111') return null;
                          return 'Pin is incorrect';
                        },
                      ),
                    ),
                  )

                  
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [],
            ),
            // end text field
            SizedBox(
              height: 60,
            ),

            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 348,
                    height: 55,
                    decoration: BoxDecoration(
                        color: constant.primaryColor,
                        border: Border.all(color: constant.primaryColor),
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text("Verify Email",
                          style: GoogleFonts.manrope(
                              color: constant.whiteC,
                              fontSize: 16,
                              fontWeight: FontWeight.w700)),
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
