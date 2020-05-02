import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocpkg/src/Bloc/LoginBloc/LoginBloc.dart';
import 'package:flutterblocpkg/src/Bloc/LoginBloc/LoginEvents.dart';
import 'package:flutterblocpkg/src/Bloc/LoginBloc/LoginStates.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Login Page"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  // setState(() {
                  //   loginData.phone = value;
                  // });
                },
                validator: (value) {
                  return null;
                },
                decoration: InputDecoration(
                    hintText: "phone",
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
              TextFormField(
                obscureText: true,
                onSaved: (value) {
                  // setState(() {
                  //   loginData.password = value;
                  // });
                },
                validator: (value) {
                  return null;
                },
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
              BlocBuilder<LoginBloc, LoginStates>(builder: (context, state) {
                return state.loading == true
                    ? CupertinoActivityIndicator(
                        animating: true,
                        radius: 13,
                      )
                    : CupertinoButton.filled(
                        child: Text("Login"),
                        onPressed: () {
                          BlocProvider.of<LoginBloc>(context)
                              .add(LoginStarted());
                        },
                      );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
