import 'package:app/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PropertyDetailChart extends StatefulWidget {
  const PropertyDetailChart({super.key});

  @override
  State<PropertyDetailChart> createState() => _PropertyDetailChartState();
}

class _PropertyDetailChartState extends State<PropertyDetailChart> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('China', 12, 10, 14, 20),
      ChartData('USA', 14, 11, 18, 23),
      ChartData('UK', 16, 10, 15, 20),
      ChartData('Brazil', 18, 16, 18, 24)
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
                majorGridLines: MajorGridLines(width: 0.7)),
            plotAreaBorderWidth: 0,
            backgroundColor: AppTheme.greyShadeColor,
            series: <CartesianSeries>[
          StackedColumnSeries<ChartData, String>(
              dataSource: chartData,
              color: AppTheme.kCustomstackedOrangegraphColor,
              width: 0.2,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y2),
          StackedColumnSeries<ChartData, String>(
              dataSource: chartData,
              width: 0.2,
              color: AppTheme.kCustomstackedgraphColor,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y3),
        ]));
  }
}

class ChartData {
  ChartData(this.x, this.y1, this.y2, this.y3, this.y4);
  final String x;
  final double y1;
  final double y2;
  final double y3;
  final double y4;
}
