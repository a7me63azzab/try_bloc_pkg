import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocpkg/src/Screens/Auth/LoginScreen/loginView.dart';

import 'Screens/Auth/LoginScreen/loginBloc.dart';

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(child: LoginScreen(), create: (BuildContext context) => LoginBloc(),),
    );
  }
}