import 'package:app/models/trading_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../app_theme.dart';

class TradingContainer extends StatelessWidget {
  final TradingModel tradingList;
  const TradingContainer({required this.tradingList, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.8,
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
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      tradingList.pricePerShare,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        color: AppTheme.blackColor,
                        fontFamily: 'Poppins',
                      ),
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
                          tradingList.status,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 8,
                              fontFamily: 'Poppins',
                              color: AppTheme.kCustomnavGrayColor),
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
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
