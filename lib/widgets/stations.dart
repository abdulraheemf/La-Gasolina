

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:la_gasolina/model/station.dart';

class Station extends StatefulWidget {
   String name, icon, vicinity; 
  Station({required this.name, required this.icon, required this.vicinity});

  @override
  State<Station> createState() => _StationState();
}

class _StationState extends State<Station> {

  @override
  Widget build(BuildContext context) {
   
    return Card(
      color: Colors.transparent,
      child: ListTile(
                        leading: Icon(Icons.local_gas_station),
                        title: Text(widget.name, style: TextStyle(color: Colors.white),),
                        subtitle: Text(widget.vicinity, style: TextStyle(color: Colors.white)),
                        trailing: Icon(Icons.location_pin),
                      ),
    );
  }
}