import 'package:expense_tracker/bar%20graph/individual_bar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyBarGraph extends StatefulWidget {
  final List<double> monthlySummary;
  final int startMonth;

  const MyBarGraph({
    super.key,
    required this.monthlySummary,
    required this.startMonth,
  });

  @override
  State<MyBarGraph> createState() => _MyBarGraphState();
}

class _MyBarGraphState extends State<MyBarGraph> {
  //hold the data for each bar
  List<IndividualBar> barData = [];

  //initialize bar data
  void initializeBarData() {
    barData = List.generate(
      widget.monthlySummary.length,
      (index) => IndividualBar(
        x: index,
        y: widget.monthlySummary[index],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    initializeBarData();
    return BarChart(
      BarChartData(
        minY: 0,
        maxY: 200,
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: const FlTitlesData(
          show: true,
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: getBottomTitles,
              //TODO getBottomTitles neden aşağıdaki parametreleri almıyo?
              reservedSize: 24,
            ),
          ),
        ),
        barGroups: barData
            .map(
              (data) => BarChartGroupData(
                x: data.x,
                barRods: [
                  BarChartRodData(toY: data.y),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  const textStyle = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );

  String text;
  switch (value.toInt()) {
    case 0:
      text = 'OC';
      break;
    case 1:
      text = 'ŞU';
      break;
    case 2:
      text = 'MA';
      break;
    case 3:
      text = 'Nİ';
      break;
    case 4:
      text = 'MA';
      break;
    case 5:
      text = 'HA';
      break;
    case 6:
      text = 'TE';
      break;
    case 7:
      text = 'AĞ';
      break;
    case 8:
      text = 'EY';
      break;
    case 9:
      text = 'EK';
      break;
    case 10:
      text = 'KA';
      break;
    case 11:
      text = 'AR';
      break;
    default:
      text = '';
      break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: Text(
      text,
      style: textStyle,
    ),
  );
}