import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:motion_nene/src/model/device_model.dart';
import 'package:motion_nene/src/model/item_navigation';
import 'package:motion_nene/src/screens/device_screen.dart';
import 'package:motion_nene/src/screens/settings_screen.dart';
import '../screens/home_screen.dart';

class AppRoute {
  static const String root = '/';

  static final List<OptionNavigations> listSreens = [
    OptionNavigations(
        title: 'Dispositivos',
        route: '/device',
        screen: DeviceScreen(names: names),
        icon: Icons.developer_board_outlined),
    OptionNavigations(
        title: 'Inicio',
        route: '/',
        screen: const HomeScreen(),
        icon: Icons.home_rounded),
    OptionNavigations(
        title: 'Configuración',
        route: '/settings',
        screen: SettingsScreen(),
        icon: Icons.settings_applications_sharp),
  ];

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> routes = {};
    for (OptionNavigations item in listSreens) {
      routes[item.route] = (context) => item.screen;
    }
    return routes;
  }
}

List<Map> names = [
  {"name": "Detector Cuna", "value": 0, "image": 'assets/images/device/5.png'},
  {"name": "Area de jugos", "value": 0, "image": 'assets/images/device/6.png'},
  {"name": "Detector Movil", "value": 0, "image": 'assets/images/device/7.png'}
];

//["Detector Cuna", "Area de jugos", "Detector Movil"];
