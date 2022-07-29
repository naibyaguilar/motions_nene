import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:motion_nene/src/widgets/bottom_navigation.dart';
import 'package:provider/provider.dart';
import '../../main.dart';
import '../routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getDataTest();
    return ChangeNotifierProvider(
      create: (_) => AlertDeviceModel(),
      child: const Pagehome(),
    );
    //Pagehome();
  }
}

void getData() {
  final database = FirebaseDatabase.instance.reference();
  database.once().then((event) {
    final dataSnapshot = event.snapshot;
    if (dataSnapshot!.value != null) {
      dataSnapshot.children.forEach((element) {
        String jsonString = json.encode(element.value);
        final list =
            jsonString.replaceAll("{", "").replaceAll("}", "").split(",");
        print(list.last);
      });
    }
  });
}

void getDataTest() {
  DatabaseReference keyRef = FirebaseDatabase.instance.reference();
  keyRef.orderByChild('timestamp').onChildAdded.listen((event) {
    final element = event.snapshot.value;
    String jsonString = json.encode(element);
    print(jsonString);
    final list = jsonString.replaceAll("{", "").replaceAll("}", "").split(",");
    list.forEach((element) {
      print(element);
    });
    final lastItem = list.first;
    final number = strstr(lastItem, ":");
    print(number);
  }, onError: (Object o) {
    print(o);
  });
}

String? strstr(String myString, String pattern, {bool before = false}) {
  var index = myString.indexOf(pattern);
  if (index < 0) return null;
  if (before) return myString.substring(0, index);
  return myString.substring(index + pattern.length);
}

class Pagehome extends StatelessWidget {
  const Pagehome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //color: const Color(0xff30BAD6),
        height: double.infinity,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Image(
              image: AssetImage(
                'assets/images/motions_home.png',
              ),
              //assets\images\motions_home.png
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Mas Cuidados, menos estres',
                style: TextStyle(
                  color: Color(0xFF644394),
                  fontSize: 50,
                  fontFamily: 'Avert',
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Mejora el cuidado de tu bebé, con nuestro sistema de administración de dispositivos',
                overflow: TextOverflow.clip,
                style: TextStyle(
                  color: Color(0xFFB0B1D9),
                  fontSize: 30,
                  fontFamily: 'Avert',
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            TextButton(
              onPressed: () => displayDialog(context),
              //Navigator.pushReplacementNamed(context, '/device'),
              style: TextButton.styleFrom(
                  backgroundColor: const Color(0XFF16A596), //16A596
                  shape: const StadiumBorder()),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 150, vertical: 15),
                child: Text('Bienvenido',
                    style: TextStyle(color: Colors.white, fontSize: 30)),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(items: AppRoute.listSreens),
    );
  }

  void getData(BuildContext context) {
    final database = FirebaseDatabase.instance.reference();
    // database.once().then((event) {
    database.orderByChild('timestamp').onValue.listen((event) async {
      final dataSnapshot = event.snapshot;
      if (dataSnapshot.value != null) {
        dataSnapshot.children.forEach((element) async {
          String jsonString = json.encode(element.value);
          final list =
              jsonString.replaceAll("{", "").replaceAll("}", "").split(",");
          final lastItem = list.last;
          final number = strstr(lastItem, ":");
          print(dataSnapshot.value);
          if (number != "0") {
            print(number);
            await displayDialog(context);
          }
        });
      }
    });
  }

  void getDataTest(BuildContext context) async {
    DatabaseReference keyRef = FirebaseDatabase.instance.reference();
    keyRef.orderByChild('timestamp').onChildAdded.listen((event) async {
      final element = event.snapshot.value;
      String jsonString = json.encode(element);
      print(jsonString);
      final list =
          jsonString.replaceAll("{", "").replaceAll("}", "").split(",");
      list.forEach((element) {
        // print(element);
      });
      final lastItem = list.last;
      final number = strstr(lastItem, ":");
      print(lastItem);
      if (number != "0") {
        await displayDialog(context);
      }
    }, onError: (Object o) {
      //print(o);
    });
  }

  String? strstr(String myString, String pattern, {bool before = false}) {
    var index = myString.indexOf(pattern);
    if (index < 0) return null;
    if (before) return myString.substring(0, index);
    return myString.substring(index + pattern.length);
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
}
