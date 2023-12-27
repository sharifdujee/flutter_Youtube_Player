import 'package:Flutter_Library/Library/OnlineTest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_table/flutter_expandable_table.dart';
class ExpendableTableExample extends StatefulWidget {
  const ExpendableTableExample({super.key});

  @override
  State<ExpendableTableExample> createState() => _ExpendableTableExampleState();
}

class _ExpendableTableExampleState extends State<ExpendableTableExample> {
  _buildCell(String content, {CellBuilder? builder}){
    return ExpandableTableCell(
      child: builder!= null ? null
          : DefaultCellCard(
          child: Center(
            child: Text(
              content,
              style: TextStyle(),
            ),

          ),
      ),
      builder: builder,
    );
  }
  ExpandableTableCell _buildFirstRowCell(){
    return ExpandableTableCell(
      builder: (context, details) => DefaultCellCard(child:
      Padding(padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          children: [
            SizedBox(
              width: 24* details.row!.address.length.toDouble(),
              child: details.row?.children!= null? Align(
                alignment: Alignment.centerRight,
                child: AnimatedRotation(
                    turns: details.row?.childrenExpanded == true? 0.25: 0,
                    duration: const Duration(microseconds: 500),
                  child: const Icon(Icons.keyboard_arrow_right,
                  color: Colors.white,
                  ),
                ),

              )
                  : null

            ),
            Text('${details.row!.address.length>1? details.row!.address.skip(1).map((e) => 'sub').join(): ''} Row${details.row!.address.last}',
              style: TextStyle(),

            ),


          ],
        ),
      ),
      ),
    );

  }

  ExpandableTable _buildSimpleTable(){
    const int columnCount = 20;
    const int rowCount = 20;
    List<ExpandableTableHeader> headers = List.generate(
        columnCount -1,
            (index) => ExpandableTableHeader(cell: _buildCell('Column$index')));

    List<ExpandableTableRow> rows = List.generate(
        rowCount,
            (rowIndex) => ExpandableTableRow(
              height: rowIndex%2 == 0? 50:70,
                firstCell: _buildCell('Row $rowIndex'),
            cells: List<ExpandableTableCell>.generate(
                columnCount-1,
                    (columnIndex) => _buildCell('Cell$rowIndex : $columnIndex'))));
    return ExpandableTable(
      firstHeaderCell: _buildCell('Simple\n Table'),
      headers: headers,
      rows: rows,
    );
  }
  static const int columnsCount = 10;
  static const int subColumnsCount = 2;
  static const int rowsCount = 6;
  static const int subRowsCount = 3;
  static const int totalColumns = columnsCount + subColumnsCount;

  List<ExpandableTableRow> _generateRows(int quantity, {int depth = 0}) {
    bool generateLegendRow = (depth == 0 || depth == 2);
    return List.generate(
      quantity,
          (rowIndex) => ExpandableTableRow(
        firstCell: _buildFirstRowCell(),
        children: ((rowIndex == 3 || rowIndex == 2) && depth < 3)
            ? _generateRows(subRowsCount, depth: depth + 1)
            : null,
        cells: !(generateLegendRow && (rowIndex == 3 || rowIndex == 2))
            ? List<ExpandableTableCell>.generate(
          totalColumns,
              (columnIndex) => _buildCell('Cell $rowIndex:$columnIndex'),
        )
            : null,
        legend: generateLegendRow && (rowIndex == 3 || rowIndex == 2)
            ? const DefaultCellCard(
          child: Align(
            alignment: FractionalOffset.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 24.0),
              child: Text(
                'This is row legend',
                style: textStyle,
              ),
            ),
          ),
        )
            : null,
      ),
    );
  }

  ExpandableTable _buildExpandableTable() {
    // Creation header
    List<ExpandableTableHeader> subHeader = List.generate(
      subColumnsCount,
          (index) => ExpandableTableHeader(
        cell: _buildCell('Sub Column $index'),
      ),
    );

    // Custom header names for the main headers
    List<String> mainHeaderNames = [
      'Expandable\nColumn',
      'Custom Name 1',
      'Custom Name 2',
      'Custom Name 3',
      'Custom Name 4',
      'Custom Name 5',
      'Custom Name 6',
    ];

    // Creation header
    List<ExpandableTableHeader> headers = List.generate(
      columnsCount,
          (index) => ExpandableTableHeader(
          cell: _buildCell('${index < mainHeaderNames.length ? mainHeaderNames[index] : 'Default Name $index'}'),
          children: index == 1 ? subHeader : null),
    );

    return ExpandableTable(
      firstHeaderCell: _buildCell('Expandable\nTable'),
      rows: _generateRows(rowsCount),
      headers: headers,
      defaultsRowHeight: 200,
      defaultsColumnWidth: 300,
      firstColumnWidth: 250,
      scrollShadowColor: Colors.yellow,
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text('Expandable Tables'),
        centerTitle: true,

      ),
      body: SingleChildScrollView(
        child: Container(
          height: 500,
          child: Row(
            children: [
              /*Expanded(
                  child: Padding(padding: const EdgeInsets.all(20.0),
              child: _buildSimpleTable(),
                  ),
              ),*/
              Expanded(child: Padding(padding: const EdgeInsets.all(20.0),
              child: _buildExpandableTable(),))
            ],
          ),




        ),
      ),



    );
  }
}



