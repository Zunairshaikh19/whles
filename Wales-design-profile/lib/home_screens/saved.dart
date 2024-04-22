import 'package:app/widgets/saved_container.dart';
import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../models/trending_model.dart';
import '../widgets/custom_text_field.dart';

class Saved extends StatefulWidget {
  const Saved({super.key});

  @override
  State<Saved> createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  TextEditingController searchController = TextEditingController();
  List<TrendingModel> trendingList = [
    TrendingModel(
      'id',
      "assets/frame7.png",
      [
        "assets/FramePic3.png",
      ],
      "Entire Bromo\nmountain view\nCabin in Surabaya",
      "Malang, Probolinggo",
      "GA . Leased",
      "assets/Group2.png",
      "2 rooms",
      "assets/home-hashtag.png",
      "673m2",
      "\$526",
      "\$526",
      "\$526",
      "\$526",
      "\$526",
      "\$526",
      "\$526",
      "\$526",
      "\$526",
    ),
    TrendingModel(
      'id',
      "assets/FramePic1.png",
      [
        "assets/FramePic3.png",
      ],
      "Entire Bromo\nmountain view\nCabin in Surabaya",
      "Malang, Probolinggo",
      "GA . Leased",
      "assets/Group2.png",
      "2 rooms",
      "assets/home-hashtag.png",
      "673m2",
      "\$526",
      "\$526",
      "\$526",
      "\$526",
      "\$526",
      "\$526",
      "\$526",
      "\$526",
      "\$526",
    ),
    TrendingModel(
      'id',
      "assets/FramePic2.png",
      [
        "assets/FramePic3.png",
      ],
      "Entire Bromo\nmountain view\nCabin in Surabaya",
      "Malang, Probolinggo",
      "GA . Leased",
      "assets/Group2.png",
      "2 rooms",
      "assets/home-hashtag.png",
      "673m2",
      "\$526",
      "\$526",
      "\$526",
      "\$526",
      "\$526",
      "\$526",
      "\$526",
      "\$526",
      "\$526",
    ),
    TrendingModel(
      'id',
      "assets/FramePic3.png",
      [
        "assets/FramePic3.png",
      ],
      "Entire Bromo\nmountain view\nCabin in Surabaya",
      "Malang, Probolinggo",
      "GA . Leased",
      "assets/Group2.png",
      "2 rooms",
      "assets/home-hashtag.png",
      "673m2",
      "\$526",
      "\$526",
      "\$526",
      "\$526",
      "\$526",
      "\$526",
      "\$526",
      "\$526",
      "\$526",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.greyColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: CustomTextField(
                controller: searchController,
                hintText: "Search saved properties",
                isPass: true,
                showIcon: true,
                prefixIcon: 'assets/search-normal.png',
                height: 48,
                textInputType: TextInputType.text,
              ),
            ),
            ListView.builder(
                padding: const EdgeInsets.only(left: 12, top: 18),
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: trendingList.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 15),
                    child: SavedContainer(
                      trendingList: trendingList[index],
                      // price: priceList[index]
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
