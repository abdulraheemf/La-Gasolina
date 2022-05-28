

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:la_gasolina/model/station.dart';
import 'package:la_gasolina/widgets/gas_station_information.dart';
import 'package:la_gasolina/widgets/wrapper.dart';

class Station extends StatefulWidget {
   String name, vicinity; 
  Station({required this.name,  required this.vicinity});

  @override
  State<Station> createState() => _StationState();
}

class _StationState extends State<Station> {
  List<Stations> favStations = [];
  var isfav = false;
  Color favcolor = Colors.white;

  void addNewFav(String name, String vicinity){
    final url = Uri.parse("https://la-gasolina-60017-default-rtdb.firebaseio.com/favs.json");
    http.post(url, body: json.encode({
      'name': name,
      'vicinity': vicinity,
    }));
    final newfav = Stations(
      name: name,
      vicinity: vicinity,
    );
    setState(() {
      favStations.add(newfav);
    });
  }
  @override
  Widget build(BuildContext context) {
   
    return Card(
      color: Colors.transparent,
      child: ListTile(
                        leading: Icon(Icons.local_gas_station),
                        title: Text(widget.name, style: TextStyle(color: Colors.white),),
                        subtitle: Text(widget.vicinity, style: TextStyle(color: Colors.white)),
                        trailing: GestureDetector(
                          onTap: (){
                            setState(() {
                              favcolor = Colors.red;
                              addNewFav(widget.name, widget.vicinity);
                            });
                          },
                          child: Icon(Icons.favorite, color: favcolor,)),
        onTap: () {Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Wrapper(name: widget.name)),
        );

        },
                      ),
    );
  }
}