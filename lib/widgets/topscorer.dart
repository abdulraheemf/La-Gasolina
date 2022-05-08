import 'package:flutter/material.dart';

class ScoreTable extends StatefulWidget {
  String name, score;
  ScoreTable({required this.name, required this.score});

  @override
  State<ScoreTable> createState() => _ScoreTableState();
}

class _ScoreTableState extends State<ScoreTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(border: Border.all(color: Colors.white)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            child: Text(
              widget.name,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Text(widget.score, style: TextStyle(color: Colors.white))
        ],
      ),
    );
  }
}
