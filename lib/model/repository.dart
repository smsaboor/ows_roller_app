
import 'package:ows_roller_app/model/services/api_service.dart';
import 'package:ows_roller_app/model/services/base_service.dart';

class Repository {
  final BaseService _apiService = ApiService();
  Future<List<dynamic>> fetchDataList(object, String url,var body) async {
    print('-fetchDataList--url:($url)-----object:${object.runtimeType}--------body:$body');
    dynamic response = await _apiService.post(url,body);
    print('-fetchDataList--response----------$response');
    print('-fetchDataList--response----------end');
    final jsonData = response as List;
    List<dynamic> dataList = jsonData.map((tagJson) => object.fromJson(tagJson)).toList();
    print('-fetchDataList dataList url($url)---fetchDataList dataList runtimeType(${dataList.runtimeType})----------${dataList.length}');
    return dataList;
  }
}

































