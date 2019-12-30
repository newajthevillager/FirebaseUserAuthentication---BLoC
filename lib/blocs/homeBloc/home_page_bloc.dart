import 'package:FirebaseUserSignIn/blocs/homeBloc/home_page_event.dart';
import 'package:FirebaseUserSignIn/blocs/homeBloc/home_page_state.dart';
import 'package:FirebaseUserSignIn/repositories/user_repository.dart';
import 'package:bloc/bloc.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {

  UserRepository userRepository;

  HomePageBloc() {userRepository = UserRepository();}

  @override
  // TODO: implement initialState
  HomePageState get initialState => LogOutInitial();

  @override
  Stream<HomePageState> mapEventToState(HomePageEvent event) async* {
    if (event is LogOutEvent) {
      print("LOG out Bloc");
      userRepository.signOut();
      yield LogOutSuccessState();
    }
  }
}