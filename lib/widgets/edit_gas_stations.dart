import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:la_gasolina/services/database.dart';
import 'package:la_gasolina/widgets/existing_gas_information.dart';

class editGasStation extends StatefulWidget {
  String name;
  editGasStation({required this.name});

  @override
  State<editGasStation> createState() => _editGasStationState();
}

class _editGasStationState extends State<editGasStation> {
  final TextEditingController diesel = TextEditingController();
  final TextEditingController petrol = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.name),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Price information for ' + widget.name +' per litre',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30
              ),
            ),
          ),
          const SizedBox(height: 10,),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Diesel:',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    )
                  ],
                  color: Colors.grey,
                  borderRadius: const BorderRadius.all(const Radius.circular(10))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: new InputDecoration.collapsed(
                      hintText: 'Insert New Diesel Price'
                  ),
                  controller: diesel,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 25
                  ),
                ),
              ),
            ),
          ) ,
          const SizedBox(height: 10,),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child:  Text(
                'Petroleum:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    )
                  ],
                  color: Colors.grey,
                  borderRadius: const BorderRadius.all(const Radius.circular(10))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: new InputDecoration.collapsed(
                      hintText: 'Insert New Petroleum Price'
                  ),
                  controller: petrol,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 25
                  ),
                ),
              ),
            ),
          ) ,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Update Gas Station prices regularly and get on the Top Updaters table for a special discount at the end of the month!',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15
              ),
            ),
          ),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            // <-- Your height
            child: Container(

              width: 500, // <-- Your width
              height: 45,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(5)
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey,

                ),
                onPressed: () {
                  DatabaseService(uid: '0').addGasStation(widget.name, diesel.text, petrol.text);
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Successfully Modified Price of '+ widget.name)));
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => exist_gasStationInfo(name: widget.name)),
                  );
                },
                child: const Text('Update Price', style: TextStyle(fontSize: 20,color: Colors.black)),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
