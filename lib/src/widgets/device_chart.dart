import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:motion_nene/src/model/device_model.dart';
import '../services/api.dart';

class PinChart extends StatefulWidget {
  final List<Device> data;

  // ignore: use_key_in_widget_constructors
  const PinChart({required this.data});

  @override
  _PinChartState createState() => _PinChartState();
}

class _PinChartState extends State<PinChart> {
  bool ledOn = true;
  @override
  Widget build(BuildContext context) {
    List<charts.Series<Device, String>> series = [
      charts.Series(
        id: "developers",
        data: widget.data,
        domainFn: (Device series, _) => series.name,
        measureFn: (Device series, _) => series.value
      ),
    ];

    return Container(
      padding: const EdgeInsets.all(10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            children: <Widget>[
              const Text(
                "ESP8266 Pin Status",
              ),
              Expanded(
                child: charts.BarChart(series, animate: true),
              ),
              Switch(
                onChanged: (value) {
              setState(
                () {
                  ledOn = !ledOn;
                },
              );
              API.toggleLED(value);
                },
                value: ledOn,
                activeColor: Colors.cyan,
                // activeTrackColor: Colors.yellow,
                inactiveThumbColor: Colors.redAccent,
                inactiveTrackColor: Colors.orange,
              )
            ],
          ),
        ),
      ),
    );
  }
}