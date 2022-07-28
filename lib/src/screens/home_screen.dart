import 'package:flutter/material.dart';
import 'package:motion_nene/src/screens/alert_screen.dart';
import 'package:motion_nene/src/widgets/bottom_navigation.dart';
import '../routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
              onPressed: () => _displayDialog(context),
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

  _displayDialog(BuildContext context) {
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
