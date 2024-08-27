import 'package:flutter/material.dart';

class LoopAction {
  final String type;
  final String value;

  LoopAction(this.type, this.value);

  @override
  String toString() => '$type: $value';
}

class LoopMechanismWidget extends StatefulWidget {
  @override
  _LoopMechanismWidgetState createState() => _LoopMechanismWidgetState();
}

class _LoopMechanismWidgetState extends State<LoopMechanismWidget> {
  int loopTimes = 1;
  double valveValue = 0.0;
  double purgeValue = 0.0;
  String selectedValve = 'Valve 1';
  List<LoopAction> loopActions = [];

  void addValveAction() {
    setState(() {
      loopActions.add(LoopAction('Valve', '${selectedValve}: ${valveValue.round()}'));
    });
  }

  void addPurgeAction() {
    setState(() {
      loopActions.add(LoopAction('Purge', purgeValue.round().toString()));
    });
  }

  void removeAction(int index) {
    setState(() {
      loopActions.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add loop working mechanism:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text('Loop'),
                SizedBox(width: 8),
                SizedBox(
                  width: 50,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        loopTimes = int.tryParse(value) ?? 1;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Text('times'),
              ],
            ),
            SizedBox(height: 16),
            Text('Add Valve', style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: [
                DropdownButton<String>(
                  value: selectedValve,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValve = newValue!;
                    });
                  },
                  items: <String>['Valve 1', 'Valve 2', 'Valve 3', 'Valve 4']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Expanded(
                  child: Slider(
                    value: valveValue,
                    onChanged: (newValue) {
                      setState(() {
                        valveValue = newValue;
                      });
                    },
                    min: 0,
                    max: 100,
                    divisions: 100,
                    label: valveValue.round().toString(),
                  ),
                ),
                ElevatedButton(
                  onPressed: addValveAction,
                  child: Text('Add'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text('Add Purge', style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: [
                Expanded(
                  child: Slider(
                    value: purgeValue,
                    onChanged: (newValue) {
                      setState(() {
                        purgeValue = newValue;
                      });
                    },
                    min: 0,
                    max: 100,
                    divisions: 100,
                    label: purgeValue.round().toString(),
                  ),
                ),
                ElevatedButton(
                  onPressed: addPurgeAction,
                  child: Text('Add'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text('Loop Actions:', style: TextStyle(fontWeight: FontWeight.bold)),
            ListView.builder(
              shrinkWrap: true,
              itemCount: loopActions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(loopActions[index].toString()),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => removeAction(index),
                  ),
                );
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Here you would implement the actual execution of the loop
                print('Executing loop $loopTimes times with actions: $loopActions');
              },
              child: Text('Execute Loop'),
            ),
          ],
        ),
      ),
    );
  }
}