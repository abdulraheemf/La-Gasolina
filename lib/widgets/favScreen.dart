import 'package:flutter/material.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({ Key? key }) : super(key: key);

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Center(child: Text("Favorites")),
      ),

    );
  }
}