import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../routes/app_routes.dart';
import '../widgets/bottom_navigation.dart';

class DeviceScreen extends StatelessWidget {
  DeviceScreen({Key? key, required this.names}) : super(key: key);
  final TextEditingController controller = TextEditingController();
  final List<Map> names;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Administrador de dispositivos"),
          backgroundColor: const Color(0xFF644394)),
      body: (_listViewDevice(names: names)),
      bottomNavigationBar: BottomNavigation(items: AppRoute.listSreens),
    );
  }
}

class _listViewDevice extends StatelessWidget {
  const _listViewDevice({
    Key? key,
    required this.names,
  }) : super(key: key);

  final List<Map> names;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: names.length,
      itemBuilder: (context, i) {
        return Card(
            color: const Color(0xFFD9EEF6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    width: 70,
                    height: 70,
                    margin: const EdgeInsets.only(right: 15),
                    child: Image(image: AssetImage(names[i]['image']))),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  names[i]['name'],
                  style: const TextStyle(
                    color: Color(0xFF644394),
                    fontSize: 30.0,
                    height: 1.6,
                  ),
                ),
              ],
            ));
      },
    );
  }
}
