class LoginState {
  bool loading; // login started show loader
  bool success; // login success  or not
  String message; // In case of errors.  [success message or error messagfe]

  LoginState({
    this.loading,
    this.success,
    this.message, // user loggedin successfully or failed
  });
}

class LoginStateStarted extends LoginState {
  bool loading; // login started show loader
  bool success; // login success  or not
  String message; // In case of errors.  [success message or error messagfe]

  LoginStateStarted({
    this.loading,
    this.success,
    this.message, // user loggedin successfully or failed
  });
}

class LoginStateCompleted extends LoginState {
  bool loading; // login started show loader
  bool success; // login success  or not
  String message; // In case of errors.  [success message or error messagfe]

  LoginStateCompleted({
    this.loading,
    this.success,
    this.message, // user loggedin successfully or failed
  });
}

class LoginStateFailed extends LoginState {
  bool loading; // login started show loader
  bool success; // login success  or not
  String message; // In case of errors.  [success message or error messagfe]

  LoginStateFailed({
    this.loading,
    this.success,
    this.message, // user loggedin successfully or failed
  });
}
