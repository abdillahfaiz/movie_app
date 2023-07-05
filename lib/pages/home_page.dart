import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/config/color_style.dart';
import 'package:movie_app/config/text_style.dart';
import 'package:movie_app/data/dummy_data.dart';
import 'package:movie_app/widgets/button_see_more.dart';
import 'package:movie_app/widgets/card_movie.dart';
import 'package:movie_app/widgets/card_popular.dart';
import 'package:movie_app/widgets/category.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: SizedBox(
            width: 16,
            child: Image.asset(
              'assets/icons/union.png',
              width: 16,
            )),
        title: Text('Filmku', style: mainTitle1),
        actions: [
          Image.asset('assets/icons/notif.png'),
          const SizedBox(
            width: 28.0,
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 24, right: 24, top: 26),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Now Showing',
                  style: mainTitle1.copyWith(color: mainColor),
                ),
                CustomButtonSeeMore(color: greyColor, text: 'See More')
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            SizedBox(
              height: 300,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: imageDataNowShowing.length,
                itemBuilder: ((context, index) {
                  final data = imageDataNowShowing[index];
                  return CardMovie(
                      image: data['image']!,
                      title: data['title']!,
                      rating: data['rating']!);
                }),
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular',
                  style: mainTitle1.copyWith(color: mainColor),
                ),
                CustomButtonSeeMore(color: greyColor, text: 'See More')
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: imageDataPopular.length,
                itemBuilder: (context, index) {
                  final data = imageDataPopular[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 13),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                          child: Image.asset(
                            data['image'],
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 120,
                                child: Text(
                                  data['title'],
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
                                  Text(data['rating'])
                                ],
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Row(
                                children: [
                                  CategoryCard(category: data['category'][0]),
                                  CategoryCard(category: data['category'][1]),
                                ],
                              ),
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
                                    data['duration'],
                                    style: smallText.copyWith(color: blackColor),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                  //
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: Image.asset('assets/icons/home.png'), label: ''),
        BottomNavigationBarItem(
            icon: Image.asset('assets/icons/ticket.png'), label: ''),
        const BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border_sharp), label: ''),
      ]),
    );
  }
}
