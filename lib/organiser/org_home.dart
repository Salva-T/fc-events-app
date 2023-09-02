import 'package:flutter/material.dart';
import 'package:hello/organiser/org_events.dart';
import 'package:hello/organiser/org_login.dart';
import 'package:hello/organiser/participants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_admin/firebase_admin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../users/create_page.dart';

class OrgHome extends StatefulWidget {
  const OrgHome({super.key});

  @override
  State<OrgHome> createState() => _OrgHomeState();
}

class _OrgHomeState extends State<OrgHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // handle user profile icon button click
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Material(
                color: Color.fromARGB(228, 202, 196, 196),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => participants(),
                        ));
                  },
                  child: const Text(
                    'All Participants',
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Material(
                color: Color.fromARGB(228, 202, 196, 196),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => orgevents(),
                        ));
                  },
                  child: const Text(
                    'All Events',
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Material(
                color: Color.fromARGB(228, 202, 196, 196),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateEventPage(),
                        ));
                  },
                  child: const Text(
                    'Create Event',
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Material(
                color: Color.fromARGB(228, 202, 196, 196),
                child: MaterialButton(
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.remove('email');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginForm1(),
                        ));
                  },
                  child: const Text(
                    'Log Out',
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
