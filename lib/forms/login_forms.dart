import 'package:flutter/material.dart';
import 'package:hello/forms/home_page.dart';
import 'package:hello/forms/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String _email = "";
  String _password = "";

  void _signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: _email, password: _password);
      // Navigate to the next screen or do something else
      print('success');
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
                            decoration: InputDecoration(
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
                      height: 20,
                    ),
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
