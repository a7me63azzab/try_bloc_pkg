

class LoginStates {
  bool loading;  // login started show loader
  bool success;  // login success  or not
  String message;  // In case of errors.  [success message or error messagfe]

  LoginStates({
    this.loading,
    this.success,
    this.message, // user loggedin successfully or failed
  });
}
