import 'package:app/models/trending_model.dart';
import 'package:app/widgets/custom_rich_text.dart';
import 'package:flutter/material.dart';
import '../app_theme.dart';

class TrendingContainer extends StatelessWidget {
  final TrendingModel trendingList;
  const TrendingContainer({required this.trendingList, super.key});

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
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12)),
                child: Image(
                  image: NetworkImage(trendingList.cardImage),
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Expanded(
                child: Text(
                  trendingList.propertyName,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.visible,
                      fontSize: 16,
                      fontFamily: 'Poppins'),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                trendingList.location,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    color: AppTheme.kCustomnavGrayColor),
                softWrap: true,
              ),
              const SizedBox(height: 5),
              Text(
                trendingList.houseSize,
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
                        image: ExactAssetImage(trendingList.roomIcon),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(trendingList.noOfRooms,
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
                        image: ExactAssetImage(trendingList.distanceIcon),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(trendingList.price,
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
                  const SizedBox(
                    width: 50,
                  ),
                  const Image(image: ExactAssetImage('assets/heart.png'))
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
