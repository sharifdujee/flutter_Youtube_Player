
import 'package:Flutter_Library/Widget/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DivisionSelectionWidget extends StatefulWidget {
  @override
  _DivisionSelectionWidgetState createState() => _DivisionSelectionWidgetState();
}

class _DivisionSelectionWidgetState extends State<DivisionSelectionWidget> {
  String selectedDivision = 'Dhaka';
  String selectedSubDivision = 'Dhaka'; // Initialize with a valid value

  // Sample data, replace it with your actual data
  List<String> divisions = ['Dhaka',
    'Chittagong',
    'Sylhet',
    'MymenSingh',
    'Barishal',
    'Khulna',
    'Rajshahi',
    'RangPur'
  ];
  Map<String, List<String>> Flutter_Libraryt = {
    'Dhaka': ['Dhaka', 'NarayanGang', 'MunshiGang' 'MankiGong', 'Gazipur', 'Tangail', 'Narshandi', 'FaridPur', 'Madaripur','SheritPur'],
    'Chittagong': ['Chittagong', 'CoxBazar', 'Comilla', 'B-Baria', 'Feni', 'Nohakhali','Lakshmipur','Chandpur', 'Bandarban', "Khagrachori", 'RangaMati'],
    'Sylhet': ['Sylhet', 'SunamGang', 'HobiGang', 'MolibiBazar'],
    'MymenSingh': ['MymenSingh', 'Jamalpur','Sherpur','Netrokona'],
    'Barishal': ['Bhola', "Barishal", 'Pirojpur', 'PatuKhali' 'Jhalokati','Borguna'],
    'Khulna': ['Khulna', 'BagherHat', 'Sathkhira', 'Jessore', 'Magura', 'Jhenadhai', 'Narial', 'Khusthia', 'Chuadanga', 'MehurPur'],
    'Radjshahi' : ['Rajshahi', 'Pabna', 'Sirajgong', 'Bogura', 'Natore', 'Nagoan', 'JoyPurHat', 'Chapai Nawabganj'],
    'RangPur': ['RangPur', 'DinajPur', 'Kurigram', 'LalMonirHat', 'Thaukorgaon', 'Panchoghor','Gaibandha', 'Nilphamari']
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Division Selection'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // First Dropdown for Divisions
            DropdownButton<String>(
              value: selectedDivision,
              hint: Text('Select Division'),
              onChanged: (String? newValue) {
                setState(() {
                  selectedDivision = newValue!;
                  // Reset selectedSubDivision when a new division is selected
                  selectedSubDivision = Flutter_Libraryt[selectedDivision]?.first ?? '';
                });
              },
              items: divisions.map((String division) {
                return DropdownMenuItem<String>(
                  value: division,
                  child: Text(division),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            // Second Dropdown for Sub Divisions
            DropdownButton<String>(
              value: selectedSubDivision,
              dropdownColor: Colors.greenAccent,
              hint: Text('Choose Your District'),
              onChanged: (String? newValue) {
                setState(() {
                  selectedSubDivision = newValue!;
                });
              },
              items: Flutter_Libraryt[selectedDivision]?.map((String subDivision) {
                return DropdownMenuItem<String>(
                  value: subDivision,
                  child: Text(subDivision),
                );
              }).toList() ?? [],
            ),
            SizedBox(height: 20),
            // Display the selected values
            Text('Selected Division: $selectedDivision',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Gap(30),
            Text('Selected District: $selectedSubDivision',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w900,
                color: Colors.greenAccent,
              ),
            ),
            Container(
              height: 50,
              child: BottomNavigationExample(),
            )
          ],
        ),

      ),

    );
  }
}

