import 'package:flutter/material.dart';

class CreateEventPage extends StatefulWidget {
  @override
  _CreateEventPageState createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  String eventName = '';
  String eventDescription = '';
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = const TimeOfDay(hour: 0, minute: 0);
  String location = '';

  // Function to show date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // Function to show time picker
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Event'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Name of the event',
                ),
                onChanged: (value) {
                  setState(() {
                    eventName = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
                onChanged: (value) {
                  setState(() {
                    eventDescription = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () {
                  _selectDate(context);
                },
                child: Row(
                  children: [
                    const Icon(Icons.calendar_today),
                    const SizedBox(width: 16),
                    Text(
                      '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () {
                  _selectTime(context);
                },
                child: Row(
                  children: [
                    const Icon(Icons.access_time),
                    const SizedBox(width: 16),
                    Text(
                      '${selectedTime.hour}:${selectedTime.minute}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Location',
                ),
                onChanged: (value) {
                  setState(() {
                    location = value;
                  });
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  // Add code here to save event to database
                  Navigator.pop(context);
                },
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
