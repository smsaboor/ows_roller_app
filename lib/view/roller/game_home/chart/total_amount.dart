import 'package:flutter/material.dart';

class TotalAmount extends StatelessWidget {
  const TotalAmount(
      {Key? key,
      required this.obj,
      required this.height,
      required this.fontSize})
      : super(key: key);
  final obj;
  final height;
  final fontSize;

  @override
  Widget build(BuildContext context) {
    // height: appWidth(context)*.26,
    // width: appWidth(context)*.2,
    // ChartTitle(height:appWidth(context)*.03,),
    // ChartRow(height:appWidth(context)*.15,obj: obj),
    // TotalAmount(height:appWidth(context)*.03,obj:obj),
    // CharWallet(height:appWidth(context)*.03,obj: obj,)

    return SizedBox(
      height: height,
      child: Center(
        child: Text(
          'Total Bet Amount = ${obj.getTotalBetAmount} ₹',
          style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: fontSize),
        ),
      ),
    );
  }
}
