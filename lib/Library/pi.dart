import 'package:Division/Library/sector.dart';
import 'package:Division/Widget/bottom_navigation.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PiechartExampe1 extends StatefulWidget {
  final List<Sector> sector;
  const PiechartExampe1(this.sector, {Key? key}) : super(key: key);

  @override
  State<PiechartExampe1> createState() => _PiechartExampe1State();
}

class _PiechartExampe1State extends State<PiechartExampe1> {
  late final String industrySector;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Text(
                "Sector Wise Data",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.red,
                ),
              ),
              _buildPieChartSection(0),
              _buildPieChartSection(1),
              _buildPieChartSection(2),
              Container(
                height: 50,
                child: BottomNavigationExample(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPieChartSection(int sectionIndex) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20, left: 100),
          height: 300,
          width: 200,
          child: PieChart(
            PieChartData(sections: [
              PieChartSectionData(
                value: widget.sector[sectionIndex * 4].value,
                title: widget.sector[sectionIndex * 4].title,
                color: widget.sector[sectionIndex * 4].color,
                showTitle: true,
              ),
              PieChartSectionData(
                value: widget.sector[sectionIndex * 4 + 1].value,
                title: widget.sector[sectionIndex * 4 + 1].title,
                color: widget.sector[sectionIndex * 4 + 1].color,
                showTitle: true,
              ),
              PieChartSectionData(
                value: widget.sector[sectionIndex * 4 + 2].value,
                title: widget.sector[sectionIndex * 4 + 2].title,
                color: widget.sector[sectionIndex * 4 + 2].color,
                showTitle: true,
              ),
              PieChartSectionData(
                value: widget.sector[sectionIndex * 4 + 3].value,
                title: widget.sector[sectionIndex * 4 + 3].title,
                color: widget.sector[sectionIndex * 4 + 3].color,
                showTitle: true,
              ),
            ]),
          ),
        ),



      ],
   );
  }
}
