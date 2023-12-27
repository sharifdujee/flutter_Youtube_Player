import 'package:flutter/material.dart';
import 'package:flutter_editable_table/constants.dart';
import 'package:flutter_editable_table/entities/table_entity.dart';
import 'package:flutter_editable_table/flutter_editable_table.dart';


class MyHomePage1 extends StatefulWidget {
  MyHomePage1({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage1> {
  final _editableTableKey = GlobalKey<EditableTableState>();
  final data = {
    "column_count": null,
    "row_count": null,
    "addable": true,
    "removable": true,
    "caption": {
      "layout_direction": "row",
      "main_caption": {
        "title": "Caption",
        "display": true,
        "editable": false,
        "style": {
          "font_weight": "bold",
          "font_size": 18.0,
          "font_color": "#333333",
          "background_color": null,
          "horizontal_alignment": "center",
          "vertical_alignment": "center",
          "text_align": "center"
        }
      },
      "sub_caption": {
        "title": null,
        "display": true,
        "editable": true,
        "input_decoration": {
          "min_lines": 1,
          "max_lines": 1,
          "max_length": 64,
          "hint_text": "Please input the sub-caption",
          "fill_color": null
        },
        "constrains": {"required": true},
        "style": {
          "font_weight": "normal",
          "font_size": 14.0,
          "font_color": "#333333",
          "background_color": null,
          "horizontal_alignment": "center",
          "vertical_alignment": "center",
          "text_align": "center"
        }
      }
    },
    "columns": [
      {
        "primary_key": true,
        "name": "id",
        "type": "int",
        "format": null,
        "description": null,
        "display": false,
        "editable": false,
        "style": {
          "font_weight": "bold",
          "font_size": 14.0,
          "font_color": "#333333",
          "background_color": "#b5cfd2",
          "horizontal_alignment": "center",
          "vertical_alignment": "center",
          "text_align": "center"
        }
      },
      {
        "auto_increase": true,
        "type": "int",
        "format": "Step __VALUE__",
        "description": null,
        "display": true,
        "editable": false,
        "width_factor": 0.2,
        "style": {
          "font_weight": "bold",
          "font_size": 14.0,
          "font_color": "#333333",
          "background_color": "#b5cfd2",
          "horizontal_alignment": "center",
          "vertical_alignment": "center",
          "text_align": "center"
        }
      },
      {
        "name": "name",
        "title": "Name",
        "type": "string",
        "format": null,
        "description": "User Name",
        "display": true,
        "editable": true,
        "width_factor": 0.4,
        "input_decoration": {
          "min_lines": 1,
          "max_lines": 1,
          "max_length": 128,
          "hint_text": "Please input the name"
        },
        "constrains": {"required": true},
        "style": {
          "font_weight": "bold",
          "font_size": 14.0,
          "font_color": "#333333",
          "background_color": "#b5cfd2",
          "horizontal_alignment": "center",
          "vertical_alignment": "center",
          "text_align": "center"
        }
      },
      {
        "name": "age",
        "title": "Age",
        "type": "integer",
        "format": null,
        "description": "Age",
        "display": true,
        "editable": true,
        "width_factor": 0.2,
        "input_decoration": {
          "min_lines": 1,
          "max_lines": 1,
          "max_length": 3,
          "hint_text": "Please input the age"
        },
        "constrains": {"required": true, "minimum": 1, "maximum": 120},
        "style": {
          "font_weight": "bold",
          "font_size": 14.0,
          "font_color": "#333333",
          "background_color": "#b5cfd2",
          "horizontal_alignment": "center",
          "vertical_alignment": "center",
          "text_align": "center"
        }
      },
      {
        "name": "desc",
        "title": "Description",
        "type": "string",
        "format": null,
        "description": "Description",
        "display": true,
        "editable": true,
        "width_factor": 0.4,
        "input_decoration": {
          "min_lines": 3,
          "max_lines": 5,
          "max_length": 128,
          "hint_text": "Please input the description"
        },
        "constrains": {"required": false, "minimum": 1, "maximum": 100},
        "style": {
          "font_weight": "bold",
          "font_size": 14.0,
          "font_color": "#333333",
          "background_color": "#b5cfd2",
          "horizontal_alignment": "center",
          "vertical_alignment": "center",
          "text_align": "center"
        }
      },
      {
        "name": "salary",
        "title": "Salary",
        "type": "float",
        "format": null,
        "description": "Salary",
        "display": true,
        "editable": true,
        "width_factor": 0.2,
        "input_decoration": {
          "min_lines": 1,
          "max_lines": 1,
          "max_length": 128,
          "hint_text": "Please input the salary"
        },
        "constrains": {"required": true, "minimum": -100, "maximum": 10000},
        "style": {
          "font_weight": "bold",
          "font_size": 14.0,
          "font_color": "#333333",
          "background_color": "#b5cfd2",
          "horizontal_alignment": "center",
          "vertical_alignment": "center",
          "text_align": "center"
        }
      },
      {
        "name": "married",
        "title": "Married",
        "type": "bool",
        "format": null,
        "description": "Is married?",
        "display": true,
        "editable": true,
        "width_factor": 0.12,
        "constrains": {"required": false},
        "style": {
          "font_weight": "bold",
          "font_size": 14.0,
          "font_color": "#333333",
          "background_color": "#b5cfd2",
          "horizontal_alignment": "center",
          "vertical_alignment": "center",
          "text_align": "center"
        }
      },
      {
        "name": "d_o_m",
        "title": "Date Of Marriage",
        "type": "date",
        "format": null,
        "description": "Date Of Marriage",
        "display": true,
        "editable": true,
        "width_factor": 0.3,
        "input_decoration": {"hint_text": "Please input the date of marriage"},
        "style": {
          "font_weight": "bold",
          "font_size": 14.0,
          "font_color": "#333333",
          "background_color": "#b5cfd2",
          "horizontal_alignment": "center",
          "vertical_alignment": "center",
          "text_align": "center"
        }
      },
      {
        "name": "l_s_t",
        "title": "Last Shopping Time",
        "type": "datetime",
        "format": null,
        "description": "Last Shopping Time",
        "display": true,
        "editable": true,
        "width_factor": 0.5,
        "input_decoration": {
          "hint_text": "Please input your last shopping time"
        },
        "constrains": {"required": true},
        "style": {
          "font_weight": "bold",
          "font_size": 14.0,
          "font_color": "#333333",
          "background_color": "#b5cfd2",
          "horizontal_alignment": "center",
          "vertical_alignment": "center",
          "text_align": "center"
        }
      }
    ],
    "rows": [
      {
        "id": 0,
        "name": "Tom",
        "age": 18,
        "desc": "I'm Tom, Tom, Tom",
        "salary": 1000.5,
        "married": false,
        "d_o_m": null,
        "l_s_t": null
      },
      {
        "id": 1,
        "name": "Sam",
        "age": 20,
        "desc": null,
        "salary": 1234.5,
        "married": false,
        "d_o_m": null,
        "l_s_t": "2021-06-23 11:28"
      },
      {
        "id": 2,
        "name": "Olivia",
        "age": 25,
        "desc": null,
        "salary": 2500.0,
        "married": true,
        "d_o_m": "2020-10-01",
        "l_s_t": "2021-01-08 20:20"
      },
      {
        "id": 3,
        "name": "Liam",
        "age": 23,
        "desc": null,
        "salary": 3000.0,
        "married": true,
        "d_o_m": "2018-08-01",
        "l_s_t": "2021-11-11 18:10"
      },
      {
        "id": 4,
        "name": "David",
        "age": 26,
        "desc": null,
        "salary": 2300.0,
        "married": true,
        "d_o_m": "2019-03-05",
        "l_s_t": "2021-12-08 21:30"
      },
    ],
    "footer": {
      "layout_direction": "row",
      "content": [
        {
          "title": "Average Age: 22.4",
          "display": true,
          "editable": false,
          "style": {
            "font_weight": "normal",
            "font_size": 14.0,
            "font_color": "#333333",
            "background_color": null,
            "horizontal_alignment": "center",
            "vertical_alignment": "center",
            "text_align": "center"
          }
        },
        {
          "title": "Married: 3",
          "display": true,
          "editable": false,
          "style": {
            "font_weight": "normal",
            "font_size": 14.0,
            "font_color": "#333333",
            "background_color": null,
            "horizontal_alignment": "center",
            "vertical_alignment": "center",
            "text_align": "center"
          }
        },
        {
          "title": null,
          "display": true,
          "editable": true,
          "input_decoration": {
            "min_lines": 1,
            "max_lines": 1,
            "max_length": 64,
            "hint_text": "Please input identity",
            "fill_color": null
          },
          "constrains": {"required": true},
          "style": {
            "font_weight": "normal",
            "font_size": 14.0,
            "font_color": "#333333",
            "background_color": null,
            "horizontal_alignment": "center",
            "vertical_alignment": "center",
            "text_align": "center"
          }
        }
      ]
    }
  };

  bool editing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.print),
          onPressed: () {
            print(_editableTableKey.currentState?.currentData);
          },
        ),
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
              _editableTableKey.currentState?.addRow();
            },
            child: Icon(Icons.add),
          ),
          SizedBox(width: 8.0),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
              _editableTableKey.currentState?.readOnly = editing;
              setState(() {
                editing = !editing;
              });
              if (!editing) {
                print(
                    'table filling status: ${_editableTableKey.currentState?.currentData.isFilled}');
              }
            },
            child: Icon(!editing ? Icons.edit : Icons.check),
          ),
          SizedBox(width: 14.0),
        ],
      ),
      body: SingleChildScrollView(
        child: EditableTable(
          key: _editableTableKey,
          data: data,
          entity: TableEntity.fromJson(data),
          readOnly: true,
          tablePadding: EdgeInsets.all(8.0),
          captionBorder: Border(
            top: BorderSide(color: Color(0xFF999999)),
            left: BorderSide(color: Color(0xFF999999)),
            right: BorderSide(color: Color(0xFF999999)),
          ),
          headerBorder: Border.all(color: Color(0xFF999999)),
          rowBorder: Border.all(color: Color(0xFF999999)),
          footerBorder: Border.all(color: Color(0xFF999999)),
          removeRowIcon: Icon(
            Icons.remove_circle_outline,
            size: 24.0,
            color: Colors.redAccent,
          ),
          addRowIcon: Icon(
            Icons.add_circle_outline,
            size: 24.0,
            color: Colors.white,
          ),
          addRowIconContainerBackgroundColor: Colors.blueAccent,
          formFieldAutoValidateMode: AutovalidateMode.always,
          onRowRemoved: (row) {
            print('row removed: ${row.toString()}');
          },
          onRowAdded: () {
            print('row added');
          },
          onFilling: (FillingArea area, dynamic value) {
            print('filling: ${area.toString()}, value: ${value.toString()}');
          },
          onSubmitted: (FillingArea area, dynamic value) {
            print('submitted: ${area.toString()}, value: ${value.toString()}');
          },
        ),
      ),
    );
  }
}