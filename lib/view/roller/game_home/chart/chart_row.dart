import 'package:flutter/material.dart';
import 'package:ows_roller_app/view/app_config/local/components.dart';
import 'package:ows_roller_app/view_model/bet_view_model.dart';
import 'package:provider/provider.dart';
import 'chart_cells.dart';

class ChartRow extends StatelessWidget {
  const ChartRow(
      {Key? key,
      required this.obj,
      required this.height,
      required this.width,
        required this.fontSize,
      required this.cellWidth})
      : super(key: key);
  final obj;
  final height;
  final width;
  final cellWidth;
  final fontSize;


  @override
  Widget build(BuildContext context) {
    // height: appWidth(context)*.26,
    // width: appWidth(context)*.2,
    // ChartTitle(height:appWidth(context)*.03,),
    // ChartRow(height:appWidth(context)*.15,obj: obj),
    // TotalAmount(height:appWidth(context)*.03,obj:obj),
    // CharWallet(height:appWidth(context)*.03,obj: obj,)

    return Consumer<BetViewModel>(builder: (context, obj, child) {
      return SizedBox(
          height: height,
          width: width,
          child: Row(
            children: [
              SizedBox(
                  width: cellWidth * .6,
                  child: Column(
                    children: [
                      ChartCells(
                        height:height*.2,
                        border: false,
                        title: '1',
                        width: cellWidth * .6,
                        fontSize: fontSize,
                      ),
                      ChartCells(
                        border: false,
                        height:height*.2,
                        title: '2',
                        width: cellWidth * .6,
                        fontSize: fontSize,
                      ),
                      ChartCells(
                        border: false,
                        height:height*.2,
                        title: '3',
                        width: appWidth(context) * .6,
                        fontSize: fontSize,
                      ),
                      ChartCells(
                        border: false,
                        height:height*.2,
                        title: '4',
                        width: cellWidth * .6,
                        fontSize: fontSize,
                      ),
                      ChartCells(
                        border: false,
                        height:height*.2,
                        title: '5',
                        width: cellWidth * .6,
                        fontSize: fontSize,
                      ),
                    ],
                  )),
              SizedBox(
                  width: cellWidth,
                  child: Column(
                    children: [
                      ChartCells(
                          height:height*.2,
                          border: obj.getSelectedPanel == 1 ? true : false,
                          width: cellWidth,
                          fontSize: fontSize,
                          title:
                              '${obj.getNumberBoll1EvenOdd}/${obj.getAmountBoll1EvenOdd}₹'),
                      ChartCells(
                          height:height*.2,
                          border: obj.getSelectedPanel == 2 ? true : false,
                          width: cellWidth,
                          fontSize: fontSize,
                          title:
                              '${obj.getNumberBoll2EvenOdd}/${obj.getAmountBoll2EvenOdd}₹'),
                      ChartCells(
                          height:height*.2,
                          border: obj.getSelectedPanel == 3 ? true : false,
                          width: cellWidth,
                          fontSize: fontSize,
                          title:
                              '${obj.getNumberBoll3EvenOdd}/${obj.getAmountBoll3EvenOdd}₹'),
                      ChartCells(
                          height:height*.2,
                          border: obj.getSelectedPanel == 4 ? true : false,
                          width: cellWidth,
                          fontSize: fontSize,
                          title:
                              '${obj.getNumberBoll4EvenOdd}/${obj.getAmountBoll4EvenOdd}₹'),
                      ChartCells(
                          height:height*.2,
                          border: obj.getSelectedPanel == 5 ? true : false,
                          width: cellWidth,
                          fontSize: fontSize,
                          title:
                              '${obj.getNumberBoll5EvenOdd}/${obj.getAmountBoll5EvenOdd}₹'),
                    ],
                  )),
              SizedBox(
                  width: cellWidth,
                  child: Column(
                    children: [
                      ChartCells(
                          height:height*.2,
                          border: obj.getSelectedPanel == 6 ? true : false,
                          width: cellWidth,
                          fontSize: fontSize,
                          title:
                              '${obj.getNumberBoll1SmallLarge}/${obj.getAmountBoll1SmallLarge}₹'),
                      ChartCells(
                          height:height*.2,
                          border: obj.getSelectedPanel == 7 ? true : false,
                          width: cellWidth,
                          fontSize: fontSize,
                          title:
                              '${obj.getNumberBoll2SmallLarge}/${obj.getAmountBoll2SmallLarge}₹'),
                      ChartCells(
                          height:height*.2,
                          border: obj.getSelectedPanel == 8 ? true : false,
                          width: cellWidth,
                          fontSize: fontSize,
                          title:
                              '${obj.getNumberBoll3SmallLarge}/${obj.getAmountBoll3SmallLarge}₹'),
                      ChartCells(
                          height:height*.2,
                          border: obj.getSelectedPanel == 9 ? true : false,
                          width: cellWidth,
                          fontSize: fontSize,
                          title:
                              '${obj.getNumberBoll4SmallLarge}/${obj.getAmountBoll4SmallLarge}₹'),
                      ChartCells(
                          height:height*.2,
                          border: obj.getSelectedPanel == 10 ? true : false,
                          width: cellWidth,
                          fontSize: fontSize,
                          title:
                              '${obj.getNumberBoll5SmallLarge}/${obj.getAmountBoll5SmallLarge}₹'),
                    ],
                  )),
              SizedBox(
                  width: cellWidth,
                  child: Column(
                    children: [
                      ChartCells(
                          height:height*.2,
                          border: false,
                          width: cellWidth,
                          fontSize: fontSize,
                          title:
                              '${obj.getAmountBoll1EvenOdd + obj.getAmountBoll1SmallLarge}₹'),
                      ChartCells(
                          height:height*.2,
                          border: false,
                          width: cellWidth,
                          fontSize: fontSize,
                          title:
                              '${obj.getAmountBoll2EvenOdd + obj.getAmountBoll2SmallLarge}₹'),
                      ChartCells(
                          height:height*.2,
                          border: false,
                          width: cellWidth,
                          fontSize: fontSize,
                          title:
                              '${obj.getAmountBoll3EvenOdd + obj.getAmountBoll3SmallLarge}₹'),
                      ChartCells(
                          height:height*.2,
                          border: false,
                          width: cellWidth,
                          fontSize: fontSize,
                          title:
                              '${obj.getAmountBoll4EvenOdd + obj.getAmountBoll4SmallLarge}₹'),
                      ChartCells(
                          height:height*.2,
                          border: false,
                          width: cellWidth,
                          fontSize: fontSize,
                          title:
                              '${obj.getAmountBoll5EvenOdd + obj.getAmountBoll5SmallLarge}₹'),
                    ],
                  )),
            ],
          ));
    });
  }
}
