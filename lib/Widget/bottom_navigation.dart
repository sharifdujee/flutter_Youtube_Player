import 'package:Division/Library/Go_Route.dart';
import 'package:flutter/material.dart';
class BottomNavigationExample extends StatefulWidget {
  const BottomNavigationExample({super.key});

  @override
  State<BottomNavigationExample> createState() => _BottomNavigationExampleState();
}

class _BottomNavigationExampleState extends State<BottomNavigationExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => GoRouteExample() ));

        }, child: Text("Go To Home"),

        ),
      ),
    );
  }
}
