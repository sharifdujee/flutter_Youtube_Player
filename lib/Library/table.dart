import 'package:flutter/material.dart';

import 'editable_table.dart';
import 'expendable_table.dart';
class TableExample extends StatefulWidget {
  const TableExample({super.key});

  @override
  State<TableExample> createState() => _TableExampleState();
}

class _TableExampleState extends State<TableExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Table Example"),
        backgroundColor: Colors.orange,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Table(
              border: TableBorder(
                borderRadius: BorderRadius.circular(5),
                bottom: BorderSide(
                  width: 5,
                  color: Colors.yellow,
                  style: BorderStyle.solid,
                  strokeAlign: 5,
                ),
                top: BorderSide(width: 5),
                left: BorderSide(width: 5),
                right: BorderSide(width: 5),
              ),
              columnWidths: const <int, TableColumnWidth>{
                0: IntrinsicColumnWidth(),
                1: FlexColumnWidth(),
                2: FixedColumnWidth(64),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: <TableRow>[
                TableRow(children: <Widget>[
                  Container(
                    height: 32,
                    color: Colors.red,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      width: 32,
                      height: 32,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 50,
                    color: Colors.blue,
                  ),
                ]),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DataTableExample(),
                  ),
                );
              },
              child: const Text('Data Table '),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExpendableTableExample(),
                  ),
                );
              },
              child: const Text('Expendable Table'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage1( title: '',),
                  ),
                );
              },
              child: const Text('Expendable Table'),
            ),
          ],
        ),
      ),
    );
  }
}


class DataTableExample extends StatefulWidget {
  const DataTableExample({super.key});

  @override
  State<DataTableExample> createState() => _DataTableExampleState();
}

class _DataTableExampleState extends State<DataTableExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Table Example"),
      ),
      body: DataTable(
          columns: const <DataColumn>[


        DataColumn(

            label: Expanded(
          child: const Text(
            'Name',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        )),
        DataColumn(
            label: Expanded(
                child: const Text(
          'Age',
          style: TextStyle(fontStyle: FontStyle.italic),
        ))),
        DataColumn(
            label: Expanded(
                child: const Text(
                  'Action',
                  style: TextStyle(fontStyle: FontStyle.italic),
                )))
      ], rows: const <DataRow>[
        DataRow(cells: <DataCell>[
          DataCell(Text('Robayet Bin Raht')),
          DataCell(Text('25')),
          DataCell(Text('Go To'))
        ])

      ]),

    );
  }
}

