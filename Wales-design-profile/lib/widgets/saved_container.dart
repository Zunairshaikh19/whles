import 'package:app/models/trending_model.dart';
import 'package:app/widgets/custom_rich_text.dart';
import 'package:flutter/material.dart';

import '../app_theme.dart';

class SavedContainer extends StatelessWidget {
  final TrendingModel trendingList;
  const SavedContainer({required this.trendingList, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12)),
              child: Image(
                image: AssetImage(
                  trendingList.cardImage,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text(
                trendingList.propertyName,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    fontFamily: 'Poppins'),
              ),
              const SizedBox(height: 5),
              Text(
                trendingList.location,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    color: AppTheme.kCustomnavGrayColor),
              ),
              const SizedBox(height: 10),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomRichText(
                    onTap: () {},
                    leftText: trendingList.price,
                    leftTextColor: AppTheme.kCustomTextFiledHintTextColor,
                    leftFontSize: 18,
                    leftFontWeight: FontWeight.w700,
                    rightText: "/ month",
                    rightFontSize: 12,
                    rightTextColor:
                        AppTheme.kCustomTextFiledHintTextColor.withOpacity(0.5),
                  ),
                ],
              ),
              const SizedBox(height: 5),
            ],
          ),
        ],
      ),
    );
  }
}
