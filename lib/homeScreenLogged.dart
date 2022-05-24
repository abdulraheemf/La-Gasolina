import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:la_gasolina/drawerLoggedIN.dart';
import 'package:la_gasolina/topScreem.dart';
import 'package:la_gasolina/widgets/gas_station_information.dart';
import 'package:la_gasolina/widgets/stations.dart';

import 'model/Postions.dart';
import 'model/station.dart';

class MyAppLogged extends StatefulWidget {
const MyAppLogged({Key? key}) : super(key: key);

@override
State<MyAppLogged> createState() => _MyAppLoggedState();
}

class _MyAppLoggedState extends State<MyAppLogged> {
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
      Marker newMark = Marker(
        markerId: MarkerId("currentlocation"),
        infoWindow: const InfoWindow(title: "Origin"),
        position: LatLng(
          geoposition.latitude,
          geoposition.longitude,
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      );
      markerList.add(newMark);
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

    final List<Stations> loadedList = [];
    var gasindex = 0;
    for (var u in response.data['results']) {
      if (gasindex < 10) {
        Stations newst = Stations(name: u['name'], vicinity: u['vicinity']);

        Marker newMark = Marker(

            markerId: MarkerId(u["name"]),
            infoWindow:  InfoWindow(title: u["name"],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  gasStationInfo(name: u['name'])),
                  );
                }
            ),
            position: LatLng(u["geometry"]["location"]["lat"],
                u["geometry"]["location"]["lng"]));
        loadedList.add(newst);
        markerList.add(newMark);
      }
      gasindex++;
    }
    setState(() {
      stationList = loadedList;
    });
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
      drawer: DrawerScreenL(),
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
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => TopScorer(),));
                            },
                            child: Text(
                              "Find the nearest gas station",
                              style: TextStyle(color: Colors.green, fontSize: 25),
                            ),
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