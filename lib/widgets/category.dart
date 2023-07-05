// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../config/color_style.dart';
import '../config/text_style.dart';

// ignore: must_be_immutable
class CategoryCard extends StatelessWidget {
  String category;
  CategoryCard({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      width: 76,
      height: 18,
      decoration: const BoxDecoration(
        color: secondaryBlueColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Center(
        child: Text(
          category,
          style: smallText.copyWith(color: blueColor),
        ),
      ),
    );
  }
}
