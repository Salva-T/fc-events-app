import 'package:flutter/material.dart';

class UserMessage extends StatefulWidget {
  const UserMessage({super.key});

  @override
  State<UserMessage> createState() => _UserMessageState();
}

class _UserMessageState extends State<UserMessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 159, 205, 232),
        title: const Text('Notifications'),
      ),
      body: Card(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          children: [
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.notifications_outlined),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              '22/03/22',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14.0,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            const Text(
                              "Hi there! This is a quick reminder that the seminar you registered for, 'Leadership in the Digital Age', is happening today at 10 AM. The event will be held in the main conference hall, and we can't wait to see you there!",
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        (Icons.notifications_outlined),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              '26/03/22',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14.0,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            const Text(
                              'Hello! This is a friendly reminder that your registered event, TedXFarookCollege, is happening today at 3 PM. The event will take place at AVT, and we cant wait for you to join us!',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        (Icons.notifications_outlined),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              '31/03/22',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14.0,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            const Text(
                              "Hey there! This is a friendly reminder that the training session you registered for, 'Customer Service Excellence', is happening tomorrow at 9 AM. The event will take place in the training room, and we're excited to have you there!",
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
