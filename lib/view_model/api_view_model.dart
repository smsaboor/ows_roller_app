import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ows_roller_app/model/apis/api_response.dart';
import 'package:ows_roller_app/model/model/model_game.dart';
import 'package:ows_roller_app/model/model/model_bet_response.dart';
import 'package:ows_roller_app/model/repository.dart';
import 'package:ows_roller_app/view_model/bet_view_model.dart';
import 'package:ows_roller_app/view_model/roller_view_model.dart';
import 'package:ows_roller_app/view_model/timer_view_model.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';

class ApiViewModel with ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial('Empty data');
  dynamic _data;
  dynamic _dataBet;
  ApiResponse _apiResponseBet = ApiResponse.initial('Empty data');
  ApiResponse get apiResponse {
    return _apiResponse;
  }
  ApiResponse get apiResponseBet {
    return _apiResponseBet;
  }

  dynamic get data {
    return _data;
  }

  Future<void> _deleteCacheDir() async {
    final cacheDir = await getTemporaryDirectory();
    if (cacheDir.existsSync()) {
      cacheDir.deleteSync(recursive: true);
    }
    final appDir = await getApplicationSupportDirectory();
    if (appDir.existsSync()) {
      appDir.deleteSync(recursive: true);
    }
  }

  Future<void> fetchData(context, object, String value, var body) async {
    await _deleteCacheDir();
    _apiResponse = ApiResponse.loading('Fetching $value data');
    try {
      notifyListeners();
      List<dynamic> dataList = await Repository().fetchDataList(object, value, body);
      _apiResponse = ApiResponse.dataLoaded(dataList);
      // CustomAudio.playAssetWithName(context, "audio/sword.mp3");
      _data = _apiResponse.data;
      print('api error:: 1');
      ModelGame data = _apiResponse.data[0] as ModelGame;
      print('api error:: 2');
      int minuteToSecond = data.timeInterval!['i']! * 60;
      int second = minuteToSecond + data.timeInterval!['s']!;
      print('api error::3');
      Provider.of<RollerViewModel>(context, listen: false).setWinNumbers(
          context,
          int.parse(data.result![0]),
          int.parse(data.result![1]),
          int.parse(data.result![2]),
          int.parse(data.result![3]),
          int.parse(data.result![4]),
          second * 1000);
      print('api error:: 4');
      Provider.of<BetViewModel>(context, listen: false).setBetId(data.slotId);
      Provider.of<BetViewModel>(context, listen: false).resetAllValues();
      Provider.of<TimerViewModel>(context, listen: false).startWatch(second);
      print('api error:: 5');
      _apiResponse = ApiResponse.completed(dataList);
      print('api error:: 6');
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      print('api error:: 7 $e');
    }
    notifyListeners();
  }
  Future<dynamic> fetchDataBet(context, object, String value, var body) async {
    await _deleteCacheDir();
    _apiResponseBet = ApiResponse.loading('Fetching $value data');
    try {
      notifyListeners();
      List<dynamic> dataList = await Repository().fetchDataList(object, value, body);
      _apiResponseBet = ApiResponse.dataLoaded(dataList);
      // CustomAudio.playAssetWithName(context, "audio/sword.mp3");
      _dataBet = _apiResponseBet.data;
      print('api error:: 1 :: ${_apiResponseBet.data}');
      print('api error:: 2 :: ${_apiResponseBet.data[0]}');
      ModelBetResponse data = _apiResponseBet.data[0] as ModelBetResponse;
      print('api error:: 5');
      _apiResponseBet = ApiResponse.completed(dataList);
      return data;
      print('api error:: 6');
    } catch (e) {
      _apiResponseBet = ApiResponse.error(e.toString());
      print('api error:: 7 $e');
    }
    notifyListeners();
  }

  void setData(dynamic data) {
    _data = data;
    notifyListeners();
  }
}
