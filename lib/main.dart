import 'package:hello/users/create_page.dart';
import 'package:hello/users/events_page.dart';
import 'package:flutter/material.dart';
import 'package:hello/users/details_page.dart';
import 'package:hello/users/login_page.dart';
import 'package:hello/users/profile_page.dart';
import 'package:hello/users/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginForm(),
    );
  }
}
