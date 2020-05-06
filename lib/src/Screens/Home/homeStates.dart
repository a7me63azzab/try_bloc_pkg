import 'package:flutterblocpkg/src/Screens/Home/homeModel.dart';

class HomeStates {
  bool loading;
  HomeModel homeModel;
  HomeStates({this.loading, this.homeModel});
}

class HomePageStartedState extends HomeStates {
  bool loading;
  HomeModel homeModel;
  HomePageStartedState({this.loading, this.homeModel});
}

class HomePageCompletedState extends HomeStates {
  bool loading;
  HomeModel homeModel;
  HomePageCompletedState({this.loading, this.homeModel});
}

class HomePageFinishedState extends HomeStates {
  bool loading;
  HomeModel homeModel;
  HomePageFinishedState({this.loading, this.homeModel});
}
