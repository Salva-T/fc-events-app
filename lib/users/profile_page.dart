import 'package:flutter/material.dart';
import 'package:hello/users/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_admin/firebase_admin.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'registered_events.dart';

final User? user = FirebaseAuth.instance.currentUser;

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? userEmail;
  String? _userEmail;

  void initState() {
    super.initState();
    getUserEmail();
  }

  Future<void> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    userEmail = prefs.getString('email');
    print(userEmail);
    setState(() {
      _userEmail = userEmail;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
            const SizedBox(
              height: 11,
            ),
            Text(
              'Welcomee, $_userEmail',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildButtonColumn(Icons.favorite_border, 'Registered Events',
                    onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => regevents(),
                      ));
                  print('Registered Events button pressed!');
                }),
                _buildButtonColumn(Icons.edit, 'Edit profile',
                    onPressed: () {}),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildButtonColumn(Icons.settings, 'settings', onPressed: () {
                  // Add your onPressed function here for the Registered Events button
                  // This function will be executed when the button is pressed
                  print('Registered Events button pressed!');
                }),
                _buildButtonColumn(Icons.logout, 'Log Out',
                    onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.remove('email');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginForm(),
                      ));
                  print('Edit profile button pressed!');
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonColumn(IconData icon, String label,
      {Function()? onPressed}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(icon),
          onPressed: onPressed,
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.grey[700],
            ),
          ),
        ),
      ],
    );
  }
}
