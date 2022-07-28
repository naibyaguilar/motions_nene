import '../services/api.dart';

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

  factory Device.fromJson(Map<String, dynamic> json) => Device(
        value: json["status"],
        name: json["Lectura"],
        //articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
      );
}
