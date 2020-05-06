import 'package:dio/dio.dart';
import 'package:flutterblocpkg/src/Screens/Home/homeModel.dart';

class HomeService {
  Dio dio = Dio();

  Future<HomeModel> getHomeDate() async {
    try {
      Response response =
          await dio.post("http://five-starsupplies.com/api/home", data: {
        "lang": "ar",
        "user_id": 5,
      });
      print("from service => ${response.data.toString()}");
      if (response.data['message']) {
        return HomeModel.fromJson(response.data);
      } else {
        return HomeModel(
          message: false,
          err: "لايوجد منتجات",
        );
      }
    } on DioError catch (err) {
      print(err);
      return HomeModel(
        message: false,
        err: "يوجد مشكله فى السيرفر برجاء المحاوله مره اخرى",
      );
    }
  }
}
