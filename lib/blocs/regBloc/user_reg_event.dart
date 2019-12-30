import 'package:equatable/equatable.dart';

abstract class UserRegEvent extends Equatable {}

class SignUpButtonPressed extends UserRegEvent {

  String email, password;

  SignUpButtonPressed({this.email, this.password});

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}