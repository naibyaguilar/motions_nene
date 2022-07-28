import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:motion_nene/src/routes/app_routes.dart';
//import 'package:motion_nene/src/widgets/intro_slider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'src/screens/alert_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);

  print('Initialized default app $app');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      // home: const IntroScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.root,
      routes: AppRoute.getRoutes(),
    );
  }
}

Future<void> displayDialog(BuildContext context) async {
  showGeneralDialog(
      context: context,
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 2000),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: animation,
            child: child,
          ),
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return const AlertScreen();
      });
}

class AlertDeviceModel extends ChangeNotifier {
  int _loading = 0;

  int get loading => _loading;

  set loading(int value) {
    this._loading = value;
    notifyListeners();
  }
}
