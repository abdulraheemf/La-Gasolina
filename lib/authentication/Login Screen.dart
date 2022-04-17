import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            icon: Icon(Icons.arrow_back,
            color: Colors.grey,),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: 0.0,
              ),
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [

                  Center(
                    child: Container(
                      margin: EdgeInsets.only( bottom: 20),
                      child: GestureDetector(
                        child: CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.transparent ,
                          backgroundImage: AssetImage("assets/logo.png"),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'LOG IN',
                    style: TextStyle(fontSize: 30, color: Colors.white, fontFamily: 'Poppins'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 50, right: 5, top: 40),
                      child: Text(
                        'Email',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 5, top: 5),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          height: 45,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                )
                              ],
                              color: Colors.grey,
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: TextField(
                            controller: _email,
                            obscureText: false,
                            style: TextStyle(color: Colors.black,fontFamily: 'Poppins',),
                            decoration: InputDecoration(
                              icon: Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Icon(
                                  Icons.email,
                                  color: Colors.black,
                                ),
                              ),
                              contentPadding:
                              EdgeInsets.only(left: 0, right: 20, top: 10, bottom: 10),
                              border: InputBorder.none,
                              hintText: "Email",
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 50, right: 5, top: 18),
                      child: Text(
                        'Password',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 13,
                          color:Colors.white,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 5, top: 5),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      height: 45,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            )
                          ],
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: TextField(
                        controller: _password,
                        obscureText: true,
                        style: TextStyle(color: Colors.black,fontFamily: 'Poppins',),
                        decoration: InputDecoration(
                          icon: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Icon(
                              Icons.lock,
                              color: Colors.black,
                            ),
                          ),
                          contentPadding:
                          EdgeInsets.only(left: 0, right: 20, top: 10, bottom: 10),
                          border: InputBorder.none,
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 45),
                      width: double.infinity,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        color: Colors.grey,
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 16, color: Colors.black,fontFamily: 'Poppins'),
                        ),
                        onPressed: () async {

                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(error,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Poppins'
                    ),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


