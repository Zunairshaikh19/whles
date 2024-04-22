import 'package:flutter/material.dart';

import '../app_theme.dart';

class PropertyDetailsCards extends StatefulWidget {
  final String title;
  final String subtitle;
  final String image;
  const PropertyDetailsCards(
      {required this.title,
      required this.subtitle,
      required this.image,
      super.key});

  @override
  State<PropertyDetailsCards> createState() => _PropertyDetailsCardsState();
}

class _PropertyDetailsCardsState extends State<PropertyDetailsCards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                  image: ExactAssetImage(widget.image),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins'),
                  ),
                  Text(
                    widget.subtitle,
                    style: const TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.kCustomProfileTextColor,
                        fontFamily: 'Poppins'),
                  )
                ],
              ),
            ],
          ),
          const Image(image: ExactAssetImage('assets/arrow_right.png'))
        ],
      ),
    );
  }
}
