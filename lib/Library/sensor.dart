import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SensorExample extends StatefulWidget {
  const SensorExample({super.key});

  @override
  State<SensorExample> createState() => _SensorExampleState();
}

class _SensorExampleState extends State<SensorExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Badge(
          child: Icon(Icons.menu),
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    "Hello Circle Technology",
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    speed: Duration(seconds: 10),
                  )
                ],
                totalRepeatCount: 5,
                pause: Duration(seconds: 2),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
                isRepeatingAnimation: true,
                repeatForever: true,
              ),
              AnimatedTextKit(
                animatedTexts: [
                  FadeAnimatedText(
                    "Welcome The World of ERP",
                    textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  ScaleAnimatedText(
                    "Welcome to HRM Management System",
                    textStyle: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                    scalingFactor: 5,
                  )
                ],
              ),
              AnimatedTextKit(
                animatedTexts: [
                  RotateAnimatedText("Welcome"),
                  RotateAnimatedText("Java"),
                  RotateAnimatedText("World"),
                ],
                onTap: () {
                  print('Tap Event');
                },
              ),
              const SizedBox(),

              Gap(10),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'It is Not Enough To Do Your Best',
                    textStyle: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  TyperAnimatedText('you must know what to do,'),
                  TyperAnimatedText('and then do your best'),
                  TyperAnimatedText('- W.Edwards Deming'),
                ],
              ),
              AnimatedTextKit(animatedTexts: [
                ScaleAnimatedText("Welcome To"),
                ScaleAnimatedText("Annual Cake Festival"),
                ScaleAnimatedText('Organized By '),
                ScaleAnimatedText('Department of Psychology'),
                ScaleAnimatedText('University of Dhaka'),
              ]),
              AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText("Dhaka University"),
                ],
                isRepeatingAnimation: true,
              ),
              AnimatedTextKit(repeatForever: true, animatedTexts: [
                FlickerAnimatedText("Welcome To The University of Dhaka")
              ])


            ],
          ),
        ),
      ),
    );
  }
}
