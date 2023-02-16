import 'package:flutter/material.dart';

Widget MyCard(
    {required IconData icon,
    required String txt,
    required double height,
    required Color clr}) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    elevation: 25,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: clr,
          size: height * (1 / 10),
        ),
        Text(
          txt,
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}
