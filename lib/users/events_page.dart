import 'package:flutter/material.dart';
import 'package:hello/users/details_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hello/users/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyListView extends StatefulWidget {
  const MyListView({
    super.key,
  });

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;
  String? userEmail;
  String? _userEmail;
  List<bool> _isFavoriteList = [];

  @override
  void initState() {
    super.initState();
    collectionReference = firestore.collection('events');
    getUserEmail();
    _isFavoriteList = List.filled(0, false);
    collectionReference.get().then((querySnapshot) {
      setState(() {
        _isFavoriteList = List.filled(querySnapshot.docs.length, false);
      });
    });
  }

  Future<void> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    userEmail = prefs.getString('email');
    print(userEmail);
    if (userEmail == null) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginForm(),
          ));
    }
    setState(() {
      _userEmail = userEmail;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 159, 205, 232),
        elevation: 0,
        title: const Text('Events'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: collectionReference.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Loading...');
          }

          if (_isFavoriteList.isEmpty) {
            _isFavoriteList =
                List.generate(snapshot.data!.docs.length, (_) => false);
            print('fav reinitialised');
          }
          print(_isFavoriteList);

          return ListView.builder(
            padding: EdgeInsets.all(16.0),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              Map<String, dynamic> data =
                  snapshot.data!.docs[index].data() as Map<String, dynamic>;
              String collectionId = snapshot.data!.docs[index].id;
              return Card(
                elevation: 3.0,
                child: ListTile(
                  visualDensity: VisualDensity(vertical: 4),
                  leading: SizedBox(
                    width: 70,
                    height: 100,
                    child: ClipRRect(
                      child: Image.network(
                        data['imageUrl'] ??
                            'https://t4.ftcdn.net/jpg/04/99/93/31/360_F_499933117_ZAUBfv3P1HEOsZDrnkbNCt4jc3AodArl.jpg',
                        fit: BoxFit.cover,
                        width: 70.0,
                        height: 100.0,
                      ),
                    ),
                  ),
                  title: Text(data['Eventname']?.toString() ?? 'Default Title'),
                  subtitle: Text(
                      data['Eventdescription']?.toString() ?? 'Default Title'),
                  trailing: IconButton(
                    icon: Container(
                      height: 20, // Change the height of the heart icon here
                      width: 20, // Change the width of the heart icon here
                      child: _isFavoriteList[index]
                          ? Icon(Icons.favorite, size: 20, color: Colors.red)
                          : Icon(Icons.favorite_border, size: 20),
                    ),
                    onPressed: () {
                      print('fav clicked');
                      print(_isFavoriteList);

                      setState(() {
                        _isFavoriteList[index] = !_isFavoriteList[index];
                      });
                      print(_isFavoriteList);
                      // Add your favorite button onPressed functionality here
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MyPage(data: data, collectionId: collectionId),
                        )); // Navigate to a detail screen or perform some action
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
