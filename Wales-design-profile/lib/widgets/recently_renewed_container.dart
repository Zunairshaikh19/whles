import 'package:app/models/recently_renewed_model.dart';
import 'package:flutter/material.dart';

import '../app_theme.dart';

class RecentlyRenewedContainer extends StatelessWidget {
  final RecentlyRenewedModel recentlyRenewedList;
  const RecentlyRenewedContainer(
      {required this.recentlyRenewedList, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 162,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppTheme.whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 131,
            width: 162,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Image(
                image: AssetImage(
                  recentlyRenewedList.image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      recentlyRenewedList.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      recentlyRenewedList.price,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 11,
                          fontFamily: 'Poppins',
                          color: AppTheme.blackColor),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  recentlyRenewedList.subtitle,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 9,
                      fontFamily: 'Poppins',
                      color: AppTheme.kCustomnavGrayColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
