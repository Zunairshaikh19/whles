import 'package:app/models/most_viewed_model.dart';
import 'package:app/widgets/custom_rich_text.dart';
import 'package:flutter/material.dart';

import '../app_theme.dart';

class MostViewedContainer extends StatelessWidget {
  final MostViewedModel mostViewedList;
  const MostViewedContainer({required this.mostViewedList, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
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
                mostViewedList.image,
              ),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Text(
                mostViewedList.heading,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 5),
              Text(
                mostViewedList.subHeading,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    color: AppTheme.kCustomnavGrayColor),
              ),
              const SizedBox(height: 5),
              Text(
                mostViewedList.subSubHeading,
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
                      Image(
                        image: ExactAssetImage(mostViewedList.roomIcon),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(mostViewedList.noOfRooms,
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
                      Image(
                        image: ExactAssetImage(mostViewedList.distanceIcon),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(mostViewedList.noOfDistance,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              color: AppTheme.kCustomnavGrayColor)),
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
                      leftText: mostViewedList.price,
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
        ],
      ),
    );
  }
}
