import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocpkg/src/Screens/Home/homeEvents.dart';
import 'package:flutterblocpkg/src/Screens/Home/homeModel.dart';
import 'package:flutterblocpkg/src/Screens/Home/homeService.dart';
import 'package:flutterblocpkg/src/Screens/Home/homeStates.dart';

class HomeBloc extends Bloc<HomeEvents, HomeStates> {
  HomeService homeService = HomeService();
  @override
  get initialState => HomeStates(
        loading: false,
        homeModel: null,
      );

  @override
  Stream<HomeStates> mapEventToState(HomeEvents event) async* {
    print("ooipo");
    if (event is HomePageStarted) {
      yield HomePageStartedState(
        loading: true,
        homeModel: null,
      );

      HomeModel homeData = await homeService.getHomeDate();
      if (homeData.message) {
        yield HomePageCompletedState(
          loading: false,
          homeModel: homeData,
        );
      } else {
        yield HomePageFinishedState(
          loading: false,
          homeModel: homeData,
        );
      }
    }
  }
}
