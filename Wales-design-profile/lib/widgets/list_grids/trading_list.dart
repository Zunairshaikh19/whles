import 'package:app/models/trading_model.dart';
import 'package:app/widgets/trading_container.dart';
import 'package:flutter/material.dart';

class TradingList extends StatelessWidget {
  const TradingList({super.key});

  @override
  Widget build(BuildContext context) {
    List<TradingModel> tradingList = [
      TradingModel('id', "assets/trading.png", '23 Entiree Broms', "\$5.55",
          "GA . Leased"),
      TradingModel('id', "assets/trading.png", '23 Entiree Broms', "\$5.55",
          "GA . Leased"),
      TradingModel('id', "assets/trading.png", '23 Entiree Broms', "\$5.55",
          "GA . Leased"),
      TradingModel('id', "assets/trading.png", '23 Entiree Broms', "\$5.55",
          "GA . Leased"),
    ];
    return ListView.builder(
      padding: const EdgeInsets.only(left: 12, top: 18),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: tradingList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: TradingContainer(
            tradingList: tradingList[index],
            // price: priceList[index]
          ),
        );
      },
    );
  }
}
