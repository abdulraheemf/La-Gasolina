import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({ required this.uid });

  Future<void> addUser(String firstName,String secondName,String phone) async {
    FirebaseFirestore.instance.collection('users').doc(uid)
        .set({
      'uid' : uid,
      'firstname': firstName,
      'secondName': secondName,
      'phone' : phone,
      "favorites": <String>[],
      'update' : 0,
    }) ;
  }

  Future<void> updatedUser() async{

  }
  Future<void> addGasStation(String name,String petrolPrice,String dieselPrice) async {
    FirebaseFirestore.instance.collection('gas_stations').doc(name)
        .set({
      'gas_station_name': name,
      'petrol_price': petrolPrice,
      'diesel_price' : dieselPrice,
    }) ;
  }




}