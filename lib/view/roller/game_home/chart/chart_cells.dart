import 'package:flutter/material.dart';

class ChartCells extends StatelessWidget {
  const ChartCells(
      {Key? key,
      required this.title,
      required this.width,
        required this.fontSize,
        required this.height,
      required this.border})
      : super(key: key);
  final title;
  final width;
  final border;
  final fontSize;
  final height;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration:border==true?
            BoxDecoration(border: Border.all(width: .5, color: Colors.black)):null,
        child: Center(
            child: Text(
          title.toString(),
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: fontSize),
        )));
  }
}
