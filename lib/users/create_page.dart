import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hello/organiser/org_home.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as Path;
import 'dart:io';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class CreateEventPage extends StatefulWidget {
  const CreateEventPage({super.key});

  @override
  _CreateEventPageState createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  String eventName = '';
  String eventDescription = '';
  String _imageUrl = '';
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = const TimeOfDay(hour: 0, minute: 0);
  String location = '';
  User? user = FirebaseAuth.instance.currentUser;

  // Function to show date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // Function to show time picker
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  //function to upload the image:
  Future<void> _uploadImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final fileName = Path.basename(pickedFile.path);
      final destination = 'images/$fileName';
      final storageRef =
          firebase_storage.FirebaseStorage.instance.ref().child(destination);
      final uploadTask = storageRef.putFile(File(pickedFile.path));
      await uploadTask.whenComplete(() => null);
      final imageUrl = await storageRef.getDownloadURL();
      print('Image uploaded: $imageUrl');
      setState(() {
        _imageUrl = imageUrl;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Event'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Name of the event',
                ),
                onChanged: (value) {
                  setState(() {
                    eventName = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
                onChanged: (value) {
                  setState(() {
                    eventDescription = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () {
                  _selectDate(context);
                },
                child: Row(
                  children: [
                    const Icon(Icons.calendar_today),
                    const SizedBox(width: 16),
                    Text(
                      '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () {
                  _selectTime(context);
                },
                child: Row(
                  children: [
                    const Icon(Icons.access_time),
                    const SizedBox(width: 16),
                    Text(
                      '${selectedTime.hour}:${selectedTime.minute}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _uploadImage,
                child: const Text('Upload Image'),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Location',
                ),
                onChanged: (value) {
                  setState(() {
                    location = value;
                  });
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  Map<String, dynamic> data = {
                    'Eventname': eventName,
                    'Eventdescription': eventDescription,
                    'imageUrl': _imageUrl,
                    'location': location,
                    'date': selectedDate,
                    'UserId': user!.uid,
                  };
                  // firestore.collection('events').doc().set(data);
                  firestore.collection('events').add(data);

                  // Add code here to save event to database
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: const Text("You Have Registered Successfully"),
                        actions: <Widget>[
                          ElevatedButton(
                            child: const Text("OK"),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OrgHome()),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ); //pop up
                },
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
