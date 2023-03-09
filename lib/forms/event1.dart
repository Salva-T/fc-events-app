import 'package:flutter/material.dart';
import 'package:hello/forms/create_page.dart';
import 'package:hello/forms/event_details.dart';

class MyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UPCOMING EVENTS'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 25,
              ),
              ListTile(
                leading: Image.asset('assets/images/event2.jpeg',
                    width: 50, height: 50),
                title: Text('Technology and Future'),
                subtitle: Text('ON MARCH 8, 3PM '),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyPage(),
                      ));
                  // Handle item tap
                },
              ),
              SizedBox(
                height: 15,
              ),
              ListTile(
                leading: Image.asset('assets/images/event1.jpeg',
                    width: 50, height: 50),
                title: Text('BUFFET FEAST'),
                subtitle: Text('ON FEB 16, 2PM'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Handle item tap
                },
              ),
              SizedBox(
                height: 15,
              ),
              ListTile(
                leading: Image.asset('assets/images/event3.jpeg',
                    width: 50, height: 50),
                title: Text('TEDX FC'),
                subtitle: Text('ON NOV 30,3PM'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Handle item tap
                },
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateEventPage(),
                      ));
                },
                child: Text('Create Event'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  textStyle: TextStyle(fontSize: 20),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 13),
                ),
              ),
              // Add more list items as needed
            ],
          ),
        ),
      ),
    );
  }
}
