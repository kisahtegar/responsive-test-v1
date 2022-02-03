import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

class Chart extends StatelessWidget {
  const Chart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 0, // merapatkan space
              centerSpaceRadius: 70,
              startDegreeOffset: -90,
              sections: pieChartSelectionDatas
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height:defaultPadding),
                Text(
                  '29,1',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        height: 0.5
                      ),
                ),
                const Text('of 128GB')
              ],
            )
          )
        ]
      ),
    );
  }
}

List<PieChartSectionData> get pieChartSelectionDatas {
  return [
    PieChartSectionData(
      color: primaryColor,
      showTitle: false,
      value: 25,
      radius: 25,
    ),
    PieChartSectionData(
      color: const Color(0xFF26E5FF),
      showTitle: false,
      value: 20,
      radius: 22,
    ),
    PieChartSectionData(
      color: const Color(0xFFFFCF26),
      showTitle: false,
      value: 10,
      radius: 19,
    ),
    PieChartSectionData(
      color: const Color(0xFFEE2727),
      showTitle: false,
      value: 15,
      radius: 16,
    ),
    PieChartSectionData(
      color: primaryColor.withOpacity(0.1),
      showTitle: false,
      value: 25,
      radius: 13
    ),
  ];
}