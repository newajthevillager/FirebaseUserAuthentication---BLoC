import 'package:FirebaseUserSignIn/utils/error_codes.dart';
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
    } on PlatformException catch (e) {
      String authError = "";
      switch (e.code) {
        case ErrorCodes.ERROR_C0DE_NETWORK_ERROR:
          authError = ErrorMessages.ERROR_C0DE_NETWORK_ERROR;
          break;
        case ErrorCodes.ERROR_USER_NOT_FOUND:
          authError = ErrorMessages.ERROR_USER_NOT_FOUND;
          break;
        case ErrorCodes.ERROR_TOO_MANY_REQUESTS:
          authError = ErrorMessages.ERROR_TOO_MANY_REQUESTS;
          break;
        case ErrorCodes.ERROR_INVALID_EMAIL:
          authError = ErrorMessages.ERROR_INVALID_EMAIL;
          break;
        case ErrorCodes.ERROR_CODE_USER_DISABLED:
          authError = ErrorMessages.ERROR_CODE_USER_DISABLED;
          break;
        case ErrorCodes.ERROR_CODE_WRONG_PASSWORD:
          authError = ErrorMessages.ERROR_CODE_WRONG_PASSWORD;
          break;
        case ErrorCodes.ERROR_CODE_EMAIL_ALREADY_IN_USE:
          authError = ErrorMessages.ERROR_CODE_EMAIL_ALREADY_IN_USE;
          break;
        case ErrorCodes.ERROR_OPERATION_NOT_ALLOWED:
          authError = ErrorMessages.ERROR_OPERATION_NOT_ALLOWED;
          break;
        case ErrorCodes.ERROR_CODE_WEAK_PASSWORD:
          authError = ErrorMessages.ERROR_CODE_WEAK_PASSWORD;
          break;
        default:
          authError = ErrorMessages.DEFAULT;
          break;
      }
      throw Exception(authError);
    }
  }

  // sign in with email and password
  Future<FirebaseUser> signInEmailAndPassword(
      String email, String password) async {
    try {
      var authresult = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return authresult.user;
    } on PlatformException catch (e) {
      String authError = "";
      switch (e.code) {
        case ErrorCodes.ERROR_C0DE_NETWORK_ERROR:
          authError = ErrorMessages.ERROR_C0DE_NETWORK_ERROR;
          break;
        case ErrorCodes.ERROR_USER_NOT_FOUND:
          authError = ErrorMessages.ERROR_USER_NOT_FOUND;
          break;
        case ErrorCodes.ERROR_TOO_MANY_REQUESTS:
          authError = ErrorMessages.ERROR_TOO_MANY_REQUESTS;
          break;
        case ErrorCodes.ERROR_INVALID_EMAIL:
          authError = ErrorMessages.ERROR_INVALID_EMAIL;
          break;
        case ErrorCodes.ERROR_CODE_USER_DISABLED:
          authError = ErrorMessages.ERROR_CODE_USER_DISABLED;
          break;
        case ErrorCodes.ERROR_CODE_WRONG_PASSWORD:
          authError = ErrorMessages.ERROR_CODE_WRONG_PASSWORD;
          break;
        case ErrorCodes.ERROR_CODE_EMAIL_ALREADY_IN_USE:
          authError = ErrorMessages.ERROR_CODE_EMAIL_ALREADY_IN_USE;
          break;
        case ErrorCodes.ERROR_OPERATION_NOT_ALLOWED:
          authError = ErrorMessages.ERROR_OPERATION_NOT_ALLOWED;
          break;
        case ErrorCodes.ERROR_CODE_WEAK_PASSWORD:
          authError = ErrorMessages.ERROR_CODE_WEAK_PASSWORD;
          break;
        default:
          authError = ErrorMessages.DEFAULT;
          break;
      }
      throw Exception(authError);
    }
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
