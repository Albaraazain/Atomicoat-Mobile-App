import 'package:flutter/material.dart';
import '../models/component.dart';

class ComponentInfoDialog extends StatelessWidget {
  final Component component;

  ComponentInfoDialog({required this.component});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(component.name),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Status: ${component.status}', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          ...component.information.entries.map((entry) =>
              Text('${entry.key}: ${entry.value}')
          ).toList(),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Close'),
        ),
      ],
    );
  }
}