import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ows_roller_app/view_model/bet_view_model.dart';
import 'package:ows_roller_app/view_model/setting_view_model.dart';
import 'package:provider/provider.dart';

class RollerViewModel with ChangeNotifier {
  RollerViewModel();
  bool flagPopPlayer = true;
  bool flagIsRollerMoving = true;
  bool loading = true;
  bool flagResult = false;
  bool flagMobileVibrationOn = true;
  bool flagAudioOn = true;
  int valueJumpForC1 = 0;
  int valueJumpForC2 = 0;
  int valueJumpForC3 = 0;
  int valueJumpForC4 = 0;
  int valueJumpForC5 = 0;
  int minuteGame3Minute = 180000;
  int minuteGame6Minute = 360000;
  int minuteGame9Minute = 540000;
  int minuteGame1Hour = 3600000;

  int jumpForC1=0;
  int jumpForC2=0;
  int jumpForC3=0;
  int jumpForC4=0;
  int jumpForC5=0;
  setWinNumbers(context,v1,v2,v3,v4,v5,millisecond){
    print('setWinNumbers2: $v1,$v2,$v3,$v4,$v5, $millisecond');
    jumpForC1=v1;
    jumpForC2=v2;
    jumpForC3=v3;
    jumpForC4=v4;
    jumpForC5=v5;
    print('setWinNumbers3: $jumpForC1,$jumpForC2,$jumpForC3,$jumpForC4,$jumpForC5');
    Future.delayed(Duration(seconds: 1)).then((value) {
      // provider!.startAllRollers(Provider.of<RollerViewModel>(context,listen: false).jumpForC1,context,widget.minute);
      // CustomAudio.playAssetRoller(context);
      startAllRollers(context,v1,v2,v3,v4,v5,millisecond);
    });
    notifyListeners();
  }

  bool get getLoading => loading;

  FixedExtentScrollController get controllerWC1 => _controllerWC1;
  FixedExtentScrollController get controllerWC2 => _controllerWC2;
  FixedExtentScrollController get controllerWC3 => _controllerWC3;
  FixedExtentScrollController get controllerWC4 => _controllerWC4;
  FixedExtentScrollController get controllerWC5 => _controllerWC5;



  setLoading(bool flag) {
    loading = flag;
  }


  FixedExtentScrollController _controllerWC1 =
      FixedExtentScrollController(initialItem: 0);
  FixedExtentScrollController _controllerWC2 =
      FixedExtentScrollController(initialItem: 0);
  FixedExtentScrollController _controllerWC3 =
      FixedExtentScrollController(initialItem: 0);
  FixedExtentScrollController _controllerWC4 =
      FixedExtentScrollController(initialItem: 0);
  FixedExtentScrollController _controllerWC5 =
      FixedExtentScrollController(initialItem: 0);


  startAllRollers(context,j1,j2,j3,j4,j5,int scrollMilliSecond) async {
    print('setWinNumbers333: $j1,$j2,$j3,$j3,$j4');
    Provider.of<SettingViewModel>(context, listen: false)
        .setFlagRollerMoving=true;
    Provider.of<SettingViewModel>(context,listen: false).starVibration();
    startRoller(context,0,j1, scrollMilliSecond, 4005, _controllerWC1, true,false);
    startRoller(context,1,j2, scrollMilliSecond, 3005, _controllerWC2, true,false);
    startRoller(context,2,j3, scrollMilliSecond, 2005, _controllerWC3, true,false);
    startRoller(context,3,j4, scrollMilliSecond, 1005, _controllerWC4, true,false);
    startRoller(context,4,j5, scrollMilliSecond, 105, _controllerWC5, false,true);
  }

  startRoller(context,index,int jumpValue, int scrollMilliSecond, int delayed,
      FixedExtentScrollController controller, bool flagPlay,bool result) async {
    flagResult = false;
    int flag = 0;
    controller?.jumpToItem(0);
    Future.delayed(Duration(milliseconds: scrollMilliSecond - delayed + 1), () {
      controller?.jumpToItem(jumpValue);
      Provider.of<BetViewModel>(context,listen: false).setWinValues(index, jumpValue.toString(),result);
      // CustomAudio.stopAssetRoller(context);
      // if (flagPopPlayer) CustomAudio.playAssetOpenDialog(context);
      // // Vibration.vibrate(duration: 150);
      flagResult = true;
      if (flagPlay == false) {
        Provider.of<SettingViewModel>(context, listen: false)
            .setFlagRollerMoving = false;
      }
    });
    controller!.animateToItem(scrollMilliSecond,
        duration: Duration(milliseconds: scrollMilliSecond - delayed),
        curve: const SawTooth(2));
  }
}
