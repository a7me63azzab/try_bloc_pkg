import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocpkg/src/Screens/Auth/LoginScreen/loginBloc.dart';
import 'package:flutterblocpkg/src/Screens/Auth/LoginScreen/loginEvents.dart';
import 'package:flutterblocpkg/src/Screens/Auth/LoginScreen/loginStates.dart';
import 'package:flutterblocpkg/src/Screens/Home/homeBloc.dart';
import 'package:flutterblocpkg/src/Screens/Home/homeView.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController _userName = TextEditingController();
    TextEditingController _password = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Login Page"),
      ),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginStateFailed) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('${state.message}'),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state is LoginStateCompleted) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('${state.message}'),
                backgroundColor: Colors.greenAccent,
              ),
            );
            Navigator.of(context)
                .push(PageRouteBuilder(pageBuilder: (_, __, ___) {
              return BlocProvider(
                child: HomeView(),
                create: (BuildContext context) => HomeBloc(),
              );
            }));
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
          return Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _userName,
                    decoration: InputDecoration(
                        hintText: "user name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9),
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    obscureText: true,
                    controller: _password,
                    decoration: InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9),
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  state is LoginStateStarted
                      ? CupertinoActivityIndicator(
                          animating: true,
                          radius: 15,
                        )
                      : CupertinoButton.filled(
                          child: Text("Login"),
                          onPressed: () {
                            BlocProvider.of<LoginBloc>(context)
                                .add(LoginStarted(
                              userName: _userName.text,
                              password: _password.text,
                            ));
                          },
                        ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
