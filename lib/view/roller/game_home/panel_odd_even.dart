import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ows_roller_app/view/theme/resources/themes/theme_view_model.dart';
import 'package:ows_roller_app/view_model/bet_view_model.dart';
import '../widget/config.dart';
import 'package:provider/provider.dart';

class PanelOddEven extends StatefulWidget {
  const PanelOddEven({Key? key, required this.boll, required this.bgColor})
      : super(key: key);
  final boll;
  final bgColor;

  @override
  State<PanelOddEven> createState() => _PanelOddEvenState();
}

class _PanelOddEvenState extends State<PanelOddEven> {
  int selectedIndex = 11;
  var borderColor = Colors.orange;
  var selectedColor = Colors.yellowAccent;
  var borderColor2 = Colors.black87;
  var selectedColor2;

  var oddTextColor = Colors.black;
  var oddColor = Colors.white;
  var evenColor = Colors.white;
  var evenTextColor = Colors.black;

  getBorderColor(boll,selectedIndex, getSelectedPanel) {
    if (boll == 1 && getSelectedPanel == 1 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if(boll == 1 && getSelectedPanel == 1 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else if(boll == 1 && getSelectedPanel == 1 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else if(boll == 1 && getSelectedPanel == 1 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else if(boll == 1 && getSelectedPanel == 1 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else if(boll == 1 && getSelectedPanel == 1 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else if(boll == 1 && getSelectedPanel == 1 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else if(boll == 1 && getSelectedPanel == 1 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else if(boll == 1 && getSelectedPanel == 1 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else if(boll == 1 && getSelectedPanel == 1 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else if (boll == 2 && getSelectedPanel == 2 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if(boll == 2 && getSelectedPanel == 2 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else if(boll == 2 && getSelectedPanel == 2 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else if(boll == 2 && getSelectedPanel == 2 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else if(boll == 2 && getSelectedPanel == 2 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else if(boll == 2 && getSelectedPanel == 2 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else if(boll == 2 && getSelectedPanel == 2 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else if(boll == 2 && getSelectedPanel == 2 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else if(boll == 2 && getSelectedPanel == 2 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else if(boll == 2 && getSelectedPanel == 2 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else if (boll == 3 && getSelectedPanel == 3 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if(boll == 3 && getSelectedPanel == 3 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else if(boll == 3 && getSelectedPanel == 3 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else if(boll == 3 && getSelectedPanel == 3 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else if(boll == 3 && getSelectedPanel == 3 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else if(boll == 3 && getSelectedPanel == 3 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else if(boll == 3 && getSelectedPanel == 3 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else if(boll == 3 && getSelectedPanel == 3 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else if(boll == 3 && getSelectedPanel == 3 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else if(boll == 3 && getSelectedPanel == 3 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else if (boll ==4 && getSelectedPanel == 4 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if(boll == 4 && getSelectedPanel == 4 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else if(boll == 4 && getSelectedPanel == 4 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else if(boll == 4 && getSelectedPanel == 4 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else if(boll == 4 && getSelectedPanel == 4 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else if(boll == 4 && getSelectedPanel == 4 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else if(boll == 4 && getSelectedPanel == 4 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else if(boll == 4 && getSelectedPanel == 4 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else if(boll == 4 && getSelectedPanel == 4 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else if(boll == 4 && getSelectedPanel == 4 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else if (boll == 5 && getSelectedPanel == 5 && selectedIndex ==  this.selectedIndex) {
      return borderColor2;
    } else if(boll == 5 && getSelectedPanel == 5 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else if(boll == 5 && getSelectedPanel == 5 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else if(boll == 5 && getSelectedPanel == 5 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else if(boll == 5 && getSelectedPanel == 5 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else if(boll == 5 && getSelectedPanel == 5 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else if(boll == 5 && getSelectedPanel == 5 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else if(boll == 5 && getSelectedPanel == 5 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else if(boll == 5 && getSelectedPanel == 5 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else if(boll == 5 && getSelectedPanel == 5 && selectedIndex ==  this.selectedIndex){
      return borderColor2;
    }else {
      return borderColor;
    }
  }

  getBorderWidth(boll,selectedIndex, getSelectedPanel) {
    if (boll == 1 && getSelectedPanel == 1 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if(boll == 1 && getSelectedPanel == 1 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else if(boll == 1 && getSelectedPanel == 1 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else if(boll == 1 && getSelectedPanel == 1 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else if(boll == 1 && getSelectedPanel == 1 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else if(boll == 1 && getSelectedPanel == 1 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else if(boll == 1 && getSelectedPanel == 1 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else if(boll == 1 && getSelectedPanel == 1 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else if(boll == 1 && getSelectedPanel == 1 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else if(boll == 1 && getSelectedPanel == 1 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else if (boll == 2 && getSelectedPanel == 2 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if(boll == 2 && getSelectedPanel == 2 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else if(boll == 2 && getSelectedPanel == 2 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else if(boll == 2 && getSelectedPanel == 2 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else if(boll == 2 && getSelectedPanel == 2 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else if(boll == 2 && getSelectedPanel == 2 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else if(boll == 2 && getSelectedPanel == 2 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else if(boll == 2 && getSelectedPanel == 2 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else if(boll == 2 && getSelectedPanel == 2 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else if(boll == 2 && getSelectedPanel == 2 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else if (boll == 3 && getSelectedPanel == 3 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if(boll == 3 && getSelectedPanel == 3 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else if(boll == 3 && getSelectedPanel == 3 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else if(boll == 3 && getSelectedPanel == 3 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else if(boll == 3 && getSelectedPanel == 3 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else if(boll == 3 && getSelectedPanel == 3 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else if(boll == 3 && getSelectedPanel == 3 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else if(boll == 3 && getSelectedPanel == 3 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else if(boll == 3 && getSelectedPanel == 3 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else if(boll == 3 && getSelectedPanel == 3 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else if (boll ==4 && getSelectedPanel == 4 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if(boll == 4 && getSelectedPanel == 4 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else if(boll == 4 && getSelectedPanel == 4 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else if(boll == 4 && getSelectedPanel == 4 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else if(boll == 4 && getSelectedPanel == 4 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else if(boll == 4 && getSelectedPanel == 4 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else if(boll == 4 && getSelectedPanel == 4 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else if(boll == 4 && getSelectedPanel == 4 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else if(boll == 4 && getSelectedPanel == 4 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else if(boll == 4 && getSelectedPanel == 4 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else if (boll == 5 && getSelectedPanel == 5 && selectedIndex ==  this.selectedIndex) {
      return 2.0;
    } else if(boll == 5 && getSelectedPanel == 5 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else if(boll == 5 && getSelectedPanel == 5 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else if(boll == 5 && getSelectedPanel == 5 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else if(boll == 5 && getSelectedPanel == 5 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else if(boll == 5 && getSelectedPanel == 5 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else if(boll == 5 && getSelectedPanel == 5 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else if(boll == 5 && getSelectedPanel == 5 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else if(boll == 5 && getSelectedPanel == 5 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else if(boll == 5 && getSelectedPanel == 5 && selectedIndex ==  this.selectedIndex){
      return 2.0;
    }else {
      return 1.0;
    }
  }

  @override
  void initState() {
    selectedColor2 = widget.bgColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double boxHeight = GameConfig.getOddEvenHeight(context) * .37;
    final themeViewModel = context.watch<ThemeViewModel>();
    return Consumer<BetViewModel>(builder: (context, obj, child) {
      return Column(
        children: [
          Container(
            height: GameConfig.getOddEvenHeight(context) * .26,
            width: boxHeight * 5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                  topLeft: Radius.circular(5),
                ),
                border: Border.all(color: Colors.yellowAccent, width: .5),
                color: widget.bgColor),
            child: Center(
              child: Text(
                textOddEven,
                style: themeViewModel.baseTextTheme.bodyMedium,
              ),
            ),
          ),
          Row(
            children: [
              AnimatedButton(
                isSelected:
                    widget.boll == 1 && selectedIndex == 0 ? true : false,
                onPress: () {
                  setState(() {
                    selectedIndex = 0;
                  });

                  widget.boll == 1
                      ? obj.setSelectedPanel = 1
                      : widget.boll == 2
                          ? obj.setSelectedPanel = 2
                          : widget.boll == 3
                              ? obj.setSelectedPanel = 3
                              : widget.boll == 4
                                  ? obj.setSelectedPanel = 4
                                  : widget.boll == 5
                                      ? obj.setSelectedPanel = 5
                                      : null;
                  obj.setTotalAmount =
                  obj.getSelectedPanel==1?obj.getAmountBoll1EvenOdd:
                  obj.getSelectedPanel==2?obj.getAmountBoll2EvenOdd:
                  obj.getSelectedPanel==3?obj.getAmountBoll3EvenOdd:
                  obj.getSelectedPanel==4?obj.getAmountBoll4EvenOdd:
                  obj.getSelectedPanel==5?obj.getAmountBoll5EvenOdd:0;

                  widget.boll == 1
                      ? obj.setNumberBoll1EvenOdd = 0
                      : widget.boll == 2
                          ? obj.setNumberBoll2EvenOdd = 0
                          : widget.boll == 3
                              ? obj.setNumberBoll3EvenOdd = 0
                              : widget.boll == 4
                                  ? obj.setNumberBoll4EvenOdd = 0
                                  : widget.boll == 5
                                      ? obj.setNumberBoll5EvenOdd = 0
                                      : null;

                },
                onChanges: (change) {},
                height: boxHeight,
                width: boxHeight,
                text: '0',
                isReverse: false,
                selectedTextColor: oddTextColor,
                transitionType: TransitionType.LEFT_CENTER_ROUNDER,
                textStyle: NumberConfig.submitTextStyle2,
                backgroundColor: oddColor,
                selectedBackgroundColor: selectedIndex == 0 ? selectedColor2 : selectedColor,
                borderColor: getBorderColor(widget.boll , 0, obj.getSelectedPanel),
                borderWidth: getBorderWidth(widget.boll, 0, obj.getSelectedPanel)
              ),
              AnimatedButton(
                isSelected: selectedIndex == 1 ? true : false,
                onPress: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                  widget.boll == 1
                      ? obj.setSelectedPanel = 1
                      : widget.boll == 2
                          ? obj.setSelectedPanel = 2
                          : widget.boll == 3
                              ? obj.setSelectedPanel = 3
                              : widget.boll == 4
                                  ? obj.setSelectedPanel = 4
                                  : widget.boll == 5
                                      ? obj.setSelectedPanel = 5
                                      : null;
                  obj.setTotalAmount =
                  obj.getSelectedPanel==1?obj.getAmountBoll1EvenOdd:
                  obj.getSelectedPanel==2?obj.getAmountBoll2EvenOdd:
                  obj.getSelectedPanel==3?obj.getAmountBoll3EvenOdd:
                  obj.getSelectedPanel==4?obj.getAmountBoll4EvenOdd:
                  obj.getSelectedPanel==5?obj.getAmountBoll5EvenOdd:0;
                  widget.boll == 1
                      ? obj.setNumberBoll1EvenOdd = 1
                      : widget.boll == 2
                          ? obj.setNumberBoll2EvenOdd = 1
                          : widget.boll == 3
                              ? obj.setNumberBoll3EvenOdd = 1
                              : widget.boll == 4
                                  ? obj.setNumberBoll4EvenOdd = 1
                                  : widget.boll == 5
                                      ? obj.setNumberBoll5EvenOdd = 1
                                      : null;
                },
                height: boxHeight,
                width: boxHeight,
                text: '1',
                isReverse: false,
                selectedTextColor: evenTextColor,
                transitionType: TransitionType.LEFT_CENTER_ROUNDER,
                textStyle: GoogleFonts.nunito(
                    fontSize: NumberConfig.fontSizeNumbers,
                    letterSpacing: 5,
                    color: evenTextColor,
                    fontWeight: FontWeight.w300),
                backgroundColor: evenColor,
                selectedBackgroundColor:
                    selectedIndex == 1 ? selectedColor2 : selectedColor,
                borderColor: getBorderColor(widget.boll , 1, obj.getSelectedPanel),
                  borderWidth: getBorderWidth(widget.boll, 1, obj.getSelectedPanel)
              ),
              AnimatedButton(
                isSelected: selectedIndex == 2 ? true : false,
                onPress: () {
                  setState(() {
                    selectedIndex = 2;
                  });
                  widget.boll == 1
                      ? obj.setSelectedPanel = 1
                      : widget.boll == 2
                          ? obj.setSelectedPanel = 2
                          : widget.boll == 3
                              ? obj.setSelectedPanel = 3
                              : widget.boll == 4
                                  ? obj.setSelectedPanel = 4
                                  : widget.boll == 5
                                      ? obj.setSelectedPanel = 5
                                      : null;
                  obj.setTotalAmount =
                  obj.getSelectedPanel==1?obj.getAmountBoll1EvenOdd:
                  obj.getSelectedPanel==2?obj.getAmountBoll2EvenOdd:
                  obj.getSelectedPanel==3?obj.getAmountBoll3EvenOdd:
                  obj.getSelectedPanel==4?obj.getAmountBoll4EvenOdd:
                  obj.getSelectedPanel==5?obj.getAmountBoll5EvenOdd:0;
                  widget.boll == 1
                      ? obj.setNumberBoll1EvenOdd = 2
                      : widget.boll == 2
                          ? obj.setNumberBoll2EvenOdd = 2
                          : widget.boll == 3
                              ? obj.setNumberBoll3EvenOdd = 2
                              : widget.boll == 4
                                  ? obj.setNumberBoll4EvenOdd = 2
                                  : widget.boll == 5
                                      ? obj.setNumberBoll5EvenOdd = 2
                                      : null;
                },
                height: boxHeight,
                width: boxHeight,
                text: '2',
                isReverse: false,
                textStyle: NumberConfig.submitTextStyle2,
                selectedTextColor: oddTextColor,
                transitionType: TransitionType.LEFT_CENTER_ROUNDER,
                backgroundColor: oddColor,
                selectedBackgroundColor:
                    selectedIndex == 2 ? selectedColor2 : selectedColor,
                borderColor: getBorderColor(widget.boll , 2, obj.getSelectedPanel),
                  borderWidth: getBorderWidth(widget.boll, 2, obj.getSelectedPanel)
              ),
              AnimatedButton(
                isSelected: selectedIndex == 3 ? true : false,
                onPress: () {
                  setState(() {
                    selectedIndex = 3;
                  });
                  widget.boll == 1
                      ? obj.setSelectedPanel = 1
                      : widget.boll == 2
                          ? obj.setSelectedPanel = 2
                          : widget.boll == 3
                              ? obj.setSelectedPanel = 3
                              : widget.boll == 4
                                  ? obj.setSelectedPanel = 4
                                  : widget.boll == 5
                                      ? obj.setSelectedPanel = 5
                                      : null;
                  obj.setTotalAmount =
                  obj.getSelectedPanel==1?obj.getAmountBoll1EvenOdd:
                  obj.getSelectedPanel==2?obj.getAmountBoll2EvenOdd:
                  obj.getSelectedPanel==3?obj.getAmountBoll3EvenOdd:
                  obj.getSelectedPanel==4?obj.getAmountBoll4EvenOdd:
                  obj.getSelectedPanel==5?obj.getAmountBoll5EvenOdd:0;
                  widget.boll == 1
                      ? obj.setNumberBoll1EvenOdd = 3
                      : widget.boll == 2
                          ? obj.setNumberBoll2EvenOdd = 3
                          : widget.boll == 3
                              ? obj.setNumberBoll3EvenOdd = 3
                              : widget.boll == 4
                                  ? obj.setNumberBoll4EvenOdd = 3
                                  : widget.boll == 5
                                      ? obj.setNumberBoll5EvenOdd = 3
                                      : null;
                },
                height: boxHeight,
                width: boxHeight,
                text: '3',
                isReverse: false,
                textStyle: NumberConfig.submitTextStyle,
                selectedTextColor: evenTextColor,
                transitionType: TransitionType.LEFT_CENTER_ROUNDER,
                backgroundColor: evenColor,
                selectedBackgroundColor:
                    selectedIndex == 3 ? selectedColor2 : selectedColor,
                borderColor: getBorderColor(widget.boll , 3, obj.getSelectedPanel),
                  borderWidth: getBorderWidth(widget.boll, 3, obj.getSelectedPanel)
              ),
              AnimatedButton(
                isSelected: selectedIndex == 4 ? true : false,
                onPress: () {
                  setState(() {
                    selectedIndex = 4;
                  });
                  widget.boll == 1
                      ? obj.setSelectedPanel = 1
                      : widget.boll == 2
                          ? obj.setSelectedPanel = 2
                          : widget.boll == 3
                              ? obj.setSelectedPanel = 3
                              : widget.boll == 4
                                  ? obj.setSelectedPanel = 4
                                  : widget.boll == 5
                                      ? obj.setSelectedPanel = 5
                                      : null;
                  obj.setTotalAmount =
                  obj.getSelectedPanel==1?obj.getAmountBoll1EvenOdd:
                  obj.getSelectedPanel==2?obj.getAmountBoll2EvenOdd:
                  obj.getSelectedPanel==3?obj.getAmountBoll3EvenOdd:
                  obj.getSelectedPanel==4?obj.getAmountBoll4EvenOdd:
                  obj.getSelectedPanel==5?obj.getAmountBoll5EvenOdd:0;
                  widget.boll == 1
                      ? obj.setNumberBoll1EvenOdd = 4
                      : widget.boll == 2
                          ? obj.setNumberBoll2EvenOdd = 4
                          : widget.boll == 3
                              ? obj.setNumberBoll3EvenOdd = 4
                              : widget.boll == 4
                                  ? obj.setNumberBoll4EvenOdd = 4
                                  : widget.boll == 5
                                      ? obj.setNumberBoll5EvenOdd = 4
                                      : null;
                },
                height: boxHeight,
                width: boxHeight,
                text: '4',
                isReverse: false,
                textStyle: NumberConfig.submitTextStyle2,
                selectedTextColor: oddTextColor,
                transitionType: TransitionType.LEFT_CENTER_ROUNDER,
                backgroundColor: oddColor,
                selectedBackgroundColor:
                    selectedIndex == 4 ? selectedColor2 : selectedColor,
                borderColor: getBorderColor(widget.boll , 4, obj.getSelectedPanel),
                  borderWidth: getBorderWidth(widget.boll, 4, obj.getSelectedPanel)
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
                      ? obj.setSelectedPanel = 1
                      : widget.boll == 2
                          ? obj.setSelectedPanel = 2
                          : widget.boll == 3
                              ? obj.setSelectedPanel = 3
                              : widget.boll == 4
                                  ? obj.setSelectedPanel = 4
                                  : widget.boll == 5
                                      ? obj.setSelectedPanel = 5
                                      : null;
                  obj.setTotalAmount =
                  obj.getSelectedPanel==1?obj.getAmountBoll1EvenOdd:
                  obj.getSelectedPanel==2?obj.getAmountBoll2EvenOdd:
                  obj.getSelectedPanel==3?obj.getAmountBoll3EvenOdd:
                  obj.getSelectedPanel==4?obj.getAmountBoll4EvenOdd:
                  obj.getSelectedPanel==5?obj.getAmountBoll5EvenOdd:0;
                  widget.boll == 1
                      ? obj.setNumberBoll1EvenOdd = 5
                      : widget.boll == 2
                          ? obj.setNumberBoll2EvenOdd = 5
                          : widget.boll == 3
                              ? obj.setNumberBoll3EvenOdd = 5
                              : widget.boll == 4
                                  ? obj.setNumberBoll4EvenOdd = 5
                                  : widget.boll == 5
                                      ? obj.setNumberBoll5EvenOdd = 5
                                      : null;
                },
                onChanges: (change) {},
                height: boxHeight,
                width: boxHeight,
                text: '5',
                isReverse: false,
                selectedTextColor: evenTextColor,
                transitionType: TransitionType.LEFT_CENTER_ROUNDER,
                textStyle: NumberConfig.submitTextStyle,
                backgroundColor: evenColor,
                selectedBackgroundColor:
                    selectedIndex == 5 ? selectedColor2 : selectedColor,
                borderColor: getBorderColor(widget.boll , 5, obj.getSelectedPanel),
                  borderWidth: getBorderWidth(widget.boll, 5, obj.getSelectedPanel)
              ),
              AnimatedButton(
                isSelected: selectedIndex == 6 ? true : false,
                onPress: () {
                  setState(() {
                    selectedIndex = 6;
                  });
                  widget.boll == 1
                      ? obj.setSelectedPanel = 1
                      : widget.boll == 2
                          ? obj.setSelectedPanel = 2
                          : widget.boll == 3
                              ? obj.setSelectedPanel = 3
                              : widget.boll == 4
                                  ? obj.setSelectedPanel = 4
                                  : widget.boll == 5
                                      ? obj.setSelectedPanel = 5
                                      : null;
                  obj.setTotalAmount =
                  obj.getSelectedPanel==1?obj.getAmountBoll1EvenOdd:
                  obj.getSelectedPanel==2?obj.getAmountBoll2EvenOdd:
                  obj.getSelectedPanel==3?obj.getAmountBoll3EvenOdd:
                  obj.getSelectedPanel==4?obj.getAmountBoll4EvenOdd:
                  obj.getSelectedPanel==5?obj.getAmountBoll5EvenOdd:0;
                  widget.boll == 1
                      ? obj.setNumberBoll1EvenOdd = 6
                      : widget.boll == 2
                          ? obj.setNumberBoll2EvenOdd = 6
                          : widget.boll == 3
                              ? obj.setNumberBoll3EvenOdd = 6
                              : widget.boll == 4
                                  ? obj.setNumberBoll4EvenOdd = 6
                                  : widget.boll == 5
                                      ? obj.setNumberBoll5EvenOdd = 6
                                      : null;
                },
                height: boxHeight,
                width: boxHeight,
                text: '6',
                isReverse: false,
                textStyle: NumberConfig.submitTextStyle2,
                selectedTextColor: oddTextColor,
                transitionType: TransitionType.LEFT_CENTER_ROUNDER,
                backgroundColor: oddColor,
                selectedBackgroundColor:
                    selectedIndex == 6 ? selectedColor2 : selectedColor,
                borderColor: getBorderColor(widget.boll , 6, obj.getSelectedPanel),
                  borderWidth: getBorderWidth(widget.boll, 6, obj.getSelectedPanel)
              ),
              AnimatedButton(
                isSelected: selectedIndex == 7 ? true : false,
                onPress: () {
                  setState(() {
                    selectedIndex = 7;
                  });
                  widget.boll == 1
                      ? obj.setSelectedPanel = 1
                      : widget.boll == 2
                          ? obj.setSelectedPanel = 2
                          : widget.boll == 3
                              ? obj.setSelectedPanel = 3
                              : widget.boll == 4
                                  ? obj.setSelectedPanel = 4
                                  : widget.boll == 5
                                      ? obj.setSelectedPanel = 5
                                      : null;
                  obj.setTotalAmount =
                  obj.getSelectedPanel==1?obj.getAmountBoll1EvenOdd:
                  obj.getSelectedPanel==2?obj.getAmountBoll2EvenOdd:
                  obj.getSelectedPanel==3?obj.getAmountBoll3EvenOdd:
                  obj.getSelectedPanel==4?obj.getAmountBoll4EvenOdd:
                  obj.getSelectedPanel==5?obj.getAmountBoll5EvenOdd:0;
                  widget.boll == 1
                      ? obj.setNumberBoll1EvenOdd = 7
                      : widget.boll == 2
                          ? obj.setNumberBoll2EvenOdd = 7
                          : widget.boll == 3
                              ? obj.setNumberBoll3EvenOdd = 7
                              : widget.boll == 4
                                  ? obj.setNumberBoll4EvenOdd = 7
                                  : widget.boll == 5
                                      ? obj.setNumberBoll5EvenOdd = 7
                                      : null;
                },
                height: boxHeight,
                width: boxHeight,
                text: '7',
                isReverse: false,
                textStyle: NumberConfig.submitTextStyle,
                selectedTextColor: evenTextColor,
                transitionType: TransitionType.LEFT_CENTER_ROUNDER,
                backgroundColor: evenColor,
                selectedBackgroundColor:
                    selectedIndex == 7 ? selectedColor2 : selectedColor,
                borderColor: getBorderColor(widget.boll , 7, obj.getSelectedPanel),
                  borderWidth: getBorderWidth(widget.boll, 7, obj.getSelectedPanel)
              ),
              AnimatedButton(
                isSelected: selectedIndex == 8 ? true : false,
                onPress: () {
                  setState(() {
                    selectedIndex = 8;
                  });
                  widget.boll == 1
                      ? obj.setSelectedPanel = 1
                      : widget.boll == 2
                          ? obj.setSelectedPanel = 2
                          : widget.boll == 3
                              ? obj.setSelectedPanel = 3
                              : widget.boll == 4
                                  ? obj.setSelectedPanel = 4
                                  : widget.boll == 5
                                      ? obj.setSelectedPanel = 5
                                      : null;
                  obj.setTotalAmount =
                  obj.getSelectedPanel==1?obj.getAmountBoll1EvenOdd:
                  obj.getSelectedPanel==2?obj.getAmountBoll2EvenOdd:
                  obj.getSelectedPanel==3?obj.getAmountBoll3EvenOdd:
                  obj.getSelectedPanel==4?obj.getAmountBoll4EvenOdd:
                  obj.getSelectedPanel==5?obj.getAmountBoll5EvenOdd:0;
                  widget.boll == 1
                      ? obj.setNumberBoll1EvenOdd = 8
                      : widget.boll == 2
                          ? obj.setNumberBoll2EvenOdd = 8
                          : widget.boll == 3
                              ? obj.setNumberBoll3EvenOdd = 8
                              : widget.boll == 4
                                  ? obj.setNumberBoll4EvenOdd = 8
                                  : widget.boll == 5
                                      ? obj.setNumberBoll5EvenOdd = 8
                                      : null;
                },
                height: boxHeight,
                width: boxHeight,
                text: '8',
                isReverse: false,
                textStyle: NumberConfig.submitTextStyle2,
                selectedTextColor: oddTextColor,
                transitionType: TransitionType.LEFT_CENTER_ROUNDER,
                backgroundColor: oddColor,
                selectedBackgroundColor:
                    selectedIndex == 8 ? selectedColor2 : selectedColor,
                borderColor: getBorderColor(widget.boll , 8, obj.getSelectedPanel),
                  borderWidth: getBorderWidth(widget.boll, 8, obj.getSelectedPanel)
              ),
              AnimatedButton(
                isSelected: selectedIndex == 9 ? true : false,
                onPress: () {
                  setState(() {
                    selectedIndex = 9;
                  });
                  widget.boll == 1
                      ? obj.setSelectedPanel = 1
                      : widget.boll == 2
                          ? obj.setSelectedPanel = 2
                          : widget.boll == 3
                              ? obj.setSelectedPanel = 3
                              : widget.boll == 4
                                  ? obj.setSelectedPanel = 4
                                  : widget.boll == 5
                                      ? obj.setSelectedPanel = 5
                                      : null;
                  obj.setTotalAmount =
                  obj.getSelectedPanel==1?obj.getAmountBoll1EvenOdd:
                  obj.getSelectedPanel==2?obj.getAmountBoll2EvenOdd:
                  obj.getSelectedPanel==3?obj.getAmountBoll3EvenOdd:
                  obj.getSelectedPanel==4?obj.getAmountBoll4EvenOdd:
                  obj.getSelectedPanel==5?obj.getAmountBoll5EvenOdd:0;
                  widget.boll == 1
                      ? obj.setNumberBoll1EvenOdd = 9
                      : widget.boll == 2
                          ? obj.setNumberBoll2EvenOdd = 9
                          : widget.boll == 3
                              ? obj.setNumberBoll3EvenOdd = 9
                              : widget.boll == 4
                                  ? obj.setNumberBoll4EvenOdd = 9
                                  : widget.boll == 5
                                      ? obj.setNumberBoll5EvenOdd = 9
                                      : null;
                },
                height: boxHeight,
                width: boxHeight,
                text: '9',
                isReverse: false,
                textStyle: NumberConfig.submitTextStyle,
                selectedTextColor: evenTextColor,
                transitionType: TransitionType.LEFT_CENTER_ROUNDER,
                backgroundColor: evenColor,
                selectedBackgroundColor:
                    selectedIndex == 9 ? selectedColor2 : selectedColor,
                borderColor: getBorderColor(widget.boll , 9, obj.getSelectedPanel),
                  borderWidth: getBorderWidth(widget.boll,9, obj.getSelectedPanel)
              ),
            ],
          ),
          // PanelAmountIncDec(oddEven:true,boll:widget.boll)
        ],
      );
    });
  }
}
