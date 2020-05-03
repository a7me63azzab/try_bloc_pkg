import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocpkg/src/Screens/Auth/LoginScreen/loginEvents.dart';
import 'package:flutterblocpkg/src/Screens/Auth/LoginScreen/loginModel.dart';
import 'package:flutterblocpkg/src/Screens/Auth/LoginScreen/loginService.dart';
import 'package:flutterblocpkg/src/Screens/Auth/LoginScreen/loginStates.dart';

class LoginBloc extends Bloc<LoginEvents, LoginState> {
  LoginService loginService = LoginService();
  @override
  get initialState => LoginState(
        loading: false,
        success: null,
        message: "",
      );

  @override
  Stream<LoginState> mapEventToState(LoginEvents event) async* {
    if (event is LoginStarted) {
      yield LoginStateStarted(
        loading: true,
        success: null,
        message: "Login Started",
      );

      print(event.userName);
      print(event.password);

      LoginModel result = await loginService.loginService(event.userName, event.password);
      if (result.status) {
        yield LoginStateCompleted(
          loading: false,
          success: true,
          message: result.message ?? "",
        );
      } else {
        yield LoginStateFailed(
          loading: false,
          success: false,
          message: result.message ?? "",
        );
      }
     
    }

   
  }
}