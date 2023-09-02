import 'package:flutter/material.dart';

class participants extends StatelessWidget {
  final List<Map<String, String>> _participants = [
    {
      'username': 'Ramzan',
      'department': 'Computer Science',
      'registerNumber': 'CSE001',
      'phoneNumber': '+1 123-456-7890',
      'Event ': 'Fusicon Tech Fest'
    },
    {
      'username': 'Aysha Alen',
      'department': 'Mathematics',
      'registerNumber': 'EEE002',
      'phoneNumber': '+1 234-567-8901',
      'Event ': 'Quiz Competition'
    },
    {
      'username': 'Vyshak',
      'department': 'Statistics',
      'registerNumber': 'ME003',
      'phoneNumber': '+1 345-678-9012',
      'Event ': 'Quiz Competition'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Participants'),
      ),
      body: ListView.builder(
        itemCount: _participants.length,
        itemBuilder: (context, index) {
          final participant = _participants[index];
          return ListTile(
            title: Text(participant['username']!),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(participant['department']!),
                Text('Register number: ${participant['registerNumber']}'),
                Text('Phone number: ${participant['phoneNumber']}'),
                Text('Event Registered: ${participant['Event']}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
