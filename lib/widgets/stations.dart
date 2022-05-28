

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
  var isfav = false;
  Color favcolor = Colors.white;
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