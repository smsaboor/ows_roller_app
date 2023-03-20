import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ows_roller_app/model/audio_player/custom_audio.dart';

class SettingViewModel with ChangeNotifier {
  bool flagMobileSoundOn = true;
  bool flagMobileVibrationOn = true;
  bool flagIsMusicOn = true;
  bool flagIsRollerMoving = true;
  Timer? timer;

  int pageIndex=1;
  int faqButtonIndex = 1;
  int faqBodyIndex = 1;
  int accountButtonIndex = 1;
  int selectedTabsIndex=1;

  int get getPageIndex=>pageIndex;
  int get getTabIndex=>selectedTabsIndex;
  bool get getFlagIsRollerMoving=>flagIsRollerMoving;
  bool get getFlagMobileVibrationOn=>flagMobileVibrationOn;
  bool get getFlagMobileSoundOn=>flagMobileSoundOn;
  bool get getFlagIsMusicOn=>flagIsMusicOn;

  set setPageIndex(int value){
    pageIndex=value;
  }
  setTabIndex(int value){
    selectedTabsIndex=value;
    notifyListeners();
  }
  set setAccountIndex(int value){
    accountButtonIndex=value;
    notifyListeners();
  }
  set setFlagRollerMoving(bool value){
    flagIsRollerMoving=value;
    notifyListeners();
  }


  bool? get getSoundOnOff {
    return flagMobileSoundOn;
  }

  set setSoundOnOff(value) {
    flagMobileSoundOn = value;
    notifyListeners();
  }

  set setMobileVibrationOnOff(value) {
    flagMobileVibrationOn = value;
    notifyListeners();
  }

  startPlayer(context) async {
   if(getFlagIsRollerMoving){
     CustomAudio.startPlayerOne(context);
   }else{
   }
  }
  stopPlayer(context) async {
    if(getFlagIsRollerMoving){
      CustomAudio.stopAssetRoller(context);
    }else{
    }
  }
  starVibration() {
    if (flagIsRollerMoving) {
      // timer = Timer.periodic(Duration(milliseconds: 250),
      //     (Timer t) => Vibration.vibrate(duration: 100));
    } else {
      timer!.cancel();
    }
  }

  stopVibration() {
    timer?.cancel();
  }


  setFaqButtonIndex(int data) {
    faqButtonIndex = data;
    notifyListeners();
  }

  setFaqBodyIndex(int data) {
    faqBodyIndex = data;
    notifyListeners();
  }

  int get getFaqButtonIndex {
    return faqButtonIndex;
  }

  int get getFaqBodyIndex {
    return faqBodyIndex;
  }
}
