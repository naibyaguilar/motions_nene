import 'package:flutter/cupertino.dart';

import '../model/device_model.dart';

class DeviceCardView extends StatelessWidget {
  const DeviceCardView({Key? key, required this.device}) : super(key: key);

  @override
  final List<Device> device;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: device.length,
            padding: const EdgeInsets.only(
                left: 50, top: 50, right: 10, bottom: 0.0),
            itemBuilder: (context, i) => _viewHolderDevice()));
  }
}

Widget _viewHolderDevice() {
  return GestureDetector(
    onTap: () {},
  );
}
