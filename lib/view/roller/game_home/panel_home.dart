import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ows_roller_app/view/roller/widget/config.dart';
import 'panel_row.dart';

class PanelHome extends StatelessWidget {
  const PanelHome({Key? key,
    required this.data,
    required this.bgColor,
    required this.height})
      : super(key: key);
  final data;
  final bgColor;
  final height;

  @override
  Widget build(BuildContext context) {
    print('PanelHome: $data');
    // ModelGame modelGame=data[0];
    return Column(
      children:[
      SizedBox(height: GameConfig.getCommonGapeHeight(context),),
      SizedBox(
          height: GameConfig.getOddEvenHeight(context),
          child: PanelRow(
              bgColor: bgColor, title: 'B1', boll: 1)),
      SizedBox(height: GameConfig.getCommonGapeHeight(context)),
      SizedBox(
          height: GameConfig.getOddEvenHeight(context),
          child: PanelRow(bgColor: bgColor, title: 'B2', boll: 2)),
      SizedBox(height: GameConfig.getCommonGapeHeight(context)),
      SizedBox(
          height: GameConfig.getOddEvenHeight(context),
          child: PanelRow(bgColor: bgColor, title: 'B3', boll: 3)),
      SizedBox(height: GameConfig.getCommonGapeHeight(context)),
      SizedBox(
          height: GameConfig.getOddEvenHeight(context),
          child: PanelRow(bgColor: bgColor, title: 'B4', boll: 4)),
      SizedBox(height: GameConfig.getCommonGapeHeight(context)),
      SizedBox(
          height: GameConfig.getOddEvenHeight(context),
          child: PanelRow(bgColor: bgColor, title: 'B5', boll: 5)),
      SizedBox(height: GameConfig.getCommonGapeHeight(context)),
      ],
    );
  }
}
