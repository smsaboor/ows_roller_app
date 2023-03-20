import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ows_roller_app/view/theme/resources/themes/theme_view_model.dart';
import 'package:ows_roller_app/view_model/bet_view_model.dart';
import '../widget/config.dart';
import 'package:provider/provider.dart';

class PanelSmallLarge extends StatefulWidget {
  const PanelSmallLarge({Key? key, required this.boll, required this.bgColor})
      : super(key: key);
  final boll;
  final bgColor;

  @override
  State<PanelSmallLarge> createState() => _PanelSmallLargeState();
}

class _PanelSmallLargeState extends State<PanelSmallLarge> {
  int selectedIndex = 10;
  final borderColor = Colors.orange;
  final smallColor = Colors.white;
  final Color largeColor = Colors.white;
  var borderColor2 = Colors.black;
  final selectedColor = Colors.red;
  var selectedColor2;

  @override
  void initState() {
    selectedColor2 = widget.bgColor;
    super.initState();
  }

  getBorderColor(boll, selectedIndex, getSelectedPanel) {
    print('boll: $boll -- selectedIndex:$selectedIndex -- getSelectedPanel:$getSelectedPanel');
    if (boll == 1 && getSelectedPanel == 6 && selectedIndex == this.selectedIndex) {
      return borderColor2;
    } else if (boll == 1 && getSelectedPanel == 6 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 1 && getSelectedPanel == 6 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 1 && getSelectedPanel == 6 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 1 && getSelectedPanel == 6 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 1 && getSelectedPanel == 6 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 1 && getSelectedPanel == 6 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 1 && getSelectedPanel == 6 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 1 && getSelectedPanel == 6 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 1 && getSelectedPanel == 6 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 2 && getSelectedPanel == 7 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 2 && getSelectedPanel == 7 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 2 && getSelectedPanel == 7 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 2 && getSelectedPanel == 7 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 2 && getSelectedPanel == 7 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 2 && getSelectedPanel == 7 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 2 && getSelectedPanel == 7 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 2 && getSelectedPanel == 7 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 2 && getSelectedPanel == 7 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 2 && getSelectedPanel == 7 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 3 && getSelectedPanel == 8 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 3 && getSelectedPanel == 8 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 3 && getSelectedPanel == 8 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 3 && getSelectedPanel == 8 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 3 && getSelectedPanel == 8 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 3 && getSelectedPanel == 8 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 3 && getSelectedPanel == 8 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 3 && getSelectedPanel == 8 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 3 && getSelectedPanel == 8 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 3 && getSelectedPanel == 8 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 4 && getSelectedPanel == 9 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 4 && getSelectedPanel == 9 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 4 && getSelectedPanel == 9 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 4 && getSelectedPanel == 9 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 4 && getSelectedPanel == 9 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 4 && getSelectedPanel == 9 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 4 && getSelectedPanel == 9 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 4 && getSelectedPanel == 9 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 4 && getSelectedPanel == 9 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 4 && getSelectedPanel == 9 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 5 && getSelectedPanel == 10 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 5 && getSelectedPanel == 10 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 5 && getSelectedPanel == 10 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 5 && getSelectedPanel == 10 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 5 && getSelectedPanel == 10 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 5 && getSelectedPanel == 10 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 5 && getSelectedPanel == 10 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 5 && getSelectedPanel == 10 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 5 && getSelectedPanel == 10 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if (boll == 5 && getSelectedPanel == 10 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else {
      return borderColor;
    }
  }
  getBorderWidth(boll, selectedIndex, getSelectedPanel) {
    if (boll == 1 && getSelectedPanel == 6 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 1 && getSelectedPanel == 6 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 1 && getSelectedPanel == 6 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 1 && getSelectedPanel == 6 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 1 && getSelectedPanel == 6 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 1 && getSelectedPanel == 6 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 1 && getSelectedPanel == 6 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 1 && getSelectedPanel == 6 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 1 && getSelectedPanel == 6 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 1 && getSelectedPanel == 6 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 2 && getSelectedPanel == 7 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 2 && getSelectedPanel == 7 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 2 && getSelectedPanel == 7 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 2 && getSelectedPanel == 7 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 2 && getSelectedPanel == 7 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 2 && getSelectedPanel == 7 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 2 && getSelectedPanel == 7 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 2 && getSelectedPanel == 7 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 2 && getSelectedPanel == 7 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 2 && getSelectedPanel == 7 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 3 && getSelectedPanel == 8 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 3 && getSelectedPanel == 8 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 3 && getSelectedPanel == 8 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 3 && getSelectedPanel == 8 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 3 && getSelectedPanel == 8 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 3 && getSelectedPanel == 8 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 3 && getSelectedPanel == 8 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 3 && getSelectedPanel == 8 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 3 && getSelectedPanel == 8 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 3 && getSelectedPanel == 8 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 4 && getSelectedPanel == 9 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 4 && getSelectedPanel == 9 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 4 && getSelectedPanel == 9 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 4 && getSelectedPanel == 9 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 4 && getSelectedPanel == 9 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 4 && getSelectedPanel == 9 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 4 && getSelectedPanel == 9 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 4 && getSelectedPanel == 9 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 4 && getSelectedPanel == 9 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 4 && getSelectedPanel == 9 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 5 && getSelectedPanel == 10 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 5 && getSelectedPanel == 10 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 5 && getSelectedPanel == 10 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 5 && getSelectedPanel == 10 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 5 && getSelectedPanel == 10 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 5 && getSelectedPanel == 10 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 5 && getSelectedPanel == 10 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 5 && getSelectedPanel == 10 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 5 && getSelectedPanel == 10 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if (boll == 5 && getSelectedPanel == 10 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else {
      return 1.0;
    }
  }
  @override
  Widget build(BuildContext context) {
    final themeViewModel = context.watch<ThemeViewModel>();
    double boxHeight = GameConfig.getOddEvenHeight(context) * .37;
    return Consumer<BetViewModel>(builder: (context, obj, child) {
      return Column(
        children: [
          Container(
            height: GameConfig.getOddEvenHeight(context) * .26,
            width: boxHeight * 5,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.yellowAccent, width: .5),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                  topLeft: Radius.circular(5),
                ),
                color: widget.bgColor),
            child: Center(
              child: Text(
                textSmallLarge,
                style: themeViewModel.baseTextTheme.bodyMedium,
              ),
            ),
          ),
          Row(
            children: [
              AnimatedButton(
                isSelected: selectedIndex == 0 ? true : false,
                onPress: () {
                  setState(() {
                    selectedIndex = 0;
                  });

                  widget.boll == 1
                      ? obj.setSelectedPanel = 6
                      : widget.boll == 2
                          ? obj.setSelectedPanel = 7
                          : widget.boll == 3
                              ? obj.setSelectedPanel = 8
                              : widget.boll == 4
                                  ? obj.setSelectedPanel = 9
                                  : widget.boll == 5
                                      ? obj.setSelectedPanel = 10
                                      : null;
                  obj.setTotalAmount =
                  obj.getSelectedPanel==6?obj.getAmountBoll1SmallLarge:
                  obj.getSelectedPanel==7?obj.getAmountBoll2SmallLarge:
                  obj.getSelectedPanel==8?obj.getAmountBoll3SmallLarge:
                  obj.getSelectedPanel==9?obj.getAmountBoll4SmallLarge:
                  obj.getSelectedPanel==10?obj.getAmountBoll5SmallLarge:0;
                  widget.boll == 1
                      ? obj.setNumberBoll1SmallLarge = 0
                      : widget.boll == 2
                          ? obj.setNumberBoll2SmallLarge = 0
                          : widget.boll == 3
                              ? obj.setNumberBoll3SmallLarge = 0
                              : widget.boll == 4
                                  ? obj.setNumberBoll4SmallLarge = 0
                                  : widget.boll == 5
                                      ? obj.setNumberBoll5SmallLarge = 0
                                      : null;
                },
                onChanges: (change) {},
                height: boxHeight,
                width: boxHeight,
                text: '0',
                isReverse: false,
                selectedTextColor: Colors.black,
                transitionType: TransitionType.LEFT_CENTER_ROUNDER,
                textStyle: GoogleFonts.nunito(
                    fontSize: NumberConfig.fontSizeNumbers,
                    letterSpacing: 5,
                    color: Colors.black,
                    fontWeight: FontWeight.w300),
                backgroundColor: smallColor,
                selectedBackgroundColor:
                    selectedIndex == 0 ? selectedColor2 : selectedColor,
                borderColor: getBorderColor(
                    widget.boll, 0, obj.getSelectedPanel),
                borderWidth: getBorderWidth(
                    widget.boll, 0, obj.getSelectedPanel),
              ),
              AnimatedButton(
                isSelected: selectedIndex == 1 ? true : false,
                onPress: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                  widget.boll == 1
                      ? obj.setSelectedPanel = 6
                      : widget.boll == 2
                          ? obj.setSelectedPanel = 7
                          : widget.boll == 3
                              ? obj.setSelectedPanel = 8
                              : widget.boll == 4
                                  ? obj.setSelectedPanel = 9
                                  : widget.boll == 5
                                      ? obj.setSelectedPanel = 10
                                      : null;
                  obj.setTotalAmount =
                  obj.getSelectedPanel==6?obj.getAmountBoll1SmallLarge:
                  obj.getSelectedPanel==7?obj.getAmountBoll2SmallLarge:
                  obj.getSelectedPanel==8?obj.getAmountBoll3SmallLarge:
                  obj.getSelectedPanel==9?obj.getAmountBoll4SmallLarge:
                  obj.getSelectedPanel==10?obj.getAmountBoll5SmallLarge:0;
                  widget.boll == 1
                      ? obj.setNumberBoll1SmallLarge = 1
                      : widget.boll == 2
                          ? obj.setNumberBoll2SmallLarge = 1
                          : widget.boll == 3
                              ? obj.setNumberBoll3SmallLarge = 1
                              : widget.boll == 4
                                  ? obj.setNumberBoll4SmallLarge = 1
                                  : widget.boll == 5
                                      ? obj.setNumberBoll5SmallLarge = 1
                                      : null;
                },
                height: boxHeight,
                width: boxHeight,
                text: '1',
                isReverse: false,
                selectedTextColor: Colors.black,
                transitionType: TransitionType.LEFT_CENTER_ROUNDER,
                textStyle: GoogleFonts.nunito(
                    fontSize: NumberConfig.fontSizeNumbers,
                    letterSpacing: 5,
                    color: Colors.black,
                    fontWeight: FontWeight.w300),
                backgroundColor: smallColor,
                selectedBackgroundColor:
                    selectedIndex == 1 ? selectedColor2 : selectedColor,
                borderColor: getBorderColor(widget.boll, 1, obj.getSelectedPanel),
                borderWidth: getBorderWidth(
                    widget.boll, 1, obj.getSelectedPanel),
              ),
              AnimatedButton(
                isSelected: selectedIndex == 2 ? true : false,
                onPress: () {
                  setState(() {
                    selectedIndex = 2;
                  });
                  widget.boll == 1
                      ? obj.setSelectedPanel = 6
                      : widget.boll == 2
                          ? obj.setSelectedPanel = 7
                          : widget.boll == 3
                              ? obj.setSelectedPanel = 8
                              : widget.boll == 4
                                  ? obj.setSelectedPanel = 9
                                  : widget.boll == 5
                                      ? obj.setSelectedPanel = 10
                                      : null;
                  obj.setTotalAmount =
                  obj.getSelectedPanel==6?obj.getAmountBoll1SmallLarge:
                  obj.getSelectedPanel==7?obj.getAmountBoll2SmallLarge:
                  obj.getSelectedPanel==8?obj.getAmountBoll3SmallLarge:
                  obj.getSelectedPanel==9?obj.getAmountBoll4SmallLarge:
                  obj.getSelectedPanel==10?obj.getAmountBoll5SmallLarge:0;
                  widget.boll == 1
                      ? obj.setNumberBoll1SmallLarge = 2
                      : widget.boll == 2
                          ? obj.setNumberBoll2SmallLarge = 2
                          : widget.boll == 3
                              ? obj.setNumberBoll3SmallLarge = 2
                              : widget.boll == 4
                                  ? obj.setNumberBoll4SmallLarge = 2
                                  : widget.boll == 5
                                      ? obj.setNumberBoll5SmallLarge = 2
                                      : null;
                },
                height: boxHeight,
                width: boxHeight,
                text: '2',
                isReverse: false,
                selectedTextColor: Colors.black,
                transitionType: TransitionType.LEFT_CENTER_ROUNDER,
                textStyle: GoogleFonts.nunito(
                    fontSize: NumberConfig.fontSizeNumbers,
                    letterSpacing: 5,
                    color: Colors.black,
                    fontWeight: FontWeight.w300),
                backgroundColor: smallColor,
                selectedBackgroundColor:
                    selectedIndex == 2 ? selectedColor2 : selectedColor,
                borderColor: getBorderColor(widget.boll, 2, obj.getSelectedPanel),
                borderWidth: getBorderWidth(
                    widget.boll, 2, obj.getSelectedPanel),
              ),
              AnimatedButton(
                isSelected: selectedIndex == 3 ? true : false,
                onPress: () {
                  setState(() {
                    selectedIndex = 3;
                  });
                  widget.boll == 1
                      ? obj.setSelectedPanel = 6
                      : widget.boll == 2
                          ? obj.setSelectedPanel = 7
                          : widget.boll == 3
                              ? obj.setSelectedPanel = 8
                              : widget.boll == 4
                                  ? obj.setSelectedPanel = 9
                                  : widget.boll == 5
                                      ? obj.setSelectedPanel = 10
                                      : null;
                  obj.setTotalAmount =
                  obj.getSelectedPanel==6?obj.getAmountBoll1SmallLarge:
                  obj.getSelectedPanel==7?obj.getAmountBoll2SmallLarge:
                  obj.getSelectedPanel==8?obj.getAmountBoll3SmallLarge:
                  obj.getSelectedPanel==9?obj.getAmountBoll4SmallLarge:
                  obj.getSelectedPanel==10?obj.getAmountBoll5SmallLarge:0;
                  widget.boll == 1
                      ? obj.setNumberBoll1SmallLarge = 3
                      : widget.boll == 2
                          ? obj.setNumberBoll2SmallLarge = 3
                          : widget.boll == 3
                              ? obj.setNumberBoll3SmallLarge = 3
                              : widget.boll == 4
                                  ? obj.setNumberBoll4SmallLarge = 3
                                  : widget.boll == 5
                                      ? obj.setNumberBoll5SmallLarge = 3
                                      : null;
                },
                height: boxHeight,
                width: boxHeight,
                text: '3',
                isReverse: false,
                selectedTextColor: Colors.black,
                transitionType: TransitionType.LEFT_CENTER_ROUNDER,
                textStyle: GoogleFonts.nunito(
                    fontSize: NumberConfig.fontSizeNumbers,
                    letterSpacing: 5,
                    color: Colors.black,
                    fontWeight: FontWeight.w300),
                backgroundColor: smallColor,
                selectedBackgroundColor:
                    selectedIndex == 3 ? selectedColor2 : selectedColor,
                borderColor: getBorderColor(widget.boll, 3, obj.getSelectedPanel),
                borderWidth: getBorderWidth(
                    widget.boll, 3, obj.getSelectedPanel),
              ),
              AnimatedButton(
                isSelected: selectedIndex == 4 ? true : false,
                onPress: () {
                  setState(() {
                    selectedIndex = 4;
                  });
                  widget.boll == 1
                      ? obj.setSelectedPanel = 6
                      : widget.boll == 2
                          ? obj.setSelectedPanel = 7
                          : widget.boll == 3
                              ? obj.setSelectedPanel = 8
                              : widget.boll == 4
                                  ? obj.setSelectedPanel = 9
                                  : widget.boll == 5
                                      ? obj.setSelectedPanel = 10
                                      : null;
                  obj.setTotalAmount =
                  obj.getSelectedPanel==6?obj.getAmountBoll1SmallLarge:
                  obj.getSelectedPanel==7?obj.getAmountBoll2SmallLarge:
                  obj.getSelectedPanel==8?obj.getAmountBoll3SmallLarge:
                  obj.getSelectedPanel==9?obj.getAmountBoll4SmallLarge:
                  obj.getSelectedPanel==10?obj.getAmountBoll5SmallLarge:0;
                  widget.boll == 1
                      ? obj.setNumberBoll1SmallLarge = 4
                      : widget.boll == 2
                          ? obj.setNumberBoll2SmallLarge = 4
                          : widget.boll == 3
                              ? obj.setNumberBoll3SmallLarge = 4
                              : widget.boll == 4
                                  ? obj.setNumberBoll4SmallLarge = 4
                                  : widget.boll == 5
                                      ? obj.setNumberBoll5SmallLarge = 4
                                      : null;
                },
                height: boxHeight,
                width: boxHeight,
                text: '4',
                isReverse: false,
                selectedTextColor: Colors.black,
                transitionType: TransitionType.LEFT_CENTER_ROUNDER,
                textStyle: GoogleFonts.nunito(
                    fontSize: NumberConfig.fontSizeNumbers,
                    letterSpacing: 5,
                    color: Colors.black,
                    fontWeight: FontWeight.w300),
                backgroundColor: smallColor,
                selectedBackgroundColor:
                    selectedIndex == 4 ? selectedColor2 : selectedColor,
                borderColor: getBorderColor(widget.boll, 4, obj.getSelectedPanel),
                borderWidth: getBorderWidth(
                    widget.boll, 4, obj.getSelectedPanel),
              ),
            ],
          ),
          Row(
            children: [
              AnimatedButton(
                isSelected: selectedIndex == 5 ? true : false,
                onPress: () {
                  setState(() {
                    selectedIndex = 5;
                  });
                  widget.boll == 1
                      ? obj.setSelectedPanel = 6
                      : widget.boll == 2
                          ? obj.setSelectedPanel = 7
                          : widget.boll == 3
                              ? obj.setSelectedPanel = 8
                              : widget.boll == 4
                                  ? obj.setSelectedPanel = 9
                                  : widget.boll == 5
                                      ? obj.setSelectedPanel = 10
                                      : null;
                  obj.setTotalAmount =
                  obj.getSelectedPanel==6?obj.getAmountBoll1SmallLarge:
                  obj.getSelectedPanel==7?obj.getAmountBoll2SmallLarge:
                  obj.getSelectedPanel==8?obj.getAmountBoll3SmallLarge:
                  obj.getSelectedPanel==9?obj.getAmountBoll4SmallLarge:
                  obj.getSelectedPanel==10?obj.getAmountBoll5SmallLarge:0;
                  widget.boll == 1
                      ? obj.setNumberBoll1SmallLarge = 5
                      : widget.boll == 2
                          ? obj.setNumberBoll2SmallLarge = 5
                          : widget.boll == 3
                              ? obj.setNumberBoll3SmallLarge = 5
                              : widget.boll == 4
                                  ? obj.setNumberBoll4SmallLarge = 5
                                  : widget.boll == 5
                                      ? obj.setNumberBoll5SmallLarge = 5
                                      : null;
                },
                onChanges: (change) {},
                height: boxHeight,
                width: boxHeight,
                text: '5',
                isReverse: false,
                selectedTextColor: Colors.black,
                transitionType: TransitionType.LEFT_BOTTOM_ROUNDER,
                textStyle: NumberConfig.submitTextStyle,
                backgroundColor: largeColor,
                selectedBackgroundColor:
                    selectedIndex == 5 ? selectedColor2 : selectedColor,
                borderColor: getBorderColor(widget.boll, 5, obj.getSelectedPanel),
                borderWidth: getBorderWidth(
                    widget.boll, 5, obj.getSelectedPanel),
              ),
              AnimatedButton(
                isSelected: selectedIndex == 6 ? true : false,
                onPress: () {
                  setState(() {
                    selectedIndex = 6;
                  });
                  widget.boll == 1
                      ? obj.setSelectedPanel = 6
                      : widget.boll == 2
                          ? obj.setSelectedPanel = 7
                          : widget.boll == 3
                              ? obj.setSelectedPanel = 8
                              : widget.boll == 4
                                  ? obj.setSelectedPanel = 9
                                  : widget.boll == 5
                                      ? obj.setSelectedPanel = 10
                                      : null;
                  obj.setTotalAmount =
                  obj.getSelectedPanel==6?obj.getAmountBoll1SmallLarge:
                  obj.getSelectedPanel==7?obj.getAmountBoll2SmallLarge:
                  obj.getSelectedPanel==8?obj.getAmountBoll3SmallLarge:
                  obj.getSelectedPanel==9?obj.getAmountBoll4SmallLarge:
                  obj.getSelectedPanel==10?obj.getAmountBoll5SmallLarge:0;
                  widget.boll == 1
                      ? obj.setNumberBoll1SmallLarge = 6
                      : widget.boll == 2
                          ? obj.setNumberBoll2SmallLarge = 6
                          : widget.boll == 3
                              ? obj.setNumberBoll3SmallLarge = 6
                              : widget.boll == 4
                                  ? obj.setNumberBoll4SmallLarge = 6
                                  : widget.boll == 5
                                      ? obj.setNumberBoll5SmallLarge = 6
                                      : null;
                },
                height: boxHeight,
                width: boxHeight,
                text: '6',
                isReverse: false,
                selectedTextColor: Colors.black,
                transitionType: TransitionType.LEFT_BOTTOM_ROUNDER,
                textStyle: NumberConfig.submitTextStyle,
                backgroundColor: largeColor,
                selectedBackgroundColor:
                    selectedIndex == 6 ? selectedColor2 : selectedColor,
                borderColor: getBorderColor(widget.boll, 6, obj.getSelectedPanel),
                borderWidth: getBorderWidth(
                    widget.boll, 6, obj.getSelectedPanel),
              ),
              AnimatedButton(
                isSelected: selectedIndex == 7 ? true : false,
                onPress: () {
                  setState(() {
                    selectedIndex = 7;
                  });
                  widget.boll == 1
                      ? obj.setSelectedPanel = 6
                      : widget.boll == 2
                          ? obj.setSelectedPanel = 7
                          : widget.boll == 3
                              ? obj.setSelectedPanel = 8
                              : widget.boll == 4
                                  ? obj.setSelectedPanel = 9
                                  : widget.boll == 5
                                      ? obj.setSelectedPanel = 10
                                      : null;
                  obj.setTotalAmount =
                  obj.getSelectedPanel==6?obj.getAmountBoll1SmallLarge:
                  obj.getSelectedPanel==7?obj.getAmountBoll2SmallLarge:
                  obj.getSelectedPanel==8?obj.getAmountBoll3SmallLarge:
                  obj.getSelectedPanel==9?obj.getAmountBoll4SmallLarge:
                  obj.getSelectedPanel==10?obj.getAmountBoll5SmallLarge:0;
                  widget.boll == 1
                      ? obj.setNumberBoll1SmallLarge = 7
                      : widget.boll == 2
                          ? obj.setNumberBoll2SmallLarge = 7
                          : widget.boll == 3
                              ? obj.setNumberBoll3SmallLarge = 7
                              : widget.boll == 4
                                  ? obj.setNumberBoll4SmallLarge = 7
                                  : widget.boll == 5
                                      ? obj.setNumberBoll5SmallLarge = 7
                                      : null;
                },
                height: boxHeight,
                width: boxHeight,
                text: '7',
                isReverse: false,
                selectedTextColor: Colors.black,
                transitionType: TransitionType.LEFT_BOTTOM_ROUNDER,
                textStyle: NumberConfig.submitTextStyle,
                backgroundColor: largeColor,
                selectedBackgroundColor:
                    selectedIndex == 7 ? selectedColor2 : selectedColor,
                borderColor:getBorderColor(widget.boll, 7, obj.getSelectedPanel),
                borderWidth: getBorderWidth(
                    widget.boll, 7, obj.getSelectedPanel),
              ),
              AnimatedButton(
                isSelected: selectedIndex == 8 ? true : false,
                onPress: () {
                  setState(() {
                    selectedIndex = 8;
                  });
                  widget.boll == 1
                      ? obj.setSelectedPanel = 6
                      : widget.boll == 2
                          ? obj.setSelectedPanel = 7
                          : widget.boll == 3
                              ? obj.setSelectedPanel = 8
                              : widget.boll == 4
                                  ? obj.setSelectedPanel = 9
                                  : widget.boll == 5
                                      ? obj.setSelectedPanel = 10
                                      : null;
                  obj.setTotalAmount =
                  obj.getSelectedPanel==6?obj.getAmountBoll1SmallLarge:
                  obj.getSelectedPanel==7?obj.getAmountBoll2SmallLarge:
                  obj.getSelectedPanel==8?obj.getAmountBoll3SmallLarge:
                  obj.getSelectedPanel==9?obj.getAmountBoll4SmallLarge:
                  obj.getSelectedPanel==10?obj.getAmountBoll5SmallLarge:0;
                  widget.boll == 1
                      ? obj.setNumberBoll1SmallLarge = 8
                      : widget.boll == 2
                          ? obj.setNumberBoll2SmallLarge = 8
                          : widget.boll == 3
                              ? obj.setNumberBoll3SmallLarge = 8
                              : widget.boll == 4
                                  ? obj.setNumberBoll4SmallLarge = 8
                                  : widget.boll == 5
                                      ? obj.setNumberBoll5SmallLarge = 8
                                      : null;
                },
                height: boxHeight,
                width: boxHeight,
                text: '8',
                isReverse: false,
                selectedTextColor: Colors.black,
                transitionType: TransitionType.LEFT_BOTTOM_ROUNDER,
                textStyle: NumberConfig.submitTextStyle,
                backgroundColor: largeColor,
                selectedBackgroundColor:
                    selectedIndex == 8 ? selectedColor2 : selectedColor,
                borderColor: getBorderColor(widget.boll, 8, obj.getSelectedPanel),
                borderWidth: getBorderWidth(
                    widget.boll, 8, obj.getSelectedPanel),
              ),
              AnimatedButton(
                isSelected: selectedIndex == 9 ? true : false,
                onPress: () {
                  setState(() {
                    selectedIndex = 9;
                  });
                  widget.boll == 1
                      ? obj.setSelectedPanel = 6
                      : widget.boll == 2
                          ? obj.setSelectedPanel = 7
                          : widget.boll == 3
                              ? obj.setSelectedPanel = 8
                              : widget.boll == 4
                                  ? obj.setSelectedPanel = 9
                                  : widget.boll == 5
                                      ? obj.setSelectedPanel = 10
                                      : null;
                  obj.setTotalAmount =
                  obj.getSelectedPanel==6?obj.getAmountBoll1SmallLarge:
                  obj.getSelectedPanel==7?obj.getAmountBoll2SmallLarge:
                  obj.getSelectedPanel==8?obj.getAmountBoll3SmallLarge:
                  obj.getSelectedPanel==9?obj.getAmountBoll4SmallLarge:
                  obj.getSelectedPanel==10?obj.getAmountBoll5SmallLarge:0;
                  widget.boll == 1
                      ? obj.setNumberBoll1SmallLarge = 9
                      : widget.boll == 2
                          ? obj.setNumberBoll2SmallLarge = 9
                          : widget.boll == 3
                              ? obj.setNumberBoll3SmallLarge = 9
                              : widget.boll == 4
                                  ? obj.setNumberBoll4SmallLarge = 9
                                  : widget.boll == 5
                                      ? obj.setNumberBoll5SmallLarge = 9
                                      : null;
                },
                height: boxHeight,
                width: boxHeight,
                text: '9',
                isReverse: false,
                selectedTextColor: Colors.black,
                transitionType: TransitionType.LEFT_BOTTOM_ROUNDER,
                textStyle: NumberConfig.submitTextStyle,
                backgroundColor: largeColor,
                selectedBackgroundColor:
                    selectedIndex == 9 ? selectedColor2 : selectedColor,
                borderColor: getBorderColor(widget.boll, 9, obj.getSelectedPanel),
                borderWidth: getBorderWidth(
                    widget.boll, 9, obj.getSelectedPanel),
              ),
            ],
          ),
          // PanelAmountIncDec(oddEven: false,boll: widget.boll)
        ],
      );
    });
  }
}
