import 'package:flutter/material.dart';

import '../app_theme.dart';

class TabBarWidget extends StatelessWidget {
  final List<Widget> tabWidget;
  final Color iColor;
  final Color labelColor;
  const TabBarWidget(
      {required this.tabWidget,
      required this.iColor,
      required this.labelColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
        unselectedLabelStyle: TextStyle(
          color: AppTheme.blackColor.withOpacity(0.4),
          fontFamily: 'Poppins',
        ),
        labelStyle: TextStyle(
          color: AppTheme.blackColor,
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins',
        ),
        padding: const EdgeInsets.all(0),
        unselectedLabelColor: AppTheme.blackColor.withOpacity(0.4),
        labelColor: labelColor,
        indicatorColor: iColor,
        indicatorWeight: 3,
        isScrollable: true,
        indicator: BoxDecoration(color: iColor),
        //dividerColor: AppTheme.blackColor,
        automaticIndicatorColorAdjustment: true,
        indicatorSize: TabBarIndicatorSize.label,
        tabs: tabWidget);
  }
}
