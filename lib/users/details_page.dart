import 'package:flutter/material.dart';
import 'package:hello/users/create_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class MyPage extends StatelessWidget {
  final Map<String, dynamic> data;
  String collectionId;
  MyPage({required this.data, required this.collectionId});
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data['Eventname'],
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
          textAlign: TextAlign.left,
        ),
        backgroundColor: Color.fromARGB(228, 202, 196, 196),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.network(
                  data['imageUrl'] ??
                      'https://t4.ftcdn.net/jpg/04/99/93/31/360_F_499933117_ZAUBfv3P1HEOsZDrnkbNCt4jc3AodArl.jpg',
                  height: 400,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                size: 15,
                              ),
                              Text(
                                data['location'],
                                style: const TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                          const Text(
                            "3 PM",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'About',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(data['Eventdescription']?.toString() ??
                          'Default Title'),
                      const SizedBox(height: 10),
                      Text(
                        DateFormat('dd-MM-yyyy').format(data['date'].toDate()),
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Material(
                          color: const Color.fromARGB(228, 202, 196, 196),
                          child: MaterialButton(
                            child: const Text(
                              'REGISTER',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            onPressed: () {
                              Map<String, dynamic> data = {
                                'collectionId': collectionId,
                                'UserId': user!.uid,
                              };
                              // firestore.collection('events').doc().set(data);
                              firestore.collection('registrations').add(data);

                              void showSuccessDialog(BuildContext context) {
                                // Show a pop-up dialog
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    // Return the AlertDialog
                                    return AlertDialog(
                                      title:
                                          const Text("Registration Successful"),
                                      content: const Text(
                                          "You have successfully registered."),
                                      actions: [
                                        TextButton(
                                          child: const Text("OK"),
                                          onPressed: () {
                                            // Close the dialog box
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }

                              // Assume registration was successful
                              bool registrationSuccessful = true;

                              if (registrationSuccessful) {
                                // Show the success dialog box
                                showSuccessDialog(context);
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            //Material(
            //  child: MaterialButton(
            //    onPressed: () {},
            //    child: const Text(
            //     'Feedback',
            //      textAlign: TextAlign.left,
            //    ),
            //  ),
            //)
          ],
        ),
      ),
    );
  }
}
//print('collectionid : $collectionId');
