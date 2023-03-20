import 'package:flutter/material.dart';
import 'wheel.dart';
import 'package:ows_roller_app/view/roller/widget/config.dart';
import 'package:ows_roller_app/view/theme/resources/themes/theme_view_model.dart';
import 'package:ows_roller_app/view_model/roller_view_model.dart';
import 'package:provider/provider.dart';

const oneSec = const Duration(seconds: 1);
const interval = const Duration(minutes: 1);
const iconCancel = Icons.cancel;
const iconStart = Icons.alarm;
const alarmAudioPath = "wav.mp3";

class GameRoller extends StatefulWidget {
  const GameRoller({Key? key, required this.minute, required this.bgColor})
      : super(key: key);
  final minute;
  final bgColor;
  @override
  _GameRollerState createState() => _GameRollerState();
}

class _GameRollerState extends State<GameRoller> {
  bool loadingFlag = true;
  WheelConfig wheelConfig = WheelConfig();
  late Color? settingIconColor;
  late Color? rollerColor;
  late TextStyle? selectTextStyle;
  late TextStyle? unSelectTextStyle;

  late bool? flagSoundValue;
  int scrollMillisecond = 10000;
  late final RollerViewModel provider;

  @override
  void initState() {
    print('minute ${widget.minute}');
    if (widget.minute == 180000) {
      rollerColor = Colors.black87;
      settingIconColor = Colors.black87;
      selectTextStyle = TextStyle(color: Colors.white, fontSize: 12);
      unSelectTextStyle = TextStyle(color: Colors.grey.shade400);
    } else if (widget.minute == 360000) {
      rollerColor = Colors.black87;
      settingIconColor = Colors.black87;
      selectTextStyle = TextStyle(color: Colors.white, fontSize: 12);
      unSelectTextStyle = TextStyle(color: Colors.grey.shade400);
    } else if (widget.minute == 540000) {
      rollerColor = Colors.black87;
      settingIconColor = Colors.black87;
      selectTextStyle = TextStyle(color: Colors.white, fontSize: 12);
      unSelectTextStyle = TextStyle(color: Colors.grey.shade400);
    } else {
      rollerColor = Colors.black87;
      settingIconColor = Colors.black87;
      selectTextStyle = TextStyle(color: Colors.white, fontSize: 12);
      unSelectTextStyle = TextStyle(color: Colors.grey.shade400);
    }
    print('*** source1');
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeViewModel = context.watch<ThemeViewModel>();
    return Consumer<RollerViewModel>(builder: (context, obj, child) {
      return Row(
        children: [
          SizedBox(
            width: wheelConfig.sizeBoxWidth,
          ),
          WheelChooser.integer(
            onValueChanged: (s) => print(s.toString()),
            controller: obj.controllerWC1,
            selectTextStyle: wheelConfig.selectTextStyle,
            unSelectTextStyle: wheelConfig.unSelectTextStyle,
            rollerColor: widget.bgColor,
            minValue: wheelConfig.minValue,
            maxValue: wheelConfig.maxValue,
            isInfinite: wheelConfig.isInfinite,
            listHeight: wheelConfig.listHeight,
            listWidth: wheelConfig.listWidth,
            itemSize: wheelConfig.itemSize,
            squeeze: wheelConfig.squeeze,
            horizontal: wheelConfig.horizontal,
            magnification: wheelConfig.magnification,
          ),
          SizedBox(
            width: wheelConfig.sizeBoxWidth,
          ),
          WheelChooser.integer(
            onValueChanged: (s) => print(s.toString()),
            controller: obj.controllerWC2,
            selectTextStyle: wheelConfig.selectTextStyle,
            unSelectTextStyle: wheelConfig.unSelectTextStyle,
            rollerColor: widget.bgColor,
            minValue: wheelConfig.minValue,
            maxValue: wheelConfig.maxValue,
            isInfinite: wheelConfig.isInfinite,
            listHeight: wheelConfig.listHeight,
            listWidth: wheelConfig.listWidth,
            itemSize: wheelConfig.itemSize,
            squeeze: wheelConfig.squeeze,
            horizontal: wheelConfig.horizontal,
            magnification: wheelConfig.magnification,
          ),
          SizedBox(
            width: wheelConfig.sizeBoxWidth,
          ),
          WheelChooser.integer(
            onValueChanged: (s) => print(s.toString()),
            controller: obj.controllerWC3,
            selectTextStyle: wheelConfig.selectTextStyle,
            unSelectTextStyle: wheelConfig.unSelectTextStyle,
            rollerColor: widget.bgColor,
            minValue: wheelConfig.minValue,
            maxValue: wheelConfig.maxValue,
            isInfinite: wheelConfig.isInfinite,
            listHeight: wheelConfig.listHeight,
            listWidth: wheelConfig.listWidth,
            itemSize: wheelConfig.itemSize,
            squeeze: wheelConfig.squeeze,
            horizontal: wheelConfig.horizontal,
            magnification: wheelConfig.magnification,
          ),
          SizedBox(
            width: wheelConfig.sizeBoxWidth,
          ),
          WheelChooser.integer(
            onValueChanged: (s) => print(s.toString()),
            controller: obj.controllerWC4,
            selectTextStyle: wheelConfig.selectTextStyle,
            unSelectTextStyle: wheelConfig.unSelectTextStyle,
            rollerColor: widget.bgColor,
            minValue: wheelConfig.minValue,
            maxValue: wheelConfig.maxValue,
            isInfinite: wheelConfig.isInfinite,
            listHeight: wheelConfig.listHeight,
            listWidth: wheelConfig.listWidth,
            itemSize: wheelConfig.itemSize,
            squeeze: wheelConfig.squeeze,
            horizontal: wheelConfig.horizontal,
            magnification: wheelConfig.magnification,
          ),
          SizedBox(
            width: wheelConfig.sizeBoxWidth,
          ),
          WheelChooser.integer(
            onValueChanged: (s) => print(s.toString()),
            controller: obj.controllerWC5,
            selectTextStyle: wheelConfig.selectTextStyle,
            unSelectTextStyle: wheelConfig.unSelectTextStyle,
            rollerColor: widget.bgColor,
            minValue: wheelConfig.minValue,
            maxValue: wheelConfig.maxValue,
            isInfinite: wheelConfig.isInfinite,
            listHeight: wheelConfig.listHeight,
            listWidth: wheelConfig.listWidth,
            itemSize: wheelConfig.itemSize,
            squeeze: wheelConfig.squeeze,
            horizontal: wheelConfig.horizontal,
            magnification: wheelConfig.magnification,
          ),
        ],
      );
    });
  }
}
