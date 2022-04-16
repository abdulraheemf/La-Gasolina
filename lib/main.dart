import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:la_gasolina/widgets/stations.dart';

import 'model/station.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   List<Stations> stationList =[];
  Dio dio = Dio();
  Future <void> getStationData() async{
    var url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?keyword=gas%20station&location=9.5178081,45.5391096&radius=1500&key=AIzaSyBaCYVfyzEp9ZBQoSMYKXE41UB97zktNGo";
    
      var response = await dio.get(url, options: Options(
          followRedirects: false,
          validateStatus: (status) => true,
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
          }
      ));
      //print(response.data['results'][2]['name']);
   final List<Stations>loadedList =[];

   for (int i=0; i<10; i++){
     Stations newst = Stations(name: response.data['results'][i]['name'], icon: response.data['results'][i]['icon'], vicinity: response.data['results'][i]['vicinity']);
    loadedList.add(newst);
    
   }
   setState(() {
       stationList=loadedList;
    });
   print(stationList);

}
 void initState(){
   getStationData();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        // title: Text("La Gasolina"),
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.only( bottom: 20),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/logo.jpg"),
                ),
              ),
            ),
            Center(child: Text("La Gasolina", style: TextStyle(color: Colors.white, fontSize: 28),)),
            SizedBox(
              height: 20,
            ),
            Container(

                margin: EdgeInsets.only(left: 10),
                child: Text("Find the nearest gas station", style: TextStyle(color: Colors.green, fontSize: 25),)),
            Container(
              decoration: BoxDecoration(
                color: Color(0xff4B4848),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12))
              ),
                margin: EdgeInsets.only(top: 10, left: 5, right: 5),
                padding: EdgeInsets.only(top: 1),
                height: size.height * .6,
                child: ListView(
                  children: [
                    ...stationList.map((e) => Station(name: e.name, icon: e.icon, vicinity: e.vicinity),).toList(),


                  ],
                ))
          ]),
    );
  }
}