// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../config/color_style.dart';
import '../config/text_style.dart';

class PopularCardMovie extends StatelessWidget {
  String image;
  String title;
  String rating;
  Widget category;
  String duration;
  PopularCardMovie({
    Key? key,
    required this.image,
    required this.title,
    required this.rating,
    required this.category,
    required this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 13),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(5.0),
            ),
            child: Image.asset(
              image,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            width: 16.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 120,
                child: Text(
                  title,
                  style: maintitle2,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: yellowColor,
                    size: 12,
                  ),
                  Text(rating)
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              category,
              const SizedBox(
                height: 8.0,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.timer_outlined,
                    size: 10,
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    duration,
                    style: smallText.copyWith(color: blackColor),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}




