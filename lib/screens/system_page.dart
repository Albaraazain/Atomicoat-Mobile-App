import 'package:flutter/material.dart';
import '../widgets/diagram_view.dart';
import '../widgets/standard_view.dart';

class SystemPage extends StatefulWidget {
  @override
  _SystemPageState createState() => _SystemPageState();
}

class _SystemPageState extends State<SystemPage> {
  bool isDiagramView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('System Page'),
        actions: [
          Row(
            children: [
              Text(isDiagramView ? 'Diagram' : 'Standard'),
              Switch(
                value: isDiagramView,
                onChanged: (value) {
                  setState(() {
                    isDiagramView = value;
                  });
                },
              ),
            ],
          ),
        ],
      ),
      body: isDiagramView ? DiagramView() : StandardView(),
    );
  }
}