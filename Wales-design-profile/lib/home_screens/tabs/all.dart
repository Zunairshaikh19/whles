import 'package:app/constants/typography.dart';
import 'package:app/home_screens/host_place.dart';
import 'package:app/widgets/home_heading_widget.dart';
import 'package:app/widgets/list_grids/most_viewed_list.dart';
import 'package:app/widgets/list_grids/recently_renewed_list.dart';
import 'package:app/widgets/list_grids/trading_list.dart';
import 'package:app/widgets/trading_big_card.dart';
import 'package:flutter/material.dart';
import '../../models/trading_model.dart';

class All extends StatefulWidget {
  const All({super.key});

  @override
  State<All> createState() => _AllState();
}

class _AllState extends State<All> {
  final List<String> _homeCategory = ['All', 'Urban', 'Suburban', 'Safe neighborhood', 'Rate a ride', 'Reviews'];
  List<TradingModel> tradingList = [
    TradingModel('id', "assets/trading.png", '23 Entiree Broms', "\$5.55", "GA . Leased"),
    TradingModel('id', "assets/trading.png", '23 Entiree Broms', "\$5.55", "GA . Leased"),
    TradingModel('id', "assets/trading.png", '23 Entiree Broms', "\$5.55", "GA . Leased"),
    TradingModel('id', "assets/trading.png", '23 Entiree Broms', "\$5.55", "GA . Leased"),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                height: 40,
                child: Row(
                  children: [
                    ...List.generate(
                      _homeCategory.length,
                      (index) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                        margin: const EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.withOpacity(0.3)),
                        ),
                        child: Text(
                          _homeCategory[index],
                          style: poppinsRegular.copyWith(
                            fontSize: 14,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            const HomeHeadingWidget(
              title: "Trending",
              type: "trend",
              showView: true,
            ),
            const SizedBox(
              height: 209,
              child: MostViewedList(),
            ),
            const SizedBox(
              height: 30,
            ),
            const HomeHeadingWidget(
              title: "Recently Renewed",
              type: "trend",
              showView: true,
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 216,
              child: RecentlyRenewedList(),
            ),
            const SizedBox(
              height: 10,
            ),
            const HomeHeadingWidget(
              title: "Most Viewed",
              type: "trend",
              showView: true,
            ),
            const SizedBox(
              height: 209,
              child: MostViewedList(),
            ),
            const SizedBox(
              height: 10,
            ),
            const HomeHeadingWidget(
              title: "Trading",
              type: "trend",
              showView: true,
            ),
            const SizedBox(
              height: 218,
              child: TradingList(),
            ),
            const SizedBox(
              height: 10,
            ),
            const HomeHeadingWidget(
              title: "Pre-Trading",
              type: "trend",
              showView: true,
            ),
            const SizedBox(
              height: 218,
              child: TradingList(),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TradingBigCard(),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: HostPlace(),
            ),
          ],
        ),
      ),
    );
  }
}
