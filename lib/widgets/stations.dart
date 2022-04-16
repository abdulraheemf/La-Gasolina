

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Station extends StatefulWidget {
  const Station({ Key? key }) : super(key: key);

  @override
  State<Station> createState() => _StationState();
}

class _StationState extends State<Station> {
  getStationData() async{
    var header = "maps.googleapis.com";
    var resturl = "maps/api/place/nearbysearch/json?keyword=gas%20station&location=38.734802%2C35.467987&radius=1500&type=gas&key=AIzaSyBaCYVfyzEp9ZBQoSMYKXE41UB97zktNGo";
    var response = await http.get(Uri.https(header, resturl));
    var encodeFirst = json.encode(response.body);
    var jsonData = jsonDecode(encodeFirst);
    print(jsonData);
  }
  @override
  Widget build(BuildContext context) {
    getStationData();
    return Card(
      color: Colors.transparent,
      child: ListTile(
                        leading: Icon(Icons.local_gas_station),
                        title: Text("Liibaan Fuel Station", style: TextStyle(color: Colors.white),),
                        subtitle: Text("New Hargeisa \n Main road 1", style: TextStyle(color: Colors.white)),
                        trailing: Icon(Icons.location_pin),
                      ),
    );
  }
}