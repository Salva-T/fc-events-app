import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hello/forms/home_page.dart';
import 'package:hello/forms/login_forms.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _cx = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
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
                      height: 10,
                    ),
                    Image.asset(
                      'assets/images/profile.jpg',
                      height: 100,
                      width: 100,
                    ),
                    const Text(
                      "Sign up ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 30,
                      width: 250,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                          ),
                          child: TextFormField(
                            controller: _emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Email Id',
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
                      height: 30,
                      width: 250,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                          ),
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
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
                      height: 30,
                      width: 250,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              hintText: 'Full Name',
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
                      height: 30,
                      width: 250,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              hintText: 'Register Number',
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
                      height: 30,
                      width: 250,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              hintText: 'Department',
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
                      height: 30,
                      width: 250,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              hintText: 'phone Number',
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
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              try {
                                UserCredential userCredential =
                                    await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                );
                                print(
                                    'User registered: ${userCredential.user?.uid}');
                                Fluttertoast.showToast(
                                    msg: 'User registered successfully');
                              } on FirebaseAuthException catch (e) {
                                print('Failed to register user: $e');
                                Fluttertoast.showToast(
                                    msg: 'Failed to register user');
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                          child: const SizedBox(child: Text("Sign up")),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(fontSize: 14),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginForm(),
                                  ));
                            },
                            child: const Text(
                              "Log in",
                              style: TextStyle(fontSize: 14),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
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
