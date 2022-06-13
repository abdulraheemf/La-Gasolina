import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:la_gasolina/authentication/Login%20Screen.dart';
import 'package:la_gasolina/main.dart';

import 'auth.dart';

class RegisterNewUser extends StatefulWidget {

  @override
  _RegisterNewUserState createState() => _RegisterNewUserState();
}

class _RegisterNewUserState extends State<RegisterNewUser> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController secondName = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
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
        value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black,
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(
                bottom: 0.0,
              ),
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
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
                  const Text(
                    'SIGN UP',
                    style: TextStyle(fontSize: 30, color: Colors.white, fontFamily: 'Poppins'),
                  ),
                  const Align(
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
                    padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 40),
                          height: 45,
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
                              borderRadius: const BorderRadius.all(Radius.circular(10))),
                          child: TextField(
                            controller: email,
                            obscureText: false,
                            style: const TextStyle(color: Colors.black,fontFamily: 'Poppins',),
                            decoration: const InputDecoration(
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
                              hintStyle: TextStyle(color:Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 50, right: 5, top: 18),
                      child: Text(
                        'Password',
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
                    padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      height: 45,
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
                          borderRadius: const BorderRadius.all(Radius.circular(10))),
                      child: TextField(
                        controller: password,
                        obscureText: true,
                        style: const TextStyle(color: Colors.black,fontFamily: 'Poppins',),
                        decoration: const InputDecoration(
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
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 50, right: 5, top: 40),
                      child: Text(
                        'First Name',
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
                    padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 40),
                          height: 45,
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
                              borderRadius: const BorderRadius.all(Radius.circular(10))),
                          child: TextField(
                            controller: firstName,
                            obscureText: false,
                            style: const TextStyle(color: Colors.black,fontFamily: 'Poppins',),
                            decoration: const InputDecoration(
                              icon: Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.black,
                                ),
                              ),
                              contentPadding:
                              EdgeInsets.only(left: 0, right: 20, top: 10, bottom: 10),
                              border: InputBorder.none,
                              hintText: "First Name",
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 50, right: 5, top: 40),
                      child: Text(
                        'Last Name',
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
                    padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 40),
                          height: 45,
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
                              borderRadius: const BorderRadius.all(Radius.circular(10))),
                          child: TextField(
                            controller: secondName,
                            obscureText: false,
                            style: const TextStyle(color: Colors.black,fontFamily: 'Poppins',),
                            decoration: const InputDecoration(
                              icon: Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.black,
                                ),
                              ),
                              contentPadding:
                              EdgeInsets.only(left: 0, right: 20, top: 10, bottom: 10),
                              border: InputBorder.none,
                              hintText: "Last Name",
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 50, right: 5, top: 40),
                      child: Text(
                        'Phone Number',
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
                    padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 40),
                          height: 45,
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
                              borderRadius: const BorderRadius.all(Radius.circular(10))),
                          child: TextField(
                            controller: phoneNumber,
                            obscureText: false,
                            style: const TextStyle(color: Colors.black,fontFamily: 'Poppins',),
                            decoration: const InputDecoration(
                              icon: Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Icon(
                                  Icons.phone,
                                  color: Colors.black,
                                ),
                              ),
                              contentPadding:
                              EdgeInsets.only(left: 0, right: 20, top: 10, bottom: 10),
                              border: InputBorder.none,
                              hintText: "Phone Number",
                              hintStyle: TextStyle(color: Colors.black  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 45),
                      width: double.infinity,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        color: Colors.grey,
                        child: const Text(
                          'Create New Account',
                          style: TextStyle(fontSize: 16, color: Colors.black,fontFamily: 'Poppins'),
                        ),
                        onPressed: () async {
                          FocusScope.of(context).requestFocus(FocusNode());
                          try {
                             await AuthService().registerWithEmailAndPassword(email.text, password.text,firstName.text,secondName.text,phoneNumber.text);
                             ScaffoldMessenger.of(context)
                                 .showSnackBar(const SnackBar(content: Text('Account Successfully Created!')));
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
                          } catch (e){
                          setState(() {
                          error= 'Could not create an account with these Credentials, please try with different credentials';
                          });
                        }}
                      ),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Text(error,
                    style: const TextStyle(
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


