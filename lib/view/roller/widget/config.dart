import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ows_roller_app/view/app_config/local/components.dart';

String textOddEven = 'Odd/Even';
String textSmallLarge = 'Small/Big';
String textOddNumber = 'Select Odd Number';
String textEvenNumber = 'Select Even Number';
String textSmallNumber = 'Select Small Number';
String textLargeNumber = 'Select Large Number';
String textLuckyNumber = 'Select Lucky Number';

class GameConfig {
  static final slotIdHeight = .1; // .1
  static final commonGape = .01; // commonGape*8=.16
  static final oddEvenHeight = .1; // oddEvenHeight*5= .45
  static final smallLargeHeight = .09;
  static final betChartHeight = .18; // .18
  static final betAmountHeight = .18;
  // bottom nav bar = .1
  // Total height= .1 + .16 +.45 + .18 + .1 = .99

  static getCommonGapeHeight(BuildContext context) =>
      appHeight(context) * commonGape;
  static getSlotIdHeight(BuildContext context) =>
      appHeight(context) * slotIdHeight;
  static getOddEvenHeight(BuildContext context) =>
      appHeight(context) * oddEvenHeight;
  static getSmallLargeHeight(BuildContext context) =>
      appHeight(context) * smallLargeHeight;
  static getBetChartHeight(BuildContext context) =>
      appHeight(context) * betChartHeight;
  static getBetAmountHeight(BuildContext context) =>
      appHeight(context) * betAmountHeight;
}

class NumberConfig {
  static final fontSizeNumbers = 12.0;
  static final fontSizeHeading = 20.0;
  static final fontSizeBall = 10.0;

  static final submitTextStyle = GoogleFonts.nunito(
      fontSize: NumberConfig.fontSizeNumbers,
      letterSpacing: 5,
      color: Colors.black,
      fontWeight: FontWeight.w300);
  static final submitTextStyle2 = GoogleFonts.nunito(
      fontSize: NumberConfig.fontSizeNumbers,
      letterSpacing: 5,
      color: Colors.black,
      fontWeight: FontWeight.w300);

  static double boxWidth(BuildContext context) {
    double boxWidth = appWidth(context) * .08;
    return boxWidth;
  }
}

class StackPosition {
  static backButtonTopPosition(BuildContext context) {
    return 20.0;
  }

  static backButtonLeftPosition(BuildContext context) {
    return 20.0;
  }

  static walletTopPosition(BuildContext context) {
    return appHeight(context) * .05;
  }

  static walletLeftPosition(BuildContext context) {
    return appWidth(context) * .605;
  }

  static rollerTopPosition(BuildContext context) {
    return GameConfig.getCommonGapeHeight(context);
  }

  static rollerLeftPosition(BuildContext context) {
    return appWidth(context) * .3;
  }

  static settingTopPosition(BuildContext context) {
    return 20.0;
  }

  static settingLeftPosition(BuildContext context) {
    return appWidth(context) * .92;
  }

  static betChartTopPosition(BuildContext context) {
    return appHeight(context) * .71;
  }

  static betChartLeftPosition(BuildContext context) {
    return appWidth(context) * .12;
  }

  static betPanelTopPosition(BuildContext context) {
    return appHeight(context) * .71;
  }

  static betPanelLeftPosition(BuildContext context) {
    return appWidth(context) * .55;
  }

  static betButtonTopPosition(BuildContext context) {
    return appHeight(context) * .75;
  }

  static betButtonLeftPosition(BuildContext context) {
    return appWidth(context) * .77;
  }

  static gameIdTopPosition(BuildContext context) {
    return GameConfig.getCommonGapeHeight(context);
  }

  static gameIdLeftPosition(BuildContext context) {
    return appWidth(context) * .05;
  }
}

class WheelConfig {
  final selectTextStyle = TextStyle(color: Colors.black, fontSize: 12);
  final unSelectTextStyle = TextStyle(color: Colors.black45);
  final rollerColor = Colors.yellow;
  final minValue = 0;
  final maxValue = 9;
  final itemSize = 18.0;
  final isInfinite = true;
  final listHeight = 55.0;
  final listWidth = 35.0;
  final lItemSize = 20.0;
  final squeeze = .75;
  final horizontal = false;
  final magnification = 2.0;
  final sizeBoxWidth = 1.0;
}
