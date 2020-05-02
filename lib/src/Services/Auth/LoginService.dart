import 'package:dio/dio.dart';
import 'package:flutterblocpkg/src/Model/UserModel.dart';

const String BASEURL = "https://labib.rmal.com.sa/nazeef/api";

class LoginService {
  Dio dio = Dio();
  Future<UserModel> login(String userName, String password) async {
    try {
      FormData formData = FormData.fromMap({
        "username": userName,
        "password": password,
        "device_token": "32423",
      });
      Response response = await dio.post("$BASEURL/login", data: formData);
      print(response.data.toString());
      if (response.data['status']) {
        UserModel userModel = UserModel.fromJson(response.data);
        return userModel;
      } else {
        return UserModel(
          msg: response.data['msg'],
        );
      }
    } on DioError catch (e) {
      // on status code => 4xx ... etc
      print(e.response.data);
      print(e);
      return UserModel(
        msg: "error",
      );
    }
  }
}
