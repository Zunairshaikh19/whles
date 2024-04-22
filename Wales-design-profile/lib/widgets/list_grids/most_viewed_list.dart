import 'package:app/models/most_viewed_model.dart';
import 'package:app/widgets/most_viewed_container.dart';
import 'package:flutter/material.dart';

class MostViewedList extends StatelessWidget {
  const MostViewedList({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> trendingImage = [
      "assets/frame7.png",
      "assets/frame7.png",
      "assets/frame7.png",
      "assets/frame7.png",
      "assets/frame7.png",
      "assets/frame7.png",
    ];

    List<MostViewedModel> mostViewedList = [
      MostViewedModel(
          'id',
          'assets/mostViewed.png',
          "Entire Bromo\nmountain view\nCabin in Surabaya",
          "Malang, Probolinggo",
          "GA . Leased",
          "assets/Group2.png",
          "2 rooms",
          "assets/home-hashtag.png",
          "673m2",
          "\$526"),
      MostViewedModel(
          'id',
          'assets/mostViewed.png',
          "Entire Bromo\nmountain view\nCabin in Surabaya",
          "Malang, Probolinggo",
          "GA . Leased",
          "assets/Group2.png",
          "2 rooms",
          "assets/home-hashtag.png",
          "673m2",
          "\$526"),
      MostViewedModel(
          'id',
          'assets/mostViewed.png',
          "Entire Bromo\nmountain view\nCabin in Surabaya",
          "Malang, Probolinggo",
          "GA . Leased",
          "assets/Group2.png",
          "2 rooms",
          "assets/home-hashtag.png",
          "673m2",
          "\$526"),
    ];

    return ListView.builder(
        padding: const EdgeInsets.only(left: 12, top: 18),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: trendingImage.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: MostViewedContainer(
              mostViewedList: mostViewedList[index],
            ),
          );
        });
  }
}
