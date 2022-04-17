import 'package:flutter/material.dart';

import 'authentication/Login Screen.dart';
import 'authentication/signUp.dart';


class DrawerScreen extends StatelessWidget {
  const DrawerScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.black,
        //other styles
      ),
      child: Drawer(
        child: SafeArea(
          child: Column(children: [
            Row(
              children: [

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Container(
                        height: 200,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(50, 70, 50, 50),
                          child: Center(child: Text("Login or Register", style: TextStyle(fontSize: 30, color: Colors.black))),
                        )),
                  ),
                )
              ],
            ),
            GestureDetector(
              onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage(),
                 ));
              },
              child: const Card(
                child: ListTile(
                  tileColor: Colors.grey,
                  leading:Icon(Icons.login),
                  title: Text("Login"),
                ),

              ),
            ),
            GestureDetector(
              onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterNewUser(),
                 ));
              },
              child: const Card(
                child: ListTile(
                  tileColor: Colors.grey,
                  leading:Icon(Icons.app_registration_outlined),
                  title: Text("Signup"),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}