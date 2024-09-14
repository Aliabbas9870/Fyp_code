import 'package:flutter/material.dart';
import 'package:fypapp/widgets/constant.dart';

class HelpView extends StatefulWidget {
  const HelpView({super.key});

  @override
  State<HelpView> createState() => _HelpViewState();
}

class _HelpViewState extends State<HelpView> {
  final Constant constant = Constant();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: constant.whiteC,

        title: Text(
          "Help",
          style: TextStyle(
              color: constant.primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
