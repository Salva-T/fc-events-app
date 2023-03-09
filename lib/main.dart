import 'package:hello/forms/create_page.dart';
import 'package:hello/forms/event1.dart';
import 'package:flutter/material.dart';
import 'package:hello/forms/event_details.dart';
import 'package:hello/forms/login_forms.dart';
import 'package:hello/forms/profile_page.dart';
import 'package:hello/forms/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo1',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          splashFactory: InkRipple.splashFactory),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: LoginForm(),
    );
  }
}
