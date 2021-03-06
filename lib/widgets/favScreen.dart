import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:la_gasolina/widgets/favStationCard.dart';

import '../model/station.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({ Key? key }) : super(key: key);

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  List<Stations> favStations=[];
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
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Center(child: Text("Favorites")),
      ),
      body: Container(
                          decoration: BoxDecoration(
                              color: Color(0xff4B4848),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                  bottomRight: Radius.circular(12),
                                  bottomLeft: Radius.circular(12))),
                          margin: EdgeInsets.only(top: 0, left: 5, right: 5),
                          padding: EdgeInsets.all(1),
                          child: ListView(
                            children: [
                              ...favStations
                                  .map(
                                    (e) => Dismissible(
                                      key: UniqueKey(),
                                      onDismissed: (direction){
                                        setState(() {
                                          deleteMatch(e.id);
                                          favStations.removeWhere((element) => element.id==e.id);
                                          
                                        });
                                        ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(content: Text('Successfully removed from Favorites')));
                                      },
                                      child: Station(
                                          name: e.name, vicinity: e.vicinity),
                                    ),
                                  )
                                  .toList(),
                            ])),
    );
  }
}