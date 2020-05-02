import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocpkg/src/Bloc/LoginBloc/LoginEvents.dart';
import 'package:flutterblocpkg/src/Bloc/LoginBloc/LoginStates.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  @override
  get initialState => LoginStates(
        loading: false,
        success: null,
        message: "",
      );

  @override
  Stream<LoginStates> mapEventToState(LoginEvents event) async* {
    if (event is LoginStarted) {
      yield LoginStates(
        loading: true,
        success: null,
        message: "",
      );
    } else if (event is LoginFailed) {
      yield LoginStates(
        loading: false,
        success: false,
        message: "Login Failed",
      );
    } else {
      yield LoginStates(
        loading: false,
        success: true,
        message: "Login Successfully",
      );
    }
  }
}
