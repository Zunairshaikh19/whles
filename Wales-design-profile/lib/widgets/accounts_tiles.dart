import 'package:flutter/material.dart';

import '../app_theme.dart';

class AccountTiles extends StatefulWidget {
  final String title;
  final String subtitle;
  final String trailing;
  const AccountTiles(
      {required this.title,
      required this.subtitle,
      required this.trailing,
      super.key});

  @override
  State<AccountTiles> createState() => _AccountTilesState();
}

class _AccountTilesState extends State<AccountTiles> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
          Text(
            widget.trailing,
            style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w500,
                color: AppTheme.blackColor,
                fontFamily: 'Poppins'),
          )
        ],
      ),
    );
  }
}
