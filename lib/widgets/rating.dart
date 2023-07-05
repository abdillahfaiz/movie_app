// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../config/color_style.dart';

class Rating extends StatelessWidget {
  String rating;
  Rating({
    Key? key,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: yellowColor,
          size: 12,
        ),
        Text(rating)
      ],
    );
  }
}
