import 'package:flutter/material.dart';
import 'package:hello/forms/event1.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  late DateTime _selectedDate;
  late TimeOfDay _selectedTime;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _selectedTime = TimeOfDay.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime)
      setState(() {
        _selectedTime = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EVENTS'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Image.asset('assets/images/event4.jpeg'),
          SizedBox(height: 20),
          Text(
            'TECHNOLOGY AND FUTURE',
            style: TextStyle(fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(45, 5, 45, 8),
            child: Text(
              'Blazing new trials and breaking down barriers for future generations',
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () => _selectDate(context),
              ),
              Text(
                  "${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}"),
              SizedBox(width: 20),
              IconButton(
                icon: Icon(Icons.access_time),
                onPressed: () => _selectTime(context),
              ),
              Text("${_selectedTime.hour}:${_selectedTime.minute}"),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('Register'),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text('Wishlist'),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text('Feedback'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
