import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
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
              backgroundImage: AssetImage("Assest/logo.jpg"),
            ),
          ),
        ),
        Center(child: Text("La Gasolina", style: TextStyle(color: Colors.white, fontSize: 28),)),
        SizedBox(
          height: 20,
        ),
        Container(

            margin: EdgeInsets.only(left: 10),
            child: Text("find the nearest gas station", style: TextStyle(color: Colors.green, fontSize: 25),)),
        Container(
          margin: EdgeInsets.only(top: 10, left: 20, right: 20),
            color: Color(0xff4B4848),
            height: size.height * .6,
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.local_gas_station),
                  title: Text("Liibaan Fuel Station", style: TextStyle(color: Colors.white),),
                  subtitle: Text("New Hargeisa \n Main road 1", style: TextStyle(color: Colors.white)),
                  trailing: Icon(Icons.location_pin),
                ),
                ListTile(
                  leading: Icon(Icons.local_gas_station),
                  title: Text("Liibaan Fuel Station", style: TextStyle(color: Colors.white),),
                  subtitle: Text("New Hargeisa \n Main road 1", style: TextStyle(color: Colors.white)),
                  trailing: Icon(Icons.location_pin),
                ),
                ListTile(
                  leading: Icon(Icons.local_gas_station),
                  title: Text("Liibaan Fuel Station", style: TextStyle(color: Colors.white),),
                  subtitle: Text("New Hargeisa \n Main road 1", style: TextStyle(color: Colors.white)),
                  trailing: Icon(Icons.location_pin),
                ),
                ListTile(
                  leading: Icon(Icons.local_gas_station),
                  title: Text("Liibaan Fuel Station", style: TextStyle(color: Colors.white),),
                  subtitle: Text("New Hargeisa \n Main road 1", style: TextStyle(color: Colors.white)),
                  trailing: Icon(Icons.location_pin),
                ),
                ListTile(
                  leading: Icon(Icons.local_gas_station),
                  title: Text("Liibaan Fuel Station", style: TextStyle(color: Colors.white),),
                  subtitle: Text("New Hargeisa \n Main road 1", style: TextStyle(color: Colors.white)),
                  trailing: Icon(Icons.location_pin),
                ),
                ListTile(
                  leading: Icon(Icons.local_gas_station),
                  title: Text("Liibaan Fuel Station", style: TextStyle(color: Colors.white),),
                  subtitle: Text("New Hargeisa \n Main road 1", style: TextStyle(color: Colors.white)),
                  trailing: Icon(Icons.location_pin),
                ),
                ListTile(
                  leading: Icon(Icons.local_gas_station),
                  title: Text("Liibaan Fuel Station", style: TextStyle(color: Colors.white),),
                  subtitle: Text("New Hargeisa \n Main road 1", style: TextStyle(color: Colors.white)),
                  trailing: Icon(Icons.location_pin),
                ),
                ListTile(
                  leading: Icon(Icons.local_gas_station),
                  title: Text("Liibaan Fuel Station", style: TextStyle(color: Colors.white),),
                  subtitle: Text("New Hargeisa \n Main road 1", style: TextStyle(color: Colors.white)),
                  trailing: Icon(Icons.location_pin),
                ),
                ListTile(
                  leading: Icon(Icons.local_gas_station),
                  title: Text("Liibaan Fuel Station", style: TextStyle(color: Colors.white),),
                  subtitle: Text("New Hargeisa \n Main road 1", style: TextStyle(color: Colors.white)),
                  trailing: Icon(Icons.location_pin),
                ),
                ListTile(
                  leading: Icon(Icons.local_gas_station),
                  title: Text("Liibaan Fuel Station", style: TextStyle(color: Colors.white),),
                  subtitle: Text("New Hargeisa \n Main road 1", style: TextStyle(color: Colors.white)),
                  trailing: Icon(Icons.location_pin),
                ),
                ListTile(
                  leading: Icon(Icons.local_gas_station),
                  title: Text("Liibaan Fuel Station", style: TextStyle(color: Colors.white),),
                  subtitle: Text("New Hargeisa \n Main road 1", style: TextStyle(color: Colors.white)),
                  trailing: Icon(Icons.location_pin),
                ),
                ListTile(
                  leading: Icon(Icons.local_gas_station),
                  title: Text("Liibaan Fuel Stastion", style: TextStyle(color: Colors.white),),
                  subtitle: Text("New Hargeisa \n Main road 1", style: TextStyle(color: Colors.white)),
                  trailing: Icon(Icons.location_pin),
                ),
                ListTile(
                  leading: Icon(Icons.local_gas_station),
                  title: Text("Liibaan Fuel Station", style: TextStyle(color: Colors.white),),
                  subtitle: Text("New Hargeisa \n Main road 1", style: TextStyle(color: Colors.white)),
                  trailing: Icon(Icons.location_pin),
                ),

              ],
            ))
      ]),
    );
  }
}
