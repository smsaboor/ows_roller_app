import 'dart:convert';
import 'dart:io';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';
import 'package:ows_roller_app/model/apis/app_exception.dart';
import 'package:ows_roller_app/model/services/base_service.dart';

class ApiService extends BaseService {
  Dio dioService = Dio();
  var formData;

  @override
  Future post(String url, var body) async {
    print('post:: $url ::: body:: $body');
    dynamic responseJson;
    Response response;
    // Dio.FormData formData = Dio.FormData.fromMap({
    //   "user_id": widget.userMobile,
    //   "image": await Dio.MultipartFile.fromFile(image.path,
    //       filename: image.path.split('/').last)
    // });
    try {
      if (body!=null) {
        formData = FormData.fromMap(body);
        response = await Dio()
            .post(baseUrl+url, data: formData)
            .timeout(const Duration(seconds: 20));
      } else {
        response = await Dio().post(baseUrl+url).timeout(const Duration(seconds: 20));
      }
      print('---getApiResponse response:($response)-${response.runtimeType}-response.data(${response.data})-------response.data.runtimeType(${response.data.runtimeType})');
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future uploadImage(String url, FormData data) async {
    Dio dio = Dio();
    try {
      print('-uploadImage--------------$data');
      Response response = await Dio().post(url, data: data);
      if (response.data['status'] == "1") {
        return response.data['image'];
      } else {
        return 'error image not loaded';
      }
    } catch (e) {
      return 'error exception';
    }
  }

  @override
  Future get(String url) async {
    try {
      var response = await Dio().get(url).timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        return response.data;
      } else {
        // AppSnack.showSnack('Login fail','Invalid pin');
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  @visibleForTesting
  dynamic returnResponse(Response response) {
    print('-------returnResponse  ------${response.statusCode}');
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = response.data;
        // AppSnack.showSnack('Login fail','Invalid pin');
        return responseJson;
      case 400:
        throw BadRequestException(response.data.toString());
      // AppSnack.showSnack('Login fail','Invalid pin');
      case 401:
      case 403:
        // AppSnack.showSnack('Login fail','Invalid pin');
        throw UnauthorisedException(response.data.toString());
      case 500:
      default:
        // AppSnack.showSnack('Login fail','Invalid pin');
        throw FetchDataException(
            'Error occurred while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
}
