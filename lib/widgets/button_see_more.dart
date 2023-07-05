// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../config/text_style.dart';

class CustomButtonSeeMore extends StatelessWidget {
  Color color;
  String text;
   CustomButtonSeeMore({
    Key? key,
    required this.color,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 61,
      height: 21,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 1.0,
          color: color,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
          child: Text(
        text,
        style: smallText,
      )),
    );
  }
}
