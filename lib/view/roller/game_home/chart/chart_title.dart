import 'package:flutter/material.dart';
import 'package:ows_roller_app/view/theme/resources/themes/theme_view_model.dart';
import 'package:provider/provider.dart';

class ChartTitle extends StatelessWidget {
  ChartTitle(
      {Key? key,
      required this.height,
      required this.bgColor,
      required this.width,
      required this.fontSize,
      required this.cellWidth})
      : super(key: key);
  final height;
  final bgColor;
  final width;
  final fontSize;
  final cellWidth;

  TextStyle getTextStyle(BuildContext context, double height) {
    final themeViewModel = context.watch<ThemeViewModel>();
    return TextStyle(
        color: Colors.white, fontWeight: FontWeight.w500, fontSize: height);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(0)),
          color: Colors.red),
      child: Row(
        children: [
          SizedBox(
              width: cellWidth * .6,
              child: Center(
                  child: Text('Boll', style: getTextStyle(context, fontSize)))),
          Container(
            height: 1,
            color: Colors.red,
          ),
          SizedBox(
              width: cellWidth,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Odd/',
                    style: getTextStyle(context, fontSize),
                  ),
                  Text(
                    'Even',
                    style: getTextStyle(context, fontSize),
                  ),
                ],
              ))),
          Container(
            height: 1,
            color: Colors.red,
          ),
          SizedBox(
              width: cellWidth,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Small/',
                    style: getTextStyle(context, fontSize),
                  ),
                  Text(
                    'Large',
                    style: getTextStyle(context, fontSize),
                  ),
                ],
              ))),
          Container(
            height: 1,
            color: Colors.red,
          ),
          SizedBox(
              width: cellWidth,
              child: Center(
                  child: Text(
                'Total',
                style: getTextStyle(context, fontSize),
              ))),
        ],
      ),
    );
  }
}
