import 'package:FirebaseUserSignIn/blocs/regBloc/user_reg_event.dart';
import 'package:FirebaseUserSignIn/blocs/regBloc/user_reg_state.dart';
import 'package:FirebaseUserSignIn/repositories/user_repository.dart';
import 'package:bloc/bloc.dart';

class UserRegBloc extends Bloc<UserRegEvent, UserRegState> {
  UserRepository userRepository;

  UserRegBloc() {
    userRepository = UserRepository();
  }

  @override
  // TODO: implement initialState
  UserRegState get initialState => UserRegInitial();

  @override
  Stream<UserRegState> mapEventToState(UserRegEvent event) async* {
    if (event is SignUpButtonPressed) {
      yield UserRegLoading();
      try {
        var user = await userRepository.signUpUserWithEmailPass(
            event.email, event.password);
        print("BLoC : ${user.email}");
        yield UserRegSuccessful(user);
      } catch (e) {
        yield UserRegFailure(e.toString());
      }
    }
  }
}
