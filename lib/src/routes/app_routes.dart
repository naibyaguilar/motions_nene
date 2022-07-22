import 'package:flutter/material.dart';
import 'package:motion_nene/src/model/item_navigation';
import 'package:motion_nene/src/screens/device_screen.dart';
import 'package:motion_nene/src/screens/settings_screen.dart';
import '../screens/home_screen.dart';


class AppRoute{
  static const String root = '/';
  static final List<OptionNavigations> listSreens =[
    OptionNavigations(title: 'Dispositivos', route: '/device', screen: DeviceScreen(), icon: Icons.developer_board_outlined),
     OptionNavigations(title: 'Inicio', route: '/', screen: const HomeScreen(), icon: Icons.home_rounded),
    OptionNavigations(title: 'Configuración', route: '/settings', screen: const SettingsScreen(), icon: Icons.settings_applications_sharp),

  ];

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> routes = {};
    for (OptionNavigations item in listSreens) {
      routes[item.route]=(context)=> item.screen;
    }
    return routes;
  }

}
