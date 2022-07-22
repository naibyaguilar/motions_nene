import 'package:flutter/material.dart';
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
        /*decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background_mn.png"),
              fit: BoxFit.fill,
              opacity: 1),
        ),*/
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Image(
              image: AssetImage('assets/images/smarthome.png'),
            ),
             const Padding(
               padding: EdgeInsets.all(8.0),
               child: Text(
                'Mas Cuidados, menos estres',
                style: TextStyle(color: Color(0xff9D4BFA), fontSize: 80, fontFamily: 'Hunters'),
                textAlign: TextAlign.center,
            ),
             ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Mejora el cuidado de tu bebé, con nuestro sistema de administración de dispositivos',
                overflow: TextOverflow.clip,
                style: TextStyle(color: Color.fromARGB(111, 157, 75, 250), fontSize: 30, fontFamily: 'ComicSans', ),
                textAlign: TextAlign.justify,
              ),
            ),
            TextButton(
              onPressed: ()=>Navigator.pushReplacementNamed(context, '/device'),
              style: TextButton.styleFrom(
                  backgroundColor: const Color(0XFFF2778D),
                  shape: const StadiumBorder()),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 150, vertical: 15),
                child: Text('Bienvenido',
                    style: TextStyle(color: Colors.white, fontSize: 30)),
              ),
            ),
          ],
        ),
      )

      /*Stack(
        children: <Widget>[
          const Image(image: AssetImage('images/background_mn.png')),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: const [
          
            ],
          ),
        ],
      )*/
      ,
      bottomNavigationBar: BottomNavigation(items: AppRoute.listSreens),
    );
  }
}
