import 'package:app/models/most_viewed_model.dart';
import 'package:app/widgets/custom_rich_text.dart';
import 'package:flutter/material.dart';

import '../app_theme.dart';

class MostViewedContainer extends StatelessWidget {
  final MostViewedModel mostViewedList;
  const MostViewedContainer({required this.mostViewedList, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppTheme.whiteColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 189,
            width: 108,
            child: Image(
              image: AssetImage(
                mostViewedList.carouselImages.isNotEmpty
                    ? mostViewedList.carouselImages[0]
                    : "assets/placeholder_image.png",
              ),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Flexible(
                  child: Text(
                    mostViewedList.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2, // Limiting to 2 lines
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  mostViewedList.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      color: AppTheme.kCustomnavGrayColor),
                ),
                const SizedBox(height: 5),
                Text(
                  mostViewedList.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 9,
                      fontFamily: 'Poppins',
                      color: AppTheme.kCustomnavGrayColor),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Row(
                      children: [
                        // Image(
                        //   image: ExactAssetImage(mostViewedList.roomIcon),
                        // ), //zunair
                        const SizedBox(
                          width: 5,
                        ),
                        Text(mostViewedList.rooms,
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                fontFamily: 'Poppins',
                                color: AppTheme.kCustomnavGrayColor)),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        // Image(
                        //   image: ExactAssetImage(mostViewedList.distanceIcon),
                        // ), //zunair
                        const SizedBox(
                          width: 5,
                        ),
                        // Text(mostViewedList.noOfDistance,
                        //     style: const TextStyle(
                        //         fontWeight: FontWeight.w400,
                        //         fontSize: 13,
                        //         fontFamily: 'Poppins',
                        //         color: AppTheme.kCustomnavGrayColor)), //zunair
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomRichText(
                        onTap: () {},
                        leftText: mostViewedList.pricePerMonth.toString(),
                        leftTextColor: AppTheme.kCustomTextFiledHintTextColor,
                        leftFontSize: 18,
                        leftFontWeight: FontWeight.w700,
                        rightText: "/ month",
                        rightFontSize: 12,
                        rightTextColor: AppTheme.kCustomTextFiledHintTextColor
                            .withOpacity(0.5),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      const Image(image: ExactAssetImage('assets/heart.png'))
                    ],
                  ),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
