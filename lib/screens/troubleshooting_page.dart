import 'package:flutter/material.dart';
import '../widgets/system_diagram.dart';
import '../models/system_model.dart';

class TroubleshootingPage extends StatefulWidget {
  @override
  _TroubleshootingPageState createState() => _TroubleshootingPageState();
}

class _TroubleshootingPageState extends State<TroubleshootingPage> {
  bool showDiagram = false;
  final SystemModel systemModel = SystemModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Troubleshooting'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showDiagram = !showDiagram;
                });
              },
              child: Text(showDiagram ? 'Hide Diagram' : 'Show Diagram'),
            ),
            SizedBox(height: 16),
            if (showDiagram) SystemDiagram(systemModel: systemModel),
          ],
        ),
      ),
    );
  }
}