import 'package:Flutter_Library/Library/Barchart.dart';
import 'package:Flutter_Library/Library/Divison.dart';
import 'package:Flutter_Library/Library/Go_Route.dart';
import 'package:Flutter_Library/Library/Slideable.dart';
import 'package:Flutter_Library/Library/animation.dart';
import 'package:Flutter_Library/Library/badge.dart';
import 'package:Flutter_Library/Library/connectivity.dart';
import 'package:Flutter_Library/Library/connectivity_check.dart';
import 'package:Flutter_Library/Library/device_info.dart';
import 'package:Flutter_Library/Library/login.dart';
import 'package:Flutter_Library/Library/photview.dart';
import 'package:Flutter_Library/Library/pichart.dart';
import 'package:Flutter_Library/Library/price.dart';
import 'package:Flutter_Library/Library/qr_Code.dart';
import 'package:Flutter_Library/Library/qr_codeScanner.dart';
import 'package:Flutter_Library/Library/sector.dart';
import 'package:Flutter_Library/Library/sensor.dart';
import 'package:Flutter_Library/Library/table.dart';
import 'package:Flutter_Library/Library/url_launcher.dart';
import 'package:Flutter_Library/Library/youtube_player.dart';
import 'package:Flutter_Library/UI_Design/facebook_login.dart';
import 'package:Flutter_Library/UI_Design/search.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'Library/pi.dart';
import 'firebase_options.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', 'high_importance_notification',
    description: 'This channel was used for importance notification',
    importance: Importance.high,
    playSound: true);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up: ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, badge: true, sound: true);

  runApp(const MyApp());
}

final GoRouter _goRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return GoRouteExample();
      },
    ),
    GoRoute(
        path: '/route',
        builder: (BuildContext context, GoRouterState state) {
          return GoRouteExample();
        }),
    GoRoute(
      path: '/animation',
      builder: (BuildContext context, GoRouterState state) {
        return const AnimationExample();
      },
    ),
    GoRoute(
        path: '/pieChart',
        builder: (BuildContext context, GoRouterState state) {
          return PiechartExampe1(industrySector);
        }),
    GoRoute(
        path: '/division',
        builder: (BuildContext context, GoRouterState state) {
          return DivisionSelectionWidget();
        }),
    GoRoute(
        path: '/picChart1',
        builder: (BuildContext context, GoRouterState state) {
          return PieChartWidget(industrySector);
        }),
    GoRoute(
        path: '/barChart',
        builder: (BuildContext context, GoRouterState state) {
          return BarChartWidget(points: pricePoints);
        }),
    GoRoute(
        path: '/badge',
        builder: (BuildContext context, GoRouterState state) {
          return const BadgeExample();
        }),
    GoRoute(
        path: '/sensor',
        builder: (BuildContext context, GoRouterState state) {
          return const SensorExample();
        }),
    GoRoute(
        path: '/connectivity',
        builder: (BuildContext context, GoRouterState state) {
          return const MyHomePage(title: 'Welcome to Home Page');
        }),
    GoRoute(
        path: '/slide',
        builder: (BuildContext context, GoRouterState state) {
          return const SlidableExample();
        }),
    GoRoute(
        path: '/url',
        builder: (BuildContext context, GoRouterState state) {
          return const UrlLauncherExample();
        }),
    GoRoute(
        path: '/youtube',
        builder: (BuildContext context, GoRouterState state) {
          return const YouTubeVideoPlayerExample();
        }),
    GoRoute(
        path: '/photo',
        builder: (BuildContext context, GoRouterState state) {
          return const PhotoViewExample();
        }),
    GoRoute(
        path: '/facebook',
        builder: (BuildContext context, GoRouterState state) {
          return const FacebookLoginScreen();
        }),
    GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return LoginPage();
        }),
    GoRoute(
        path: '/search',
        builder: (BuildContext context, GoRouterState state) {
          return const SearchScreen();
        }),
    GoRoute(
        path: '/qrcode',
        builder: (BuildContext context, GoRouterState state) {
          return const QrCodeGeneratorExample();
        }),
    GoRoute(
        path: '/qrView',
        builder: (BuildContext context, GoRouterState state) {
          return const QRViewExample();
        }),
    GoRoute(
        path: '/connectivity',
        builder: (BuildContext context, GoRouterState state) {
          return const ConnectivityCheckExample();
        }),
    GoRoute(
        path: '/device',
        builder: (BuildContext context, GoRouterState state) {
          return const DeviceInfoExample();
        }),
    GoRoute(
        path: '/message',
        builder: (BuildContext context, GoRouterState state) {
          return const FirebaseMessagingExample(title: "title");
        }),
    GoRoute(path: '/table',
    builder: (BuildContext context, GoRouterState state){
      return const TableExample();
    })
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //FireBase Authentication
    /* return GlobalLoaderOverlay(
      overlayColor: Colors.grey.withOpacity(0.4),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.indigo,
            primarySwatch: Colors.indigo
          ),
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot != null && snapshot.hasData) {
                return GoRouteExample();
              } else {
                return LoginPage();
              }
            },
          ),



        ));*/
    return MaterialApp.router(
      routerConfig: _goRouter,
      //title: 'Hello Dhaka',
      title: AppLocalizations.of(context)?.helloWorld ?? "Fallback Title",

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      supportedLocales: [
        Locale('en'),
        Locale('bn'),
      ],
      locale: Locale('bn'),

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

class FirebaseMessagingExample extends StatefulWidget {
  const FirebaseMessagingExample({Key? key, required this.title})
      : super(key: key);
  final String title;

  @override
  State<FirebaseMessagingExample> createState() =>
      _FirebaseMessagingExampleState();
}

class _FirebaseMessagingExampleState extends State<FirebaseMessagingExample> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                color: Colors.blue,
                playSound: true,
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpendApp event was published');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title!),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body!)],
                  ),
                ),
              );
            });
      }
    });
  }

  void showNotification() {
    setState(() {
      _counter++;
    });
    flutterLocalNotificationsPlugin.show(
        0,
        'Testing $_counter',
        'How You do In?',
        NotificationDetails(
            android: AndroidNotificationDetails(channel.id, channel.name,
                channelDescription: channel.description,
                importance: Importance.high,
                color: Colors.blue,
                playSound: true)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You May Pushed the button this may times: '),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showNotification,
        tooltip: 'Increment',
        child: Icon(Icons.message),
      ),
    );
  }
}
