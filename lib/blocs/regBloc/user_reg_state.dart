import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRegState extends Equatable {}

class UserRegInitial extends UserRegState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class UserRegLoading extends UserRegState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class UserRegSuccessful extends UserRegState {

  FirebaseUser user;

  UserRegSuccessful(this.user);

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class UserRegFailure extends UserRegState {

  String message;

  UserRegFailure(this.message);

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}