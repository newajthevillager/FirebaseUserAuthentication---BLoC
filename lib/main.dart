import 'package:FirebaseUserSignIn/blocs/authBloc/auth_bloc.dart';
import 'package:FirebaseUserSignIn/blocs/authBloc/auth_state.dart';
import 'package:FirebaseUserSignIn/repositories/user_repository.dart';
import 'package:FirebaseUserSignIn/ui/pages/home_page.dart';
import 'package:FirebaseUserSignIn/ui/pages/login_page.dart';
import 'package:FirebaseUserSignIn/ui/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/authBloc/auth_event.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final UserRepository userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => AuthBloc()..add(AppStartedEvent()),
        child: Appp(),
      ),
    );
  }
}

class Appp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthInitialState) {
          return SplashPage();
        } else if (state is AuthenticatedState) {
          return HomePageParent(user: state.user,);
        } else if (state is UnauthenticatedState) {
          return LoginPageParent();
        }
      },
    );
  }
}


