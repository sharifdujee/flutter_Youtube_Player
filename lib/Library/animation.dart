
import 'package:Flutter_Library/Widget/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimationExample extends StatefulWidget {
  const AnimationExample({Key? key}) : super(key: key);

  @override
  State<AnimationExample> createState() => _AnimationExampleState();
}

class _AnimationExampleState extends State<AnimationExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.deepOrange,
      //Animate.restartOnHotReload = true;
      body: SingleChildScrollView(
        child: Column(
          children: [
            // AnimateList(
            //   interval: 400.ms,
            //   effects: FadeEffect(
            //     duration: 300.ms,
            //   ),
            //   children: [
            //     Text("Hello"),
            //     Text("Welcome"),
            //     Text("Good Bye"),
            //   ],
            // ),
            Animate(

              effects: [
                FadeEffect(),
                ScaleEffect(),
              ],
              child: Text("Hello Animation")
                  .animate()
                  .fade(delay: 500.ms)
                  .scale(duration: 300.ms)
                  .move(duration: 500.ms, delay: 300.ms, curve: Curves.linear)
              // .blurXY(duration: 500.ms)
                  .fadeIn(delay: 500.ms)
                  .fade(begin: 0.5)
              // .fade(end: .15)
                  .tint(
                curve: Curves.bounceInOut,
                color: Colors.lightGreenAccent,

              )
                  .then(duration: 500.ms)
                  .slide(curve: Curves.easeInCirc),
            ),
            Animate().toggle(
                builder: (_, value, __) => AnimatedContainer(
                    duration: 1.seconds,

                color: value? Colors.red: Colors.green,),

            ),
            Text("Before",
            ).animate()
                .swap(duration: 900.ms, builder: (_, __) => Text("After")),
            Text("Horrible Pulsing Text")
                .animate(onPlay: (controller) => controller.repeat(reverse: true))
                .fadeOut(curve: Curves.easeInOut),
            Text("Hello").animate().scale(delay: 200.ms, duration: 400.ms)
                .callback(callback: (_) => print('scale is done')),
            Text("Hello").animate().fadeIn(curve: Curves.easeOutExpo)
                .listen(callback: (value) => print('current opacity: $value')),

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
