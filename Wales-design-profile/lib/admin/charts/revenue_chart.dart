import 'package:app/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RevenueChart extends StatefulWidget {
  const RevenueChart({super.key});

  @override
  State<RevenueChart> createState() => _RevenueChartState();
}

class _RevenueChartState extends State<RevenueChart> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(01, 35),
      ChartData(05, 13),
      ChartData(09, 34),
      ChartData(13, 27),
      ChartData(17, 40)
    ];
    final List<ChartData> chartDataDashed = [
      ChartData(01, 40),
      ChartData(05, 27),
      ChartData(09, 34),
      ChartData(13, 19),
      ChartData(17, 35)
    ];
    return Container(
        child: SfCartesianChart(
            primaryXAxis: const CategoryAxis(
              axisLine: AxisLine(width: 0),
              isVisible: true,
              majorGridLines: MajorGridLines(width: 0),
              labelPosition: ChartDataLabelPosition.outside,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            primaryYAxis: const CategoryAxis(
                axisLine: AxisLine(width: 0),
                isVisible: true,
                majorGridLines: MajorGridLines(
                    width: 0.7, color: AppTheme.kCustomgraphLinesColor)),
            plotAreaBorderWidth: 0,
            backgroundColor: AppTheme.greyShadeColor,
            series: <CartesianSeries>[
          SplineSeries<ChartData, int>(
              dataSource: chartDataDashed,
              dashArray: const <double>[5, 5],
              color: AppTheme.kCustomDashgraphColor,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y),
          SplineSeries<ChartData, int>(
              dataSource: chartData,
              color: AppTheme.kCustomprogressColor,
              splineType: SplineType.cardinal,
              cardinalSplineTension: 0.9,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y)
        ]));
  }
}

class ChartData {
  ChartData(
    this.x,
    this.y,
  );
  final int x;
  final double y;
}
