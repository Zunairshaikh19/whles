import 'package:flutter/material.dart';

import '../app_theme.dart';

class HomeHeadingWidget extends StatelessWidget {
  final String title;
  final String type;
  final bool showView;
  const HomeHeadingWidget(
      {required this.title,
      required this.type,
      required this.showView,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins'),
          ),
          if (showView)
            const Row(
              children: [
                Text(
                  "See All",
                  style: TextStyle(
                      fontSize: 14,
                      color: AppTheme.kCustomAllTextColor,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins'),
                ),
              ],
            )
        ],
      ),
    );
  }
}
