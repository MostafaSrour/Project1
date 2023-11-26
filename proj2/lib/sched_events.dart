import 'package:flutter/material.dart';

class SchedEventsPage extends StatelessWidget {
  final List<String> events;

  SchedEventsPage({required this.events});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scheduled Events'),
      ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            elevation: 4,
            child: ListTile(
              title: Text(
                events[index],
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}
