import 'package:flutter/material.dart';

class StandardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('System Overview', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            SystemStatusCard(),
            SizedBox(height: 16),
            Text('Components', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ComponentList(),
          ],
        ),
      ),
    );
  }
}

class SystemStatusCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('System Status: Operational', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Temperature: 25°C'),
            Text('Pressure: 1 atm'),
            Text('Flow Rate: 2 L/min'),
          ],
        ),
      ),
    );
  }
}

class ComponentList extends StatelessWidget {
  final List<String> components = ['Valve 1', 'Valve 2', 'Pump', 'Heater'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: components.map((component) => ComponentListItem(component)).toList(),
    );
  }
}

class ComponentListItem extends StatelessWidget {
  final String componentName;

  ComponentListItem(this.componentName);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(componentName),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          // Navigate to detailed component view
          // This is where you'd implement navigation to a detailed view of the component
          print('Tapped on $componentName');
        },
      ),
    );
  }
}