import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BetViewModel with ChangeNotifier {
  String betId = "0000";
  int totalBalance=0;
  int selectedPanel=11;
  int walletAmount = 5000;
  int betAmountBoll1EvenOdd = 0;
  int betAmountBoll1SmallLarge = 0;
  int betNumberBoll1EvenOdd = 0;
  int betNumberBoll1SmallLarge = 0;

  int betAmountBoll2EvenOdd = 0;
  int betAmountBoll2SmallLarge = 0;
  int betNumberBoll2EvenOdd = 0;
  int betNumberBoll2SmallLarge = 0;

  int betAmountBoll3EvenOdd = 0;
  int betAmountBoll3SmallLarge = 0;
  int betNumberBoll3EvenOdd = 0;
  int betNumberBoll3SmallLarge = 0;

  int betAmountBoll4EvenOdd = 0;
  int betAmountBoll4SmallLarge = 0;
  int betNumberBoll4EvenOdd = 0;
  int betNumberBoll4SmallLarge = 0;

  int betAmountBoll5EvenOdd = 0;
  int betAmountBoll5SmallLarge = 0;
  int betNumberBoll5EvenOdd = 0;
  int betNumberBoll5SmallLarge = 0;
  bool winResult=false;
  String get getBetId => betId;
  bool get getWinResult => winResult;

  int get getTotalBalance => totalBalance;

  List<String> winValues=['110','110','110','110','111'];
  void setWinResult(bool value) {
    winResult=value;
    notifyListeners();
  }

  void setWinValues(int index,String value,bool val) {
    setWinResult(val);
    winValues[index]=value;
    notifyListeners();
  }
  List<String> get getWinValues=>winValues;

  int setIncrementTotalAmount(int additional) {
    totalBalance = totalBalance+additional;
    notifyListeners();
    return totalBalance;
  }
  int setDecrementTotalAmount(int subtraction) {
    totalBalance = totalBalance - subtraction;
    notifyListeners();
    return totalBalance;
  }
  set setTotalAmount(amount) {
    totalBalance = amount;
    notifyListeners();
  }
  resetTotalAmount() {
    totalBalance = 0;
    notifyListeners();
  }

  setBetId(id) {
    betId = id;
    notifyListeners();
  }
  set setSelectedPanel(id) {
    selectedPanel = id;
    notifyListeners();
  }
 int get getSelectedPanel=>selectedPanel;
  int get getTotalBetAmount {
    return betAmountBoll1EvenOdd +
        betAmountBoll2EvenOdd +
        betAmountBoll3EvenOdd +
        betAmountBoll4EvenOdd +
        betAmountBoll5EvenOdd +
        betAmountBoll1SmallLarge +
        betAmountBoll2SmallLarge +
        betAmountBoll3SmallLarge +
        betAmountBoll4SmallLarge +
        betAmountBoll5SmallLarge;
  }

  resetAllValues() {
    selectedPanel=11;
    betAmountBoll1EvenOdd = 0;
    betAmountBoll1SmallLarge = 0;
    betNumberBoll1EvenOdd = 0;
    betNumberBoll1SmallLarge = 0;
    betAmountBoll2EvenOdd = 0;
    betAmountBoll2SmallLarge = 0;
    betNumberBoll2EvenOdd = 0;
    betNumberBoll2SmallLarge = 0;
    betAmountBoll3EvenOdd = 0;
    betAmountBoll3SmallLarge = 0;
    betNumberBoll3EvenOdd = 0;
    betNumberBoll3SmallLarge = 0;

    betAmountBoll4EvenOdd = 0;
    betAmountBoll4SmallLarge = 0;
    betNumberBoll4EvenOdd = 0;
    betNumberBoll4SmallLarge = 0;

    betAmountBoll5EvenOdd = 0;
    betAmountBoll5SmallLarge = 0;
    betNumberBoll5EvenOdd = 0;
    betNumberBoll5SmallLarge = 0;
    notifyListeners();
  }

  set setWalletAmount(amount) {
    walletAmount = amount;
    notifyListeners();
  }

  int get getWalletAmount => walletAmount;

  int get getAmountBoll1EvenOdd => betAmountBoll1EvenOdd;

  int get getAmountBoll2EvenOdd => betAmountBoll2EvenOdd;

  int get getAmountBoll3EvenOdd => betAmountBoll3EvenOdd;

  int get getAmountBoll4EvenOdd => betAmountBoll4EvenOdd;

  int get getAmountBoll5EvenOdd => betAmountBoll5EvenOdd;

  set setAmountBoll1EvenOdd(data) {
    betAmountBoll1EvenOdd = data;
    totalBalance=data;
    notifyListeners();
  }

  set setAmountBoll2EvenOdd(data) {
    betAmountBoll2EvenOdd = data;
    totalBalance=data;
    notifyListeners();
  }

  set setAmountBoll3EvenOdd(data) {
    betAmountBoll3EvenOdd = data;
    totalBalance=data;
    notifyListeners();
  }

  set setAmountBoll4EvenOdd(data) {
    betAmountBoll4EvenOdd = data;
    totalBalance=data;
    notifyListeners();
  }

  set setAmountBoll5EvenOdd(data) {
    betAmountBoll5EvenOdd = data;
    totalBalance=data;
    notifyListeners();
  }

  int get getNumberBoll1EvenOdd => betNumberBoll1EvenOdd;

  int get getNumberBoll2EvenOdd => betNumberBoll2EvenOdd;

  int get getNumberBoll3EvenOdd => betNumberBoll3EvenOdd;

  int get getNumberBoll4EvenOdd => betNumberBoll4EvenOdd;

  int get getNumberBoll5EvenOdd => betNumberBoll5EvenOdd;

  set setNumberBoll1EvenOdd(data) {
    betNumberBoll1EvenOdd = data;
    notifyListeners();
  }

  set setNumberBoll2EvenOdd(data) {
    betNumberBoll2EvenOdd = data;
    notifyListeners();
  }

  set setNumberBoll3EvenOdd(data) {
    betNumberBoll3EvenOdd = data;
    notifyListeners();
  }

  set setNumberBoll4EvenOdd(data) {
    betNumberBoll4EvenOdd = data;
    notifyListeners();
  }

  set setNumberBoll5EvenOdd(data) {
    betNumberBoll5EvenOdd = data;
    notifyListeners();
  }

  int get getNumberBoll1SmallLarge => betNumberBoll1SmallLarge;

  int get getNumberBoll2SmallLarge => betNumberBoll2SmallLarge;

  int get getNumberBoll3SmallLarge => betNumberBoll3SmallLarge;

  int get getNumberBoll4SmallLarge => betNumberBoll4SmallLarge;

  int get getNumberBoll5SmallLarge => betNumberBoll5SmallLarge;

  set setNumberBoll1SmallLarge(data) {
    betNumberBoll1SmallLarge = data;
    notifyListeners();
  }

  set setNumberBoll2SmallLarge(data) {
    betNumberBoll2SmallLarge = data;
    notifyListeners();
  }

  set setNumberBoll3SmallLarge(data) {
    betNumberBoll3SmallLarge = data;
    notifyListeners();
  }

  set setNumberBoll4SmallLarge(data) {
    betNumberBoll4SmallLarge = data;
    notifyListeners();
  }

  set setNumberBoll5SmallLarge(data) {
    betNumberBoll5SmallLarge = data;
    notifyListeners();
  }

  int get getAmountBoll1SmallLarge => betAmountBoll1SmallLarge;

  int get getAmountBoll2SmallLarge => betAmountBoll2SmallLarge;

  int get getAmountBoll3SmallLarge => betAmountBoll3SmallLarge;

  int get getAmountBoll4SmallLarge => betAmountBoll4SmallLarge;

  int get getAmountBoll5SmallLarge => betAmountBoll5SmallLarge;

  set setAmountBoll1SmallLarge(data) {
    betAmountBoll1SmallLarge = data;
    totalBalance=data;
    notifyListeners();
  }

  set setAmountBoll2SmallLarge(data) {
    betAmountBoll2SmallLarge = data;
    totalBalance=data;
    notifyListeners();
  }

  set setAmountBoll3SmallLarge(data) {
    betAmountBoll3SmallLarge = data;
    totalBalance=data;
    notifyListeners();
  }

  set setAmountBoll4SmallLarge(data) {
    betAmountBoll4SmallLarge = data;
    totalBalance=data;
    notifyListeners();
  }

  set setAmountBoll5SmallLarge(data) {
    betAmountBoll5SmallLarge = data;
    totalBalance=data;
    notifyListeners();
  }

  setBollOneEvenOdd(int amount) {
    betAmountBoll1EvenOdd = amount;
    notifyListeners();
  }

  setBollTwoEvenOdd(int amount) {
    betAmountBoll2EvenOdd = amount;
    notifyListeners();
  }

  setBollThreeEvenOdd(int amount) {
    betAmountBoll3EvenOdd = amount;
    notifyListeners();
  }

  setBollFourEvenOdd(int amount) {
    betAmountBoll4EvenOdd = amount;
    notifyListeners();
  }

  setBollFiveEvenOdd(int amount) {
    betAmountBoll5EvenOdd = amount;
    notifyListeners();
  }

  setBollOneSmallLarge(int amount) {
    betAmountBoll1SmallLarge = amount;
    notifyListeners();
  }

  setBollTwoSmallLarge(int amount) {
    betAmountBoll2SmallLarge = amount;
    notifyListeners();
  }

  setBollThreeSmallLarge(int amount) {
    betAmountBoll3SmallLarge = amount;
    notifyListeners();
  }

  setBollFourSmallLarge(int amount) {
    betAmountBoll4SmallLarge = amount;
    notifyListeners();
  }

  setBollFiveSmallLarge(int amount) {
    betAmountBoll5SmallLarge = amount;
    notifyListeners();
  }
}
