

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:la_gasolina/model/station.dart';
import 'package:la_gasolina/widgets/gas_station_information.dart';
import 'package:la_gasolina/widgets/wrapper.dart';

class Station extends StatefulWidget {
   String name, vicinity, id; 
  Station({required this.name,  required this.vicinity,required this.id});

  @override
  State<Station> createState() => _StationState();
}

class _StationState extends State<Station> {
  List<Stations> favStations = [];
  var isfav = false;
  bool contains = false;
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
      id: ""
    );
    setState(() {
      favStations.add(newfav);
    });
  }

  Future<void> fetchfavs() async{
    final url =Uri.parse("https://la-gasolina-60017-default-rtdb.firebaseio.com/favs.json");
    try{
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;

     final List<Stations> LoadedList = [];
    extractedData.forEach((key, value) {
     LoadedList.add(Stations(
       name: value["name"], 
       vicinity: value["vicinity"], 
       id: key
     ));
    });
    setState(() {
       favStations=LoadedList;
    });
 
    }catch(error){
      
    }
  }
  Future<void> deleteMatch(String ID) {

     print(ID);
     final url = Uri.parse(
         "https://la-gasolina-60017-default-rtdb.firebaseio.com/favs/$ID.json");
     print("${url.toString()} pri");
     return http.delete(url).then((response) {
      // print(response.body);

      favStations.removeWhere((element) => element.id == ID);

     });
   }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchfavs();
  }
  @override
  Widget build(BuildContext context) {
    bool checkfav(String name, vicinity){
      for(var i=0; i<favStations.length; i++){
        if(name==favStations[i].name && vicinity == favStations[i].vicinity ){
          return true;
          }
      }
      return false;
  }
    
    print("===========${favStations}");
    return Card(
      color: Colors.transparent,
      child: ListTile(
                        leading: Icon(Icons.local_gas_station),
                        title: Text(widget.name, style: TextStyle(color: Colors.white),),
                        subtitle: Text(widget.vicinity, style: TextStyle(color: Colors.white)),
                        trailing: GestureDetector(
                          onTap: (){
                            setState(() {
                              Stations news =  Stations(name: widget.name, vicinity: widget.vicinity, id: "");
                              var thisID="";
                              for(var i=0; i<favStations.length; i++){
                                if(news.name==favStations[i].name && news.vicinity == favStations[i].vicinity){
                                  thisID=favStations[i].id;
                                  contains=true;
                                }
                              }
                              print("contains==== ${contains}");
                              //favcolor=Colors.red;
                              if(favStations.isEmpty){
                                addNewFav(widget.name, widget.vicinity);
                               
                              }
                              else {
                                
                                if(!contains){
                                  print("not founddd");
                                  favStations.add(news);
                                  addNewFav(widget.name, widget.vicinity);
                                }
                                else if(contains){
                                  print("i wanna delete it but cant........${thisID}");
                                  deleteMatch(thisID);
                                  favStations.removeWhere((element) => element.id==thisID);
                                }
                              }
                              
                            });
                          },
                          child: Icon(Icons.favorite, color: checkfav(widget.name, widget.vicinity)? Colors.red: favcolor,)),
        onTap: () {Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Wrapper(name: widget.name)),
        );

        },
                      ),
    );
  }
}