import 'dart:async';
import 'package:flutter/material.dart';
import 'package:la_gasolina/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), onclose);
  }
  void onclose(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => MyApp()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset("assets/splash.png", fit: BoxFit.fill,),
            ],),
        )
    );
  }
}
