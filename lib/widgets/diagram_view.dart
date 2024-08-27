import 'package:flutter/material.dart';

class DiagramView extends StatefulWidget {
  @override
  _DiagramViewState createState() => _DiagramViewState();
}

class _DiagramViewState extends State<DiagramView> {
  Map<String, bool> componentStates = {
    'Valve 1': false,
    'Valve 2': false,
    'Pump': false,
    'Heater': false,
  };

  Map<String, double> componentValues = {
    'Valve 1': 0,
    'Valve 2': 0,
    'Pump': 0,
    'Heater': 0,
  };

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (var component in componentStates.keys)
            Card(
              margin: EdgeInsets.all(8),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(component, style: TextStyle(fontSize: 18)),
                        Switch(
                          value: componentStates[component]!,
                          onChanged: (bool value) {
                            setState(() {
                              componentStates[component] = value;
                            });
                          },
                        ),
                      ],
                    ),
                    Slider(
                      value: componentValues[component]!,
                      min: 0,
                      max: 100,
                      divisions: 100,
                      label: componentValues[component]!.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          componentValues[component] = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}