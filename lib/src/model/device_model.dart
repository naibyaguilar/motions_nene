import '../services/api.dart';

class Devices {
  // List<Device> items = [];
  Devices();

  final items = List<Device>.generate(
      10,
      (i) => i % 6 == 0
          ? Device(name: 'Message body $i', value: i)
          : Device(name: 'Message body $i', value: i));
}

class Device {
  int value;
  String name;
  //String dispo;

  Device({
    required this.value,
    required this.name,
  });

  static Future<List<Device>> getList() async {
    List<dynamic> pinList = await API.getStatus();

    List<Device> pinDataList = [];
    for (int i = 0; i < pinList.length; i++) {
      pinDataList.add(Device(name: "Detector Cuna", value: pinList[i]));
    }
    return pinDataList;
  }

  List<String> names = ["Detector Cuna", "Area de jugos", "Detector Movil"];
}
