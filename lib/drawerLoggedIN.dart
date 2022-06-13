import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:la_gasolina/main.dart';


class DrawerScreenL extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final User? user = auth.currentUser;
    final String? uid = user?.uid;
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection('users').doc(uid).snapshots(),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          var output = snapshot.data!.data();
          String firstName = output!['firstname'];
          String secondName = output['secondName'];
          return Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.black,
              //other styles
            ),
            child: Drawer(
              child: SafeArea(
                child: Column(children: [

                  Row(
                    children: [

                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Container(
                              height: 200,
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                              ),
                              child:  Padding(
                                padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                                child: Center(child: Text("Hello $firstName $secondName", style: TextStyle(fontSize: 30, color: Colors.black))),
                              )),
                        ),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: (){
                      auth.signOut();
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text('Successfully Logged Out')));
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp()),
                            (Route<dynamic> route) => false,
                      );
                    },
                    child: const Card(
                      child: ListTile(
                        tileColor: Colors.grey,
                        leading:Icon(Icons.logout),
                        title: Text("Sign Out"),
                      ),

                    ),
                  ),
                ]),
              ),
            ),
          );
        }
        else {
          return const CircularProgressIndicator();
        }
      },
    );





  }
}