
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CashViewModel with ChangeNotifier {
  int addCashIndex = 1;
  int addCashAmount = 100;
  int addCashBonus = 10;

  int Card1Amount=100;
  int Card2Amount=200;
  int Card3Amount=300;
  int Card4Amount=500;
  int Card5Amount=700;
  int Card6Amount=1000;
  int Card7Amount=2000;
  int Card8Amount=5000;
  int Card9Amount=7500;
  int Card10Amount=10000;

  int Card1Bonus=10;
  int Card2Bonus=10;
  int Card3Bonus=10;
  int Card4Bonus=10;
  int Card5Bonus=10;
  int Card6Bonus=10;
  int Card7Bonus=10;
  int Card8Bonus=10;
  int Card9Bonus=10;
  int Card10Bonus=10;

  setAddCashAmountAndBonus(int amount, int bonus) {
    addCashAmount = amount;
    addCashBonus = bonus;
    notifyListeners();
  }

  int get getAddCashAmount => addCashAmount;

  int get getAddCashBonus => addCashBonus;

  setAddCashIndex(int index) {
    addCashIndex = index;
    if (index == 1) {
      addCashAmount = Card1Amount;
      addCashBonus = Card1Bonus;
    } else if (index == 2) {
      addCashAmount = Card2Amount;
      addCashBonus = Card2Bonus;
    } else if (index == 3) {
      addCashAmount = Card3Amount;
      addCashBonus = Card3Bonus;
    } else if (index == 4) {
      addCashAmount = Card4Amount;
      addCashBonus = Card4Bonus;
    } else if (index == 5) {
      addCashAmount = Card5Amount;
      addCashBonus = Card5Bonus;
    } else if (index == 6) {
      addCashAmount = Card6Amount;
      addCashBonus = Card6Bonus;
    } else if (index == 7) {
      addCashAmount = Card7Amount;
      addCashBonus = Card7Bonus;
    } else if (index == 8) {
      addCashAmount = Card8Amount;
      addCashBonus = Card8Bonus;
    } else if (index == 9) {
      addCashAmount = Card9Amount;
      addCashBonus = Card9Bonus;
    } else if (index == 10) {
      addCashAmount = Card10Amount;
      addCashBonus = Card10Bonus;
    }
    notifyListeners();
  }

  int get getAddCashIndex {
    return addCashIndex;
  }
}
