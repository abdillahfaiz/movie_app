// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:movie_app/config/color_style.dart';
import 'package:movie_app/config/text_style.dart';
import 'package:movie_app/data/model/movie_response_model.dart';
import 'package:movie_app/data/repository/get_movie_detail.dart';
import 'package:movie_app/widgets/category.dart';
import 'package:movie_app/widgets/rating.dart';

import '../widgets/button_see_more.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late Future<MovieResponseModel>? getData;

  @override
  void initState() {
    super.initState();
    getData = Repostitory().getDetailMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder<MovieResponseModel>(
            future: Repostitory().getDetailMovie(),
            builder: ((context, snapshot) {
              if (snapshot.data == null) {
                return Container();
              } else {
                return Stack(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(snapshot.data!.poster,
                          fit: BoxFit.cover),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 28, left: 28, top: 69),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          Icon(
                            Icons.more_horiz,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height / 6.3,
                      left: MediaQuery.of(context).size.width / 2.45,
                      child: Column(
                        children: [
                          Image.asset('assets/icons/button_play.png'),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            'Play Trailer',
                            style: subtTitle.copyWith(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                      ),
                      padding:
                          const EdgeInsets.only(left: 24, right: 24, top: 25),
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 3.2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 198,
                                child: Text(
                                  snapshot.data!.title,
                                  style: maintitle2.copyWith(fontSize: 24),
                                ),
                              ),
                              const Icon(
                                Icons.bookmark_border_sharp,
                                size: 24,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Rating(rating: snapshot.data!.imdbRating),
                          const SizedBox(
                            height: 16.0,
                          ),
                          Row(
                            children: [
                              CategoryCard(category: snapshot.data!.genre),
                            ],
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          Row(
                            children: [
                              DetailMovie(
                                  title: 'Length',
                                  detail: snapshot.data!.runtime),
                              const SizedBox(
                                width: 45.0,
                              ),
                              DetailMovie(
                                  title: 'Language',
                                  detail: snapshot.data!.language),
                              const SizedBox(
                                width: 45.0,
                              ),
                              DetailMovie(
                                  title: 'Rating', detail: snapshot.data!.rated)
                            ],
                          ),
                          const SizedBox(
                            height: 24.0,
                          ),
                          Text(
                            'Description',
                            style: mainTitle1,
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            snapshot.data!.description,
                            style: smallText.copyWith(height: 2, fontSize: 12),
                          ),
                          const SizedBox(
                            height: 24.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Cast',
                                style: mainTitle1.copyWith(color: mainColor),
                              ),
                              CustomButtonSeeMore(
                                  color: greyColor, text: 'See More')
                            ],
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          SizedBox(
                            height: 150,
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data!.actors.length,
                                itemBuilder: (context, index) {
                                  final data = snapshot.data!.actors[index];
                                  return Container(
                                    margin: EdgeInsets.only(right: 12),
                                    child: Column(
                                      children: [
                                        Container(
                                            width: 72,
                                            height: 72,
                                            child: ClipRRect(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0),
                                                ),
                                                child: Image.network(
                                                  data.picture,
                                                  fit: BoxFit.cover,
                                                ))),
                                        const SizedBox(
                                          height: 8.0,
                                        ),
                                        SizedBox(
                                            width: 80,
                                            child: Text(
                                              data.name,
                                              style: smallText.copyWith(
                                                  fontSize: 12,
                                                  color: blackColor),
                                            ))
                                      ],
                                    ),
                                  );
                                }),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class DetailMovie extends StatelessWidget {
  String title;
  String detail;
  DetailMovie({
    Key? key,
    required this.title,
    required this.detail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: smallText.copyWith(fontSize: 12),
        ),
        const SizedBox(
          height: 4.0,
        ),
        Text(
          detail,
          style: smallText.copyWith(
              color: blackColor, fontWeight: FontWeight.w600, fontSize: 12),
        )
      ],
    );
  }
}
