import 'package:flutter/material.dart';
import 'package:hello/users/events_page.dart';
import 'package:hello/users/favourites_page.dart';
import 'package:hello/users/notification_page.dart';
import 'package:hello/users/profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String? userEmail; //for savedpreference
  String? _userEmail; //forstate

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    MyListView(),
    //favoritespage(),
    const UserMessage(),
    ProfilePage()
  ];

  @override
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
      body: _pages[_selectedIndex],
      bottomNavigationBar: GNav(
        backgroundColor: const Color.fromARGB(255, 159, 205, 232),
        color: Colors.white,
        activeColor: Colors.white,
        tabBackgroundColor: const Color.fromRGBO(213, 224, 231, 1),
        selectedIndex: _selectedIndex,
        onTabChange: _navigateBottomBar,
        gap: 8,
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'eventoo',
          ),
          //GButton(
          //  icon: Icons.favorite_border,
          //  text: 'favorites',
          //),
          GButton(
            icon: Icons.notifications,
            text: 'notifications',
          ),
          GButton(
            icon: Icons.person,
            text: 'profile',
          ),
        ],
      ),
    );
  }
}
