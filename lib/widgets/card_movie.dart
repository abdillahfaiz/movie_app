// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../config/color_style.dart';
import '../config/text_style.dart';

class CardMovie extends StatelessWidget {
  String image;
  String title;
  String rating;
  CardMovie({
    Key? key,
    required this.image,
    required this.title,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/detail-page');
          },
          child: Container(
            margin: const EdgeInsets.only(right: 16),
            width: 143,
            height: 212,
            child: Image.asset(image),
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
        SizedBox(
          width: 143,
          child: Text(
            title,
            style: maintitle2,
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.star,
              color: yellowColor,
              size: 12,
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              rating,
              style: smallText.copyWith(fontSize: 12),
            )
          ],
        )
      ],
    );
  }
}
