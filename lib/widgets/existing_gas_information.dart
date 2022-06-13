import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:la_gasolina/services/database.dart';

import 'edit_gas_stations.dart';

class exist_gasStationInfo extends StatelessWidget {
  String name;
  exist_gasStationInfo({required this.name});
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final User? user = auth.currentUser;
    final String? uid = user?.uid;
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection('gas_stations').doc(name).snapshots(),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          var output = snapshot.data!.data();
          String dieselPrice = output!['diesel_price'];
          String petrolPrice = output['petrol_price'];
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              title: Text(name),
              backgroundColor: Colors.black,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Price information for ' + name +' per litre',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Diesel:',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          )
                        ],
                        color: Colors.grey,
                        borderRadius: const BorderRadius.all(const Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:  Text(
                        "₺"+ dieselPrice,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25
                        ),
                      ),
                    ),
                  ),
                ) ,
                const SizedBox(height: 10,),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child:  Text(
                      'Petroleum:',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          )
                        ],
                        color: Colors.grey,
                        borderRadius: const BorderRadius.all(const Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "₺"+ petrolPrice,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25
                        ),
                      ),
                    ),
                  ),
                ) ,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'To update the price for ' + name+ ', press the "Update Price" button below',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Update Gas Station prices regularly and get on the Top Updaters table for a special discount at the end of the month!',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15
                    ),
                  ),
                ),
                Expanded(child:Container()),
                Padding(
                  padding: const EdgeInsets.all(8.0),
// <-- Your height
                  child: Container(

                    width: 300, // <-- Your width
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey,

                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => editGasStation(name: name)),
                        );
                      },
                      child: const Text('Update Price', style: TextStyle(fontSize: 20,color: Colors.black)),
                    ),
                  ),
                ),

              ],
            ),
          );
        }
        else {
          return const Scaffold(
            backgroundColor:Color(0xFF5a5a5a),
            body: Center(child: CircularProgressIndicator(
              color: Colors.white,
            )),
          );
        }
      },
    );





  }
}


