import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DoughnutChart extends StatefulWidget {
  const DoughnutChart({Key? key}) : super(key: key);

  @override
  State<DoughnutChart> createState() => _DoughnutChartState();
}

class _DoughnutChartState extends State<DoughnutChart> {
  late List<_ChartData> chartData;
  void initState() {
    chartData = [
      _ChartData('David', 25, Color.fromRGBO(9, 0, 136, 1)),
      _ChartData('Steve', 38, Color.fromRGBO(147, 0, 119, 1)),
      _ChartData('Jack', 34, Color.fromRGBO(228, 0, 124, 1)),
      _ChartData('Others', 52, Color.fromRGBO(255, 189, 57, 1))
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      legend: Legend(isVisible: true),
      series: <CircularSeries>[
        DoughnutSeries<_ChartData, String>(
          selectionBehavior: SelectionBehavior(enable: true),
          dataSource: chartData,
          pointColorMapper: (_ChartData data, _) => data.color,
          xValueMapper: (_ChartData data, _) => data.x,
          yValueMapper: (_ChartData data, _) => data.y,
          dataLabelSettings: DataLabelSettings(isVisible: true),
        ),
      ],
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y, this.color);

  final String x;
  final int y;
  final Color color;
}
