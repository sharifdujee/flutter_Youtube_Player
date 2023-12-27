
import 'package:Flutter_Library/Library/sector.dart';
import 'package:Flutter_Library/Widget/bottom_navigation.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


class PieChartWidget extends StatefulWidget {
  final List<Sector> sector;

  const PieChartWidget(this.sector, {Key? key}) : super(key: key);

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  late final String industrySector;
  List<Sector>? get sector => null;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(

          aspectRatio: 1.00,
          child: PieChart(PieChartData(
              sections: _chartSections(widget.sector), centerSpaceRadius: 48.0),
            swapAnimationCurve: Curves.linear,
            swapAnimationDuration: Duration(seconds: 10),


          ),

        ),
        Container(
          height: 50,
          child: BottomNavigationExample(),
        )
      ],
    );
  }

  List<PieChartSectionData> _chartSections(List<Sector> sectors) {
    final List<PieChartSectionData> list = [];
    for (var sector in sectors) {
      const double radius = 40.0;
      final data = PieChartSectionData(
        color: sector.color,
        value: sector.value,
        radius: radius,
        title: sector.title,
        titleStyle: TextStyle(
          fontSize: 8
        ),
        showTitle: true,


      );
      list.add(data);
    }
    return list;
  }
}