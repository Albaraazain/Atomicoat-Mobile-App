import 'package:flutter/material.dart';
import '../models/system_model.dart';
import 'component_button.dart';

class SystemDiagram extends StatelessWidget {
  final SystemModel systemModel;

  SystemDiagram({required this.systemModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Stack(
        children: [
          Center(child: Text('System Diagram')),
          Positioned(
            left: 50,
            top: 50,
            child: ComponentButton(component: systemModel.getComponent('Valve 1')),
          ),
          Positioned(
            right: 50,
            top: 50,
            child: ComponentButton(component: systemModel.getComponent('Valve 2')),
          ),
          Positioned(
            left: 50,
            bottom: 50,
            child: ComponentButton(component: systemModel.getComponent('Pump')),
          ),
          Positioned(
            right: 50,
            bottom: 50,
            child: ComponentButton(component: systemModel.getComponent('Heater')),
          ),
        ],
      ),
    );
  }
}