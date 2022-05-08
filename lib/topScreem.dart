import 'package:flutter/material.dart';
import 'package:la_gasolina/widgets/topscorer.dart';

class TopScorer extends StatefulWidget {
  const TopScorer({ Key? key }) : super(key: key);

  @override
  State<TopScorer> createState() => _TopScorerState();
}

class _TopScorerState extends State<TopScorer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Top Updaters"),
        backgroundColor: Color.fromARGB(255, 163, 162, 162),
      ),

      body: Column(
        children: [
           Center(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage("assets/logo.png"),
                      ),
                    ),
                  ),
                  Center(
                      child: Text(
                    "La Gasolina",
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  )),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(8),
              child: ListView(
                children: [
                  Container(
                    
                   height: 30,
                   decoration: BoxDecoration(
                     color: Colors.grey,
                     border: Border.all(color: Colors.white)
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                      
                        Text("Name", style:  TextStyle(color: Colors.white),),
                       Text("Score", style:  TextStyle(color: Colors.white))
                     ],
                   ),
                      ),
                     ScoreTable(name: "Aziz", score: "10",),
                     ScoreTable(name: "Semedy", score: "8"),
                     ScoreTable(name: "Abdurahim", score: "7")
                ],
              ),
            ),
          ),
        ],
      ),
       
      
    );
  }
}