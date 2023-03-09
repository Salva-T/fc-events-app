import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff303f9f),
              Color(0xff1a237e),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
            SizedBox(
              height: 11,
            ),
            Text(
              "Username",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildButtonColumn(Icons.favorite_border, 'Favorites'),
                _buildButtonColumn(Icons.edit, 'Edit profile'),
              ],
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildButtonColumn(Icons.settings, 'Settings'),
                _buildButtonColumn(Icons.help_outline, 'Help'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, color: Colors.white, size: 30),
        SizedBox(height: 10),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
