import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:la_gasolina/drawer.dart';
import 'package:la_gasolina/model/Postions.dart';
import 'package:la_gasolina/splash.dart';
import 'package:la_gasolina/widgets/stations.dart';
import 'package:geolocator/geolocator.dart';
import 'model/station.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Stations> stationList = [];
  List<Positions> positionList = [];
  List<Marker> markerList = [];
  Dio dio = Dio();
  double lat = 9.518015;
  double long = 45.539067;

  getCurrentLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    Position geoposition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      lat = geoposition.latitude;
      long = geoposition.longitude;
    });
  }

  Future<void> getStationData() async {
    var url =
        "https://maps.googleapis.com/maps/api/place/nearbysearch/json?keyword=gas%20station&location=$lat,$long&radius=1500&key=AIzaSyBaCYVfyzEp9ZBQoSMYKXE41UB97zktNGo";

    var response = await dio.get(url,
        options: Options(
            followRedirects: false,
            validateStatus: (status) => true,
            headers: {
              'Content-Type': 'application/x-www-form-urlencoded',
            }));
    //print(response.data['results'][2]['name']);

    final List<Stations> loadedList = [];
    var gasindex = 0;
    for (var u in response.data['results']) {
      if (gasindex < 10) {
        Stations newst = Stations(name: u['name'], vicinity: u['vicinity']);

        Marker newMark = Marker(
            markerId: MarkerId(u["name"]),
            position: LatLng(u["geometry"]["location"]["lat"],
                u["geometry"]["location"]["lng"]));
        loadedList.add(newst);
        markerList.add(newMark);
      }
      gasindex++;
      print(response.statusCode);
      print("..2....${positionList}");
    }
    setState(() {
      stationList = loadedList;
    });
    print(stationList);
  }

  void initState() {
    getCurrentLocation();

    Future.delayed(
      const Duration(seconds: 5),
      () => getStationData(),
    );
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: DrawerScreen(),
      backgroundColor: Colors.black,
      appBar: AppBar(
        // title: Text("La Gasolina"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: GestureDetector(
                        onTap: () => getCurrentLocation(),
                        child: CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage("assets/logo.png"),
                        ),
                      ),
                    ),
                  ),
                  Center(
                      child: Text(
                    "La Gasolina",
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Find the nearest gas station",
                            style: TextStyle(color: Colors.green, fontSize: 25),
                          ))),
                  currentIndex == 0
                      ? Container(
                          decoration: BoxDecoration(
                              color: Color(0xff4B4848),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                  bottomRight: Radius.circular(12),
                                  bottomLeft: Radius.circular(12))),
                          margin: EdgeInsets.only(top: 0, left: 5, right: 5),
                          padding: EdgeInsets.all(1),
                          height: size.height * .5,
                          child: ListView(
                            children: [
                              ...stationList
                                  .map(
                                    (e) => Station(
                                        name: e.name, vicinity: e.vicinity),
                                  )
                                  .toList(),
                            ],
                          ))
                      : Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 131, 127, 127),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                  bottomRight: Radius.circular(12),
                                  bottomLeft: Radius.circular(12))),
                          margin: EdgeInsets.only(top: 0, left: 5, right: 5),
                          padding: EdgeInsets.all(1),
                          height: size.height * .5,
                          child: GoogleMap(
                            markers: {...markerList.map((e) => e)},
                            initialCameraPosition: CameraPosition(
                                target: LatLng(lat, long), zoom: 12),
                            zoomControlsEnabled: true,
                          )),
                ]),
          ),
          BottomNavigationBar(
            currentIndex: currentIndex,
            type: BottomNavigationBarType.shifting,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: "List",
                backgroundColor: Colors.black,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.map),
                label: "Map",
                backgroundColor: Color(0xff4B4848),
              )
            ],
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ],
      ),
    );
  }
}
