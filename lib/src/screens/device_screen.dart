import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../routes/app_routes.dart';
import '../widgets/bottom_navigation.dart';

class DeviceScreen extends StatelessWidget {
  DeviceScreen({Key? key}) : super(key: key);
  final TextEditingController controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Administrador de dispositivos"),
      ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children:[
            Container(
            margin: const EdgeInsets.only(top: 10),
            height: 200,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 120,
                    child: Image.asset("assets/images/logo/logo_mosnter.png"),
                  ),
                  SizedBox(
                    height: 120,
                    child: Image.asset(
                      "assets/images/logo/logo_mosnter.png",
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 40, 20, 20),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(hintText: 'Name'),
            ),
          ),
           ElevatedButton(
             child: const Text('Submit'),
             onPressed: () async {
               SharedPreferences prefs = await SharedPreferences.getInstance();
               prefs.setString('name', controller.text.trim());
               if (controller.text.isNotEmpty) {}
             },
           )

          ],
        ),
        bottomNavigationBar: BottomNavigation(items : AppRoute.listSreens),
      );   
  }
}
