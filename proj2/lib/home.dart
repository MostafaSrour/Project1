import 'package:flutter/material.dart';
import 'sched_events.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selectedDate = DateTime.now();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  List<String> events = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Tooltip(
              message: 'Go to your events',
              child: Icon(Icons.event),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SchedEventsPage(events: events),
                ),
              );
            },
          ),
          IconButton(
            icon: Tooltip(
              message: 'Login',
              child: Icon(Icons.login),
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selected Date and Time: ${_selectedDate != null ? _selectedDate.toString() : "Pick a date and time"}',
              style: TextStyle(color: Colors.white),
            ),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              style: ElevatedButton.styleFrom(
                primary: Colors.orangeAccent,
              ),
              child: Text('Pick a Date and Time'),
            ),
            SizedBox(height: 20),
            Text(
              'Event Title:',
              style: TextStyle(color: Colors.white),
            ),
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Enter event title...',
                fillColor: Theme.of(context).inputDecorationTheme.fillColor,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Event Description:',
              style: TextStyle(color: Colors.white),
            ),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(
                hintText: 'Enter event description...',
                fillColor: Theme.of(context).inputDecorationTheme.fillColor,
              ),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String newEvent =
                    'You have ${_titleController.text} on ${_selectedDate.toString()}, this event includes ${_descriptionController.text.toLowerCase()}';
                setState(() {
                  events.add(newEvent);
                });

                _titleController.clear();
                _descriptionController.clear();

                // Navigate to the SchedEventsPage with updated events list
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SchedEventsPage(events: events)),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orangeAccent,
              ),
              child: Text('Add Event'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2023),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_selectedDate),
      );

      if (pickedTime != null) {
        DateTime pickedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        setState(() {
          _selectedDate = pickedDateTime;
        });
      }
    }
  }
}
