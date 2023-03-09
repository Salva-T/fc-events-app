import 'package:flutter/material.dart';
import 'package:hello/forms/event1.dart';
import 'package:hello/forms/profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightBlue[100],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                height: 65,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyListView(),
                        ));
                  },

                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue,
                      shape: const StadiumBorder(),
                      textStyle: const TextStyle(
                          fontSize: 20)), // sets the button color
                  child: const Text('EVENTS'),
                ),
              ),
              const SizedBox(height: 35),
              SizedBox(
                width: 300,
                height: 65,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue,
                      shape: const StadiumBorder(),
                      textStyle: const TextStyle(fontSize: 20)),
                  child: const Text('NOTIFICATIONS'),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(),
              ));
        },
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        child: const Icon(Icons.person),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}
