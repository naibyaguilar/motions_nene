import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(20),
        color: const Color(0XFFDB0707),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(5.0),
                child: Image(
                  image: AssetImage(
                    'assets/images/alarm.png', //assets\images\alarm.png
                  ),
                  width: double.maxFinite,
                  //assets\images\motions_home.png
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  '¡NÉNÉ EN MOVIMIENTO!',
                  style: TextStyle(
                      color: Colors.white, fontSize: 30.0, fontFamily: 'Avert'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Necesitas hechar un vistazo a tu néné, ya se encuentra activo, o puede que solo se movio tantito.',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontFamily: 'Avert',
                      fontStyle: FontStyle.italic),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFF9F0505)),
                      fixedSize:
                          MaterialStateProperty.all(const Size(1000, 100))),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "ENTERAD@",
                    style: TextStyle(color: Colors.white, fontSize: 50),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
