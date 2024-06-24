import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:kasir_app/features/income/data/models/daily_income_model.dart';

class MonthlyIncomeChart extends StatelessWidget {
  final List<DailyIncome> dailyIncome;

  const MonthlyIncomeChart({Key? key, required this.dailyIncome})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: false),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 22,
                getTitlesWidget: bottomTitleWidgets,
                interval: 5,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: leftTitleWidgets,
                reservedSize: 28,
                interval: 1000,
              ),
            ),
            topTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: true),
          minX: 1,
          maxX: dailyIncome.length.toDouble(),
          minY: 0,
          maxY: dailyIncome
              .map((e) => e.total.toDouble())
              .reduce((a, b) => a > b ? a : b),
          lineBarsData: [
            LineChartBarData(
              spots: dailyIncome.asMap().entries.map((entry) {
                return FlSpot(
                    entry.key.toDouble() + 1, entry.value.total.toDouble());
              }).toList(),
              isCurved: true,
              color: Colors.blue,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    if (value.toInt() % 5 == 0) {
      text = Text('${value.toInt()}', style: style);
    } else {
      text = const Text('');
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff67727d),
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    if (value % 1000 == 0) {
      text = '${value ~/ 1000}k';
    } else {
      return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }
}
