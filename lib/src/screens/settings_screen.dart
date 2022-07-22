import 'package:flutter/material.dart';

import '../routes/app_routes.dart';
import '../widgets/bottom_navigation.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: const [
            FlutterLogo(size: 300,),
            SizedBox(height: 5,),
            Text('Setting Screen ....'),
          ],
        ),
        bottomNavigationBar: BottomNavigation(items : AppRoute.listSreens),
      );    
  }
}