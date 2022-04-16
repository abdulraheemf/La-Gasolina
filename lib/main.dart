import 'package:flutter/material.dart';
import 'package:la_gasolina/widgets/stations.dart';

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
                    Station(),
                    Station(),
                    Station(),
                    Station(),
                    Station(),
                    Station(),
                    Station(),
                    Station(),

                  ],
                ))
          ]),
    );
  }
}