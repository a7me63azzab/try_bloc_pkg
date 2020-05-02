abstract class LoginEvents {}

class LoginStarted extends LoginEvents {
  String userName;
  String password;

  LoginStarted({this.userName, this.password});
}

class LoginSucess extends LoginEvents{}

class LoginFailed extends LoginEvents{}
