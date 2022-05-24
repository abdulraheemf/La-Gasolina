import 'package:firebase_auth/firebase_auth.dart';

import '../services/database.dart';
import '../services/user.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;


  UserNor? _userFromFirebaseUser(String? user) {
    return user != null ? UserNor(uid: user) : null;
  }
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      String? user = result.user?.uid;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password, String firstName, String secondName, String phone) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      String? user = result.user?.uid;
      await DatabaseService(uid: user).addUser(firstName,secondName,phone);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

}