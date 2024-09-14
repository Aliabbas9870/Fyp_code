import 'package:flutter/material.dart';
import 'package:fypapp/widgets/constant.dart';

class SeacurityView extends StatefulWidget {
  const SeacurityView({super.key});

  @override
  State<SeacurityView> createState() => _SeacurityViewState();
}

class _SeacurityViewState extends State<SeacurityView> {
  final Constant constant = Constant();

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
    );
  }
}
