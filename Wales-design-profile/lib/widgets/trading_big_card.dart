import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:app/app_theme.dart';
import 'package:app/models/trading_model.dart';

class TradingBigCard extends StatelessWidget {
  final TradingModel tradingList;

  const TradingBigCard({Key? key, required this.tradingList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppTheme.whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(
            height: 130,
            width: 130,
            image: tradingList.carouselImages[0].contains("https:")
                ? NetworkImage(
                    tradingList.carouselImages[0],
                  )
                : AssetImage(
                    tradingList.carouselImages[0],
                  ) as ImageProvider<Object>,
            fit: BoxFit.cover,
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
                      tradingList.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      tradingList.pricePerShare,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: AppTheme.blackColor,
                          fontFamily: 'Poppins'),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: 30,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IntrinsicWidth(
                          child: Text(
                            tradingList.title,
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 11,
                                color: AppTheme.kCustomnavGrayColor,
                                fontFamily: 'Poppins'),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          width: 80,
                          child: LineChart(
                            LineChartData(
                              minX: 0,
                              maxX: 10,
                              minY: 0,
                              maxY: 6.5,
                              lineBarsData: [
                                LineChartBarData(
                                  dotData: const FlDotData(
                                    show: false,
                                  ),
                                  isCurved: true,
                                  color: AppTheme.redColor,
                                  barWidth: .5,
                                  spots: [
                                    const FlSpot(0, 3),
                                    const FlSpot(1.6, 2),
                                    const FlSpot(3.9, 5),
                                    const FlSpot(6.8, 0.5),
                                    const FlSpot(8, 0),
                                  ],
                                ),
                              ],
                              gridData: const FlGridData(
                                show: false,
                              ),
                              borderData: FlBorderData(
                                show: false,
                              ),
                              titlesData: const FlTitlesData(
                                show: false,
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 20,
                                    interval: 0.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image(
                      image: ExactAssetImage('assets/right-arrow.png'),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '0%',
                      style: TextStyle(
                          color: AppTheme.kCustomnavGrayColor,
                          fontFamily: 'Poppins'),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
