import 'package:flutter/material.dart';

import '../app_theme.dart';

class ProfileCards extends StatefulWidget {
  final String title;
  final String subtitle;
  final String image;
  const ProfileCards(
      {required this.title,
      required this.subtitle,
      required this.image,
      super.key});

  @override
  State<ProfileCards> createState() => _ProfileCardsState();
}

class _ProfileCardsState extends State<ProfileCards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                elevation: 4,
                shadowColor: AppTheme.greyColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                    image: ExactAssetImage(widget.image),
                    width: 35, // Adjust this value to resize the image
                    height: 35,
                  ),
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
