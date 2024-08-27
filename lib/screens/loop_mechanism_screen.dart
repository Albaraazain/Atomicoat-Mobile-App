import 'package:flutter/material.dart';
import '../widgets/loop_mechanism_widget.dart';

class LoopMechanismScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loop Mechanism'),
      ),
      body: SingleChildScrollView(
        child: LoopMechanismWidget(),
      ),
    );
  }
}