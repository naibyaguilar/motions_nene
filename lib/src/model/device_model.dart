
import 'dart:html';

import 'package:flutter/material.dart';
import '../services/api.dart';
class Devices {
  
  List<Device> items = [];
  Devices();

  Devices.fromJsonList(List<dynamic> jsonList){
    if (jsonList == null) return;
    for (var item in jsonList) {
     // final device = new Device.fromJsonMap(item);
     // items.add(device);
    }
  }

}

class Device {
  double  value;
  String name;
  //String dispo;


  Device({
    required this.value,
    required this.name,
  });

  /*Device.fromJsonMap(Map<String, dynamic> json) {
  name = json['name'];
  value = json['value'];
  }*/

  static Future<List<Device>> getData() async {
    List<dynamic> pinList = await API.getPinsStatus();
    List<Device> pinDataList = [];
    for (int i = 0; i < pinList.length; i++) {
      pinDataList.add(Device(name: 'D' + i.toString(), value: pinList[i]));
    }
    return pinDataList;
  }
}