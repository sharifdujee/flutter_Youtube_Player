import 'package:flutter/material.dart';
class BadgeExample extends StatefulWidget {
  const BadgeExample({super.key});

  @override
  State<BadgeExample> createState() => _BadgeExampleState();
}

class _BadgeExampleState extends State<BadgeExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Badge(
          backgroundColor: Colors.green,
          smallSize: 15,
          child: Icon(Icons.menu),
        ),

      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Badge(
                      backgroundColor: Colors.yellow,
                      child: Icon(Icons.shopping_cart,
                        size: 150,
                      ),
                      smallSize: 50,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}
