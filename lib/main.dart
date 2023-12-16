import 'package:Division/Library/Barchart.dart';
import 'package:Division/Library/Divison.dart';
import 'package:Division/Library/Go_Route.dart';
import 'package:Division/Library/Slideable.dart';
import 'package:Division/Library/animation.dart';
import 'package:Division/Library/badge.dart';
import 'package:Division/Library/connectivity.dart';
import 'package:Division/Library/photview.dart';
import 'package:Division/Library/pi.dart';
import 'package:Division/Library/pichart.dart';
import 'package:Division/Library/price.dart';
import 'package:Division/Library/sector.dart';
import 'package:Division/Library/sensor.dart';
import 'package:Division/Library/url_launcher.dart';
import 'package:Division/Library/youtube_player.dart';
import 'package:Division/UI_Design/facebook_login.dart';
import 'package:Division/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}
final GoRouter _goRouter  = GoRouter(
    routes: <RouteBase> [
      GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state){
            return  GoRouteExample();
          },
      ),
      GoRoute(path: '/animation',
        builder: (BuildContext context, GoRouterState state){
          return  const AnimationExample();
        },

      ),
      GoRoute(path: '/pieChart',
        builder: (BuildContext context, GoRouterState state){
        return PiechartExampe1(industrySector);
        }
      ),
      GoRoute(path: '/division',
        builder: (BuildContext context, GoRouterState state){
        return DivisionSelectionWidget();
        }
      ),
      GoRoute(path: '/picChart1',
        builder: (BuildContext context, GoRouterState state){
        return PieChartWidget(industrySector);
        }
      ),
      GoRoute(path: '/barChart',
        builder: (BuildContext context , GoRouterState state){
        return BarChartWidget(points: pricePoints);
        }
      ),
      GoRoute(path: '/badge',
        builder: (BuildContext context, GoRouterState state){
        return const BadgeExample();
        }
      ),
      GoRoute(path: '/sensor',
      builder: (BuildContext  context, GoRouterState state ){
        return const SensorExample();
      }
      ),
      GoRoute(path: '/connectivity',
        builder: (BuildContext context, GoRouterState state){
        return const MyHomePage(title: 'Welcome to Home Page');
        }
      ),
      GoRoute(path: '/slide',
        builder: (BuildContext context, GoRouterState state){
        return const SlidableExample();
        }
      ),
      // GoRoute(path: '/url',
      //   builder: (BuildContext context, GoRouterState state){
      //   return const MyHomePage1(title: 'Dhaka University');
      //   }
      // ),
      GoRoute(path: '/youtube',
        builder: (BuildContext context, GoRouterState state){
        return const YouTubeVideoPlayerExample();
        }
      ),
      GoRoute(path: '/photo',
        builder: (BuildContext context, GoRouterState state){
        return const PhotoViewExample();
        }
      ),
      GoRoute(path: '/facebook',
      builder: (BuildContext context, GoRouterState state){
        return const FacebookLoginScreen();
      }
      ),



          ],



);



class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _goRouter,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
     // home:  PieChartWidget(industrySector),
     // home:  PiechartExampe1(industrySector),
      //home:  DivisionSelectionWidget(),
      //home:  BarChartWidget(points: pricePoints),
      //home: const AnimationExample(),
      //home: const GoRouteExample(),

     // home: const BarChartExample()

    );
  }
}
