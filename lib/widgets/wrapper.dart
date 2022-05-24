import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:la_gasolina/main.dart';
import 'package:la_gasolina/widgets/existing_gas_information.dart';
import 'package:la_gasolina/widgets/gas_station_information.dart';

class Wrapper extends StatelessWidget {
  String name ;

  Wrapper({required this.name});


  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('gas_stations');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(name).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          print("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return gasStationInfo(name: name);
        }

        if (snapshot.connectionState == ConnectionState.done) {

          return exist_gasStationInfo(name: name);
        }

        return const Scaffold(
          backgroundColor:Color(0xFF5a5a5a),
          body: Center(child: CircularProgressIndicator(
            color: Colors.white,
          )),
        );
      },
    );
    // return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
    //   stream: FirebaseFirestore.instance.collection('gas_stations').doc(name).snapshots(),
    //   builder: (_, snapshot) {
    //     if (!snapshot.) {
    //       return const Scaffold(
    //         backgroundColor:Color(0xFF5a5a5a),
    //         body: Center(child: CircularProgressIndicator(
    //           color: Colors.white,
    //         )),
    //       );
    //     }
    //     else {
    //       return MyApp();
    //     }
    //   },
    // );
  }
}