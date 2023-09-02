import 'package:flutter/material.dart';

class orgevents extends StatelessWidget {
  final List<Map<String, String>> _events = [
    {
      'image': 'https://via.placeholder.com/150',
      'name': 'Quiz Competition',
      'description': 'Farook College Students Union',
    },
    {
      'image': 'https://via.placeholder.com/150',
      'name': 'Fusicon',
      'description': 'A Tech Fest by Department of Computer Science',
    },
    {
      'image': 'https://via.placeholder.com/150',
      'name': 'Buffet Feast',
      'description': 'Starters to Desserts',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
      ),
      body: ListView.builder(
        itemCount: _events.length,
        itemBuilder: (context, index) {
          final event = _events[index];
          return Card(
            child: ListTile(
              leading: Image.network(event['image']!),
              title: Text(event['name']!),
              subtitle: Text(event['description']!),
            ),
          );
        },
      ),
    );
  }
}
