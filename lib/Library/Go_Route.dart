import 'package:Division/Library/animation.dart';
import 'package:Division/Library/pi.dart';
import 'package:Division/Library/sector.dart';
import 'package:Division/Widget/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class GoRouteExample extends StatefulWidget {
    GoRouteExample({Key? key}): super(key: key);


  final GoRouter _goRouter  = GoRouter(
      routes: <RouteBase> [
        GoRoute(
            path: '/',
            builder: (BuildContext context, GoRouterState state){
              return   GoRouteExample();
            },
            // routes:  <RouteBase> [
            //   GoRoute(path: 'PiechartExampe1',
            //       builder: (BuildContext context, GoRouterState state){
            //         return  PiechartExampe1(industrySector);
            //       }
            //   ),
            // ]
        )
      ]

  );
  @override
  State<GoRouteExample> createState() => _GoRouteExampleState();
}


class _GoRouteExampleState extends State<GoRouteExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: Badge(
          child: Icon(Icons.menu),
        ),
        title: Text('Go Router Example'),
      ),

      body: SingleChildScrollView(

        child: Container(
          child: Column(
            children: [
              ElevatedButton(onPressed: () => context.go('/animation'),
                  child: Text('Go To Animation',
                    style:  GoogleFonts.lato(),
                  ),
              ),
              Gap(5),
              ElevatedButton(onPressed: () => context.go('/pieChart'),
                  child: Text('Go To The PicChart',
                    style: GoogleFonts.aBeeZee(
                      textStyle: TextStyle(
                        letterSpacing: 5,
                      )
                    ),
                  )
              ),
              Gap(5),
              ElevatedButton(onPressed: () => context.go('/picChart1'),
                  child: Text('Go To The Second PieChart',
                  style: GoogleFonts.baiJamjuree(
                    textStyle: Theme.of(context).textTheme.headlineSmall,
                  ),

                  )
              ),
              Gap(5),
              ElevatedButton(onPressed: () => context.go('/division'),
                  child: Text('Go To The Division List',
                  style: GoogleFonts.lobster(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                  ),)
              ),
              Gap(5),
              ElevatedButton(onPressed: () => context.go('/barChart'),
                  child: Text('Go To The Bar Chart')
              ),
              Gap(5),
              ElevatedButton(onPressed: () => context.go('/badge'),
                  child: Text('Go The Badge')
              ),
              Gap(5),
              ElevatedButton(onPressed: () => context.go('/sensor'),
                  child: Text('Go The Sensor')
              ),
              Gap(5),
              ElevatedButton(onPressed: () => context.go('/connectivity'),
                  child: Text('Go The Connectivity Page ')
              ),
              Gap(10),
              ElevatedButton(onPressed: () => context.go('/slide'),
                  child: Text('Go The Slider Page ')
              ),
              Gap(10),
              // ElevatedButton(onPressed: () => context.go('/url'),
              //     child: Text('Go The Url_Launcher Page ')
              // ),
              Gap(10),
              ElevatedButton(onPressed: () => context.go('/youtube'),
                  child: Text('Go The YouTube Video Player Page ')
              ),
              Gap(10),
              ElevatedButton(onPressed: () => context.go('/photo'),
                  child: Text('Go The Photo View Page ')
              ),
              Gap(10),

              Container(
                height: 500,
                child: BottomNavigationExample(),
              ),
              Row(

                children: [
                  Badge(
                    backgroundColor: Colors.green,
                    child: Icon(Icons.notifications_active),
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),

                  Gap(15),
                  Badge(
                    child: Icon(Icons.home),
                  ),

                ],

              ),
              Padding(padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 10,
                        child: Icon(Icons.message),
                        color: Colors.blueGrey,

                      ),
                    )
                  ],
                ),
              ),



            ],

          ),
        ),
      ),

    );
  }
}
