import 'package:flutter/material.dart';
import 'package:mbtmi/model/mbti_color.dart';
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
      _ChartData('ESTJ', 25),
      _ChartData('ISTJ', 38),
      _ChartData('ENFP', 34),
      _ChartData('ESFP', 52)
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
          pointColorMapper: (_ChartData data, _) => mbtiColor[data.x],
          xValueMapper: (_ChartData data, _) => data.x,
          yValueMapper: (_ChartData data, _) => data.y,
          dataLabelSettings: DataLabelSettings(isVisible: true),
        ),
      ],
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final int y;
}
