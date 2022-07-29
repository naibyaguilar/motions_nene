import 'dart:convert';

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
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //getDataTest(context);
    // return ChangeNotifierProvider(
    //     create: (_) => AlertDeviceModel(),
    //     child:
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

// void getData() {
//   final database = FirebaseDatabase.instance.reference();
//   database.once().then((event) {
//     final dataSnapshot = event.snapshot;
//     if (dataSnapshot.value != null) {
//       final number = dataSnapshot.value;

//       dataSnapshot.children.forEach((element) {
//         String jsonString = json.encode(element.value);
//         final list =
//             jsonString.replaceAll("{", "").replaceAll("}", "").split(",");
//         print(list.last);
//       });
//     }
//   });
// }

// void getDataTest(BuildContext context) async {
//   DatabaseReference keyRef = FirebaseDatabase.instance.reference();
//   keyRef.orderByChild('timestamp').onChildAdded.listen((event) async {
//     final element = event.snapshot.value;
//     String jsonString = json.encode(element);
//     print(jsonString);
//     final list = jsonString.replaceAll("{", "").replaceAll("}", "").split(",");
//     list.forEach((element) {
//       print(element);
//     });
//     final lastItem = list.first;
//     final number = strstr(lastItem, ":");
//     print(number);
//     await displayDialog(context);
//   }, onError: (Object o) {
//     print(o);
//   });
// }

// String? strstr(String myString, String pattern, {bool before = false}) {
//   var index = myString.indexOf(pattern);
//   if (index < 0) return null;
//   if (before) return myString.substring(0, index);
//   return myString.substring(index + pattern.length);
// }

// Future<void> displayDialog(BuildContext context) async {
//   showGeneralDialog(
//       context: context,
//       barrierDismissible: false,
//       transitionDuration: const Duration(milliseconds: 2000),
//       transitionBuilder: (context, animation, secondaryAnimation, child) {
//         return FadeTransition(
//           opacity: animation,
//           child: ScaleTransition(
//             scale: animation,
//             child: child,
//           ),
//         );
//       },
//       pageBuilder: (context, animation, secondaryAnimation) {
//         return const AlertScreen();
//       });
// }

// class AlertDeviceModel extends ChangeNotifier {
//   int _loading = 0;

//   int get loading => _loading;

//   set loading(int value) {
//     this._loading = value;
//     notifyListeners();
//   }
// }
