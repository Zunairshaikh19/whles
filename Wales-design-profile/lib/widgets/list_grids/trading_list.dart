import 'package:app/models/trading_model.dart';
import 'package:app/widgets/trading_container.dart';
import 'package:flutter/material.dart';

class TradingList extends StatelessWidget {
  final List<TradingModel> tradingList;

  const TradingList({Key? key, required this.tradingList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(left: 12, top: 18),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: tradingList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: TradingContainer(
            tradingList: tradingList[index],
          ),
        );
      },
    );
  }
}
