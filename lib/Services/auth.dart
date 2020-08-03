import 'package:brew_crew/Services/database.dart';
import 'package:brew_crew/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

// create user obj based on firebase user
  User _userfromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

//auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map((FirebaseUser user) => _userfromFirebaseUser(user));
  }

//signin anon
  Future signInAnon() async {
    try {
      final result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      //return user;
      return _userfromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //email and pass login

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      await DataBaseService(uid: user.uid).updateUserData('0', 'new crew', 100);
      return _userfromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future SignInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userfromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //singout

  Future SignOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
