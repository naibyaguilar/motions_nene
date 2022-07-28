import 'package:flutter/material.dart';

import '../routes/app_routes.dart';
import '../widgets/bottom_navigation.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: ListView(padding: const EdgeInsets.all(0.0), children: [
              const Padding(
                padding: EdgeInsets.only(top: 40, left: 20, bottom: 12),
                child: Text(
                  "Settings",
                  style: TextStyle(fontSize: 26),
                ),
              ),
              ListTile(
                title: const Text("Próximamente: Cambiar número"),
                leading: const Icon(
                  Icons.phone,
                  size: 18,
                  color: Color(0xff0785CC),
                ),
                onTap: () {
                  print("tapped");
                },
              ),
              ListTile(
                title: const Text("Próximamente: Gestionar los sonidos"),
                leading: const Icon(
                  Icons.hearing,
                  size: 18,
                  color: Color(0xff872EF9),
                ),
                onTap: () {
                  print("tapped");
                },
              ),
              ListTile(
                title: const Text("Próximamente: Iniciar sesión"),
                leading: const Icon(
                  Icons.phone,
                  size: 18,
                  color: Color(0xffEB2B2B),
                ),
                onTap: () {
                  print("Logout");
                },
              ),
            ]),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(items: AppRoute.listSreens),
    );
  }
}
