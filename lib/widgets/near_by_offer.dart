import 'package:flutter/material.dart';
import 'package:fypapp/widgets/constant.dart';

class NearByOffer extends StatelessWidget {
  String service;
  String image;
  String location;
  String title;
  NearByOffer(
      {required this.image,
      required this.title,
      required this.service,
      required this.location});
  final Constant constant = Constant();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width / 3.2,
            height: 110,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      image,
                    ),
                    fit: BoxFit.cover,
                    scale: 1.0),
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.favorite_outline_outlined,
                    color: Colors.red,
                    size: 44,
                  ),
                  Container(
                    height: 33,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "1.2km",
                        style: TextStyle(color: Color(0xffF98600)),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12)),
                        color: Color(0xffFFF9E5)),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: Row(
                    // mainAxisAlignment:
                    // MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(service,
                          style: TextStyle(
                              fontSize: 14, color: constant.primaryColor))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: Text(title,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: constant.primaryColor)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: Text(location,
                      style: TextStyle(
                          fontSize: 14, color: constant.primaryColor)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
