import 'component.dart';

class SystemModel {
  List<Component> components = [
    Component(
      name: 'Valve 1',
      status: 'Operational',
      information: {
        'Position': '50% open',
        'Flow Rate': '2 L/min',
        'Last Maintenance': '2023-08-15',
      },
    ),
    Component(
      name: 'Valve 2',
      status: 'Warning',
      information: {
        'Position': 'Fully closed',
        'Pressure Differential': 'High',
        'Last Maintenance': '2023-07-01',
      },
    ),
    Component(
      name: 'Pump',
      status: 'Error',
      information: {
        'Speed': '0 RPM',
        'Current': 'Overcurrent',
        'Last Maintenance': '2023-06-20',
      },
    ),
    Component(
      name: 'Heater',
      status: 'Operational',
      information: {
        'Temperature': '150°C',
        'Power': '80%',
        'Last Maintenance': '2023-08-01',
      },
    ),
  ];

  Component getComponent(String name) {
    return components.firstWhere((component) => component.name == name);
  }
}