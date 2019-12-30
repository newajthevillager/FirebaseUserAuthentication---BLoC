import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class UserRepository {
  FirebaseAuth firebaseAuth;

  UserRepository() {
    this.firebaseAuth = FirebaseAuth.instance;
  }

  // sign up with email
  Future<FirebaseUser> signUpUserWithEmailPass(
      String email, String pass) async {
    try {
      var authResult = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      print("REPO : ${authResult.user.email}");
      return authResult.user;
    } on PlatformException catch (error) {
      List<String> errors = error.toString().split(',');
      throw Exception(errors[1].toString());
    }
  }

  // sign in with email and password
  Future<FirebaseUser> signInEmailAndPassword(
      String email, String password) async {
    var authresult = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return authresult.user;
  }

  // sign out
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  // check signIn
  Future<bool> isSignedIn() async {
    var currentUser = await firebaseAuth.currentUser();
    return currentUser != null;
  }

  // get current user
  Future<FirebaseUser> getCurrentUser() async {
    return await FirebaseAuth.instance.currentUser();
  }
}
