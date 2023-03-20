import 'package:dio/dio.dart';
import 'package:ows_roller_app/model/dio/logging.dart';
import 'package:ows_roller_app/model/dio/user.dart';
import 'package:ows_roller_app/model/base/base_url.dart';
import 'package:ows_roller_app/model/model/model_login_response.dart';
import 'package:ows_roller_app/model/model/model_login_response2.dart';

class DioCreateUser {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: apiBaseUrl,
      connectTimeout: 5000,
      receiveTimeout: 9000,
    ),
  )..interceptors.add(Logging());

  Future<User?> getUser({required String id}) async {
    User? user;
    try {
      Response userData = await _dio.get('/users/$id');
      print('User Info: ${userData.data}');
      user = User.fromJson(userData.data);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return user;
  }

  createUser({required String? number}) async {
    LoginResponse loginResponse = LoginResponse(otp: 0000, response: 'null',id: "BB#12345", mobile: "1234567890");
    try {
      var formData = FormData.fromMap({
        'number': number
        // 'file': await MultipartFile.fromFile('./text.txt',filename: 'upload.txt')
      });
      Response response = await _dio.post('/login_api.php', data: formData);
      print('response----------:$response');
      loginResponse.otp = response.data[0]['otp'];
      loginResponse.response = response.data[0]['response'];
      return loginResponse;
    } catch (e) {
      print('Error creating user: $e');
    }
    return loginResponse;
  }

  verifyOtp({required String number, required String status}) async {
    LoginResponse loginResponse = LoginResponse(
        otp: 0000, response: 'null', id: "BB#12345", mobile: "1234567890");
    var formData = FormData.fromMap({
      'number': number,
      'status': status
      // 'file': await MultipartFile.fromFile('./text.txt',filename: 'upload.txt')
    });
    try {
      Response response = await _dio.post('/confirm_otp_api.php', data: formData);
      print('saboor:response::$response');
      loginResponse.id = response.data[0]['referral_id'];
      loginResponse.mobile = response.data[0]['phone'];
      loginResponse.response = response.data[0]['response'];
      return loginResponse;
    } catch (e) {
      print('Error creating user: $e');
      return loginResponse;
    }
  }

  verifyReferral({required String number, required String referralId}) async {
    print('number: $number -- refeeralId: $referralId');
    LoginResponse2 loginResponse = LoginResponse2(refferal: '000', response: 'null',id: "BB#12345", mobile: "1234567890");
    var formData = FormData.fromMap({
      'number': number,
      'referral_id': referralId
      // 'file': await MultipartFile.fromFile('./text.txt',filename: 'upload.txt')
    });
    try {
      Response response = await _dio.post('/refrel_verify_api.php', data: formData);
      print('refrel_verify_api: $response');
      loginResponse.refferal = referralId;
      loginResponse.mobile = number;
      loginResponse.id = response.data[0]['id'];
      loginResponse.response = response.data[0]['response'];
      loginResponse.refferal = response.data[0]['refferal'];
      loginResponse.mobile = response.data[0]['mobile'];
      return loginResponse;
    } catch (e) {
      print('Error creating user: $e');
      return loginResponse;
    }
  }

  getGameDate({required String url}) async {
    LoginResponse loginResponse = LoginResponse(otp: 0000, response: 'null',id: "BB#12345", mobile: "1234567890");
    try {
      Response response = await _dio.post(url);
      print('Error creating user: $response');

      return loginResponse;
    } catch (e) {
      print('Error creating user: $e');
      return loginResponse;
    }
  }
}

