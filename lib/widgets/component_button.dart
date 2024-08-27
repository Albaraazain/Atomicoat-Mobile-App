import 'package:flutter/material.dart';
import '../models/component.dart';
import 'component_info_dialog.dart';

class ComponentButton extends StatelessWidget {
  final Component component;

  ComponentButton({required this.component});

  @override
  Widget build(BuildContext context) {
    Color buttonColor;
    switch (component.status) {
      case 'Operational':
        buttonColor = Colors.green;
        break;
      case 'Warning':
        buttonColor = Colors.orange;
        break;
      case 'Error':
        buttonColor = Colors.red;
        break;
      default:
        buttonColor = Colors.grey;
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return ComponentInfoDialog(component: component);
          },
        );
      },
      child: Text(component.name),
    );
  }
}