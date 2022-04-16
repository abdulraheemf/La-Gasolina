import 'package:flutter/material.dart';

class Station extends StatefulWidget {
  const Station({ Key? key }) : super(key: key);

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
                        title: Text("Liibaan Fuel Station", style: TextStyle(color: Colors.white),),
                        subtitle: Text("New Hargeisa \n Main road 1", style: TextStyle(color: Colors.white)),
                        trailing: Icon(Icons.location_pin),
                      ),
    );
  }
}