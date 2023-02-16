import 'dart:ui';

import 'package:flutter/material.dart';

Widget MyContainer(
    {required double height,
    required double width,
    required String imageurl,
    required String txt}) {
  return Container(
      height: height,
      decoration: BoxDecoration(
          color: Colors.black,
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 243, 33, 33),
            Color.fromARGB(255, 255, 153, 0)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90))),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: height * (0.2)),
              child: Image.asset(
                imageurl,
                height: height * (0.6),
              ),
            ),
            Container(
              margin:
                  EdgeInsets.only(right: width * (0.1), top: height * (0.01)),
              alignment: Alignment.bottomRight,
              child: Text(
                txt,
                style: TextStyle(
                    fontSize: height * (0.1),
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ));
}

Widget MyTextField({required double mrgintop, required Widget child}) {
  return Container(
    margin: EdgeInsets.only(left: 20, right: 20, top: mrgintop),
    padding: EdgeInsets.only(left: 20, right: 20),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey[200],
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 10), blurRadius: 50, color: Color(0xffEEEEEE)),
        ]),
    alignment: Alignment.center,
    child: child,
  );
}

Widget MyButton(
    {required EdgeInsets e,
    EdgeInsets? p = const EdgeInsets.only(left: 20, right: 20),
    double? height = 54,
    required Widget child}) {
  return Container(
    margin: e,
    padding: p,
    alignment: Alignment.center,
    height: height,
    decoration: BoxDecoration(
        color: Colors.black,
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 243, 33, 33),
          Color.fromARGB(255, 255, 153, 0)
        ], begin: Alignment.centerLeft, end: Alignment.centerRight),
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 10), blurRadius: 50, color: Color(0xffEEEEEE)),
        ]),
    child: child,
  );
}
