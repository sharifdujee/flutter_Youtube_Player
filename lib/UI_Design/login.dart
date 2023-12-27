import 'package:flutter/material.dart';
import 'package:gap/gap.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title: Text(
          textAlign: TextAlign.end,
          'Skip',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 414,
              child: Center(
                child: Image(
                    image: NetworkImage(
                        'https://as2.ftcdn.net/v2/jpg/02/01/64/19/1000_F_201641952_00w2boeW7cLXoFHtLSgL3EX3z6rTUHjK.jpg'),

                ),
              ),
            ),
            Gap(10),
            Container(
              height: 200,
              child: Center(
                child: Text('Enjoy Your \n Life With Planets',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            Gap(1),
            Container(
              child: Center(
                child: FloatingActionButton(onPressed: (){},
                autofocus: true,
                  shape: CircleBorder(
                  ),
                  backgroundColor: Colors.greenAccent,
                child: Icon(Icons.arrow_forward,
                  size: 40,
                ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }

}
