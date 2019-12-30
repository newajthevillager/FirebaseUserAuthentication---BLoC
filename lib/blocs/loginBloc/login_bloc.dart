import 'package:FirebaseUserSignIn/blocs/loginBloc/login_event.dart';
import 'package:FirebaseUserSignIn/blocs/loginBloc/login_state.dart';
import 'package:FirebaseUserSignIn/repositories/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository userRepository;

  LoginBloc() {
    userRepository = UserRepository();
  }

  @override
  // TODO: implement initialState
  LoginState get initialState => LoginInitialState();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoadingState();
      try {
        var user = await userRepository.signInEmailAndPassword(
            event.email, event.password);
        yield LoginSuccessState(user);
      } catch (e) {
        yield LoginFailState(e.toString());
      }
    }
  }
}
