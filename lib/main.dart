import 'package:flutter/material.dart';
import 'package:motion_nene/src/routes/app_routes.dart';
//import 'package:motion_nene/src/widgets/intro_slider.dart';

void main() {
   runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Motions néné',
      theme: ThemeData(        
        primarySwatch:  Colors.purple,
      ),
      //home: const IntroScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.root,
      routes: AppRoute.getRoutes(),
      
    );
  }
}
