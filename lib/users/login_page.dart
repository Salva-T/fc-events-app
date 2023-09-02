import 'package:flutter/material.dart';
import 'package:hello/users/events_page.dart';
import 'package:hello/users/home_page.dart';
import 'package:hello/users/notification_page.dart';
import 'package:hello/organiser/org_login.dart';
import 'package:hello/users/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'create_page.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String _email = "";
  String _password = "";
  String? userEmail;
  String? _userEmail;

  //eyepassword

  void initState() {
    super.initState();
    getUserEmail();
  }

  Future<void> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    userEmail = prefs.getString('email');
    print(userEmail);
    if (userEmail != null) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
    }
    setState(() {
      _userEmail = userEmail;
    });
  }

  void _signInWithEmailAndPassword() async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: _email, password: _password);

      final User user = result.user!;
      String userEmail = user.email!;
      // Navigate to the next screen or do something else
      print('success');
      print(user);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', userEmail);
      await prefs.setString('uid', user.uid);
      if (user.displayName != null) {
        await prefs.setString('username', user.displayName!);
      }
      ;

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
    } on FirebaseAuthException catch (e) {
      // Handle any errors that occur
      print('Failed to sign in with email and password: ${e.message}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final _cx = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 38,
                      width: 175,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'FC-EVENTSAPP',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Image.asset(
                      'assets/images/profile.jpg',
                      height: 100,
                      width: 100,
                    ),
                    const Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 45,
                      width: 250,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                          ),
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                _email = value.trim();
                              });
                            },
                            decoration: const InputDecoration(
                              hintText: 'Username',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 45,
                      width: 250,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                          ),
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                _password = value.trim();
                              });
                            },
                            decoration: InputDecoration(
                              hintText: 'Password',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        height: 45,
                        width: 250,
                        child: ElevatedButton(
                          onPressed: () {
                            _signInWithEmailAndPassword();
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                          child: const SizedBox(child: Text("Sign in")),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Forgot password",
                              style: TextStyle(fontSize: 14),
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUpPage(),
                                  ));
                            },
                            child: const Text(
                              "Sign up",
                              style: TextStyle(fontSize: 14),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(100, 0, 0, 0),
                      child: TextButton(
                          onPressed: () {
                            print('yes');
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginForm1(),
                                ));
                          },
                          child: Text("Organizer login")),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
