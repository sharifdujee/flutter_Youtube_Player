import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavigationButtonExample extends StatefulWidget {
  const BottomNavigationButtonExample({super.key});

  @override
  State<BottomNavigationButtonExample> createState() => _BottomNavigationButtonExampleState();
}

class _BottomNavigationButtonExampleState extends State<BottomNavigationButtonExample> {
  var _currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }

  Widget _buttomNavigation (BuildContext context){
    var _currentIndex = 0;
    final iconList = <IconData>[
      Icons.brightness_5,
      Icons.brightness_4,
      Icons.brightness_6,
      Icons.brightness_7,
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

            ],

          ),

        ),

      ),
      floatingActionButton: FloatingActionButton(onPressed: (){}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: iconList,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.smoothEdge,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          activeIndex: _currentIndex,
          onTap: (index){
            setState(() {
              _currentIndex = index;
            });
          }),


    );
  }
}
