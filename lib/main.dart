import 'package:flutter/material.dart';
import 'package:motion_nene/src/routes/app_routes.dart';
//import 'package:motion_nene/src/widgets/intro_slider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //print('Initialized default app $app');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  // static FirebaseAnalyticsObserver observer =
  //     FirebaseAnalyticsObserver(analytics: analytics);

  // Future<void> initializeDefault() async {
  //   FirebaseApp app = await Firebase.initializeApp(
  //     options: DefaultFirebaseOptions.currentPlatform,
  //   );
  //   print('Initialized default app $app');
  // }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Motions néné',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      // navigatorObservers: <NavigatorObserver>[observer],
      //home: const IntroScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.root,
      routes: AppRoute.getRoutes(),
    );
  }
}
