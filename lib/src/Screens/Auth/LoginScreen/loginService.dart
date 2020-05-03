import 'package:dio/dio.dart';
import 'package:flutterblocpkg/src/Screens/Auth/LoginScreen/loginModel.dart';

class LoginService{
  Dio dio = Dio();


Future<LoginModel> loginService(String phone, String password) async {
  try {
    FormData formData = FormData.fromMap({
      "phone": phone,
      "password": password,
      "device_token": "32423",
    });
    Response response = await dio.post("http://five-starsupplies.com/api/login",
        data: formData);
    print("-=-=-=-=>>> ${response.data.toString()}");
    if (response.data['message']) {
      print("I am here");
      // return true;

      return LoginModel(
        status: true,
        message: "تم التسجيل بنجاح",
      );
    } else {
      

      return LoginModel(
        status: false,
        message: "${response.data['data']}",
      );
    }
  } on DioError catch (e) {
    // on status code => 4xx ... etc
    print(e.response.data);
    print(e);

    return LoginModel(
      status: false,
      message: "يوجد مشكله فى السيرفر برجاء المحاوله مره اخرى",
    );
    
  }
}
}