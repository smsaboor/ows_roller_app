import 'package:flutter/material.dart';
import 'package:ows_roller_app/view/app_config/local/components.dart';
import 'package:ows_roller_app/view/roller/game_home/panel_amount_inc_dec.dart';
import 'package:ows_roller_app/view_model/bet_view_model.dart';
import 'package:provider/provider.dart';

class StackBetPanel extends StatelessWidget {
  StackBetPanel({Key? key, required this.bgColor, required this.height})
      : super(key: key);
  final bgColor;
  double boxHeight = 30.0;
  late final boxColor;
  final height;

  @override
  Widget build(BuildContext context) {
    boxHeight = height * .19;
    boxColor = bgColor;
    var boxDecoration = BoxDecoration(
        border: Border.all(color: Colors.white, width: .5),
    color: boxColor
    );
    return Container(
      height: height,
      width: appWidth(context) * .4,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: .5),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(0)),
          color: bgColor),
      child: Consumer<BetViewModel>(builder: (context, obj, child) {
        return Column(
          children: [
            Container(
              height: height * .12,
              width: appWidth(context) * .4,
              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.only(topLeft: Radius.circular(0)),
                image: DecorationImage(
                  image: AssetImage("assets/bg/black1.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  'Select Bet Amount',
                  style: TextStyle(color: Colors.white, fontSize: 11),
                ),
              ),
            ),
            Container(
              height: height * .12,
              width: appWidth(context) * .4,
              decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.only(topLeft: Radius.circular(0)),
                  color: Colors.red
              ),
              child: Center(
                child: Text(
                  'Wallet: ₹ 6,09,099',
                  style: TextStyle(color: Colors.white, fontSize: 11),
                ),
              ),
            ),
            SizedBox(
              height: boxHeight,
              width: appWidth(context) * .4,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      obj.getSelectedPanel == 1 ? obj.setAmountBoll1EvenOdd = 10
                          : obj.getSelectedPanel == 2 ? obj.setAmountBoll2EvenOdd = 10
                          : obj.getSelectedPanel == 3 ? obj.setAmountBoll3EvenOdd = 10
                          : obj.getSelectedPanel == 4 ? obj.setAmountBoll4EvenOdd = 10
                          : obj.getSelectedPanel == 5 ? obj.setAmountBoll5EvenOdd = 10
                          : obj.getSelectedPanel == 6 ? obj.setAmountBoll1SmallLarge = 10
                          : obj.getSelectedPanel == 7 ? obj.setAmountBoll2SmallLarge = 10
                          : obj.getSelectedPanel == 8 ? obj.setAmountBoll3SmallLarge = 10
                          : obj.getSelectedPanel == 9 ? obj.setAmountBoll4SmallLarge = 10
                          : obj.setAmountBoll5SmallLarge = 10;
                    },
                    child: Container(
                      decoration: boxDecoration,
                      height: boxHeight,
                      width: appWidth(context) * .132,
                      child: Center(
                        child: Text('10₹'),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      obj.getSelectedPanel == 1 ? obj.setAmountBoll1EvenOdd = 50
                          : obj.getSelectedPanel == 2 ? obj.setAmountBoll2EvenOdd = 50
                          : obj.getSelectedPanel == 3 ? obj.setAmountBoll3EvenOdd = 50
                          : obj.getSelectedPanel == 4 ? obj.setAmountBoll4EvenOdd = 50
                          : obj.getSelectedPanel == 5 ? obj.setAmountBoll5EvenOdd = 50
                          : obj.getSelectedPanel == 6 ? obj.setAmountBoll1SmallLarge = 50
                          : obj.getSelectedPanel == 7 ? obj.setAmountBoll2SmallLarge = 50
                          : obj.getSelectedPanel == 8 ? obj.setAmountBoll3SmallLarge = 50
                          : obj.getSelectedPanel == 9 ? obj.setAmountBoll4SmallLarge = 50
                          : obj.setAmountBoll5SmallLarge = 50;
                    },
                    child: Container(
                      decoration: boxDecoration,
                      height: boxHeight,
                      width: appWidth(context) * .132,
                      child: Center(
                        child: Text('50₹'),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      obj.getSelectedPanel == 1 ? obj.setAmountBoll1EvenOdd = 100
                          : obj.getSelectedPanel == 2 ? obj.setAmountBoll2EvenOdd = 100
                          : obj.getSelectedPanel == 3 ? obj.setAmountBoll3EvenOdd = 100
                          : obj.getSelectedPanel == 4 ? obj.setAmountBoll4EvenOdd = 100
                          : obj.getSelectedPanel == 5 ? obj.setAmountBoll5EvenOdd = 100
                          : obj.getSelectedPanel == 6 ? obj.setAmountBoll1SmallLarge = 100
                          : obj.getSelectedPanel == 7 ? obj.setAmountBoll2SmallLarge = 100
                          : obj.getSelectedPanel == 8 ? obj.setAmountBoll3SmallLarge = 100
                          : obj.getSelectedPanel == 9 ? obj.setAmountBoll4SmallLarge = 100
                          : obj.setAmountBoll5SmallLarge = 100;
                    },
                    child: Container(
                      decoration: boxDecoration,
                      height: boxHeight,
                      width: appWidth(context) * .132,
                      child: Center(
                        child: Text('100₹'),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: boxHeight,
              width: appWidth(context) * .4,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      obj.getSelectedPanel == 1 ? obj.setAmountBoll1EvenOdd = 500
                          : obj.getSelectedPanel == 2 ? obj.setAmountBoll2EvenOdd = 500
                          : obj.getSelectedPanel == 3 ? obj.setAmountBoll3EvenOdd = 500
                          : obj.getSelectedPanel == 4 ? obj.setAmountBoll4EvenOdd = 500
                          : obj.getSelectedPanel == 5 ? obj.setAmountBoll5EvenOdd = 500
                          : obj.getSelectedPanel == 6 ? obj.setAmountBoll1SmallLarge = 500
                          : obj.getSelectedPanel == 7 ? obj.setAmountBoll2SmallLarge = 500
                          : obj.getSelectedPanel == 8 ? obj.setAmountBoll3SmallLarge = 500
                          : obj.getSelectedPanel == 9 ? obj.setAmountBoll4SmallLarge = 500
                          : obj.setAmountBoll5SmallLarge = 500;
                    },
                    child: Container(
                      decoration: boxDecoration,
                      height: boxHeight,
                      width: appWidth(context) * .132,
                      child: Center(
                        child: Text('500₹'),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      obj.getSelectedPanel == 1 ? obj.setAmountBoll1EvenOdd = 1000
                          : obj.getSelectedPanel == 2 ? obj.setAmountBoll2EvenOdd = 1000
                          : obj.getSelectedPanel == 3 ? obj.setAmountBoll3EvenOdd = 1000
                          : obj.getSelectedPanel == 4 ? obj.setAmountBoll4EvenOdd = 1000
                          : obj.getSelectedPanel == 5 ? obj.setAmountBoll5EvenOdd = 1000
                          : obj.getSelectedPanel == 6 ? obj.setAmountBoll1SmallLarge = 1000
                          : obj.getSelectedPanel == 7 ? obj.setAmountBoll2SmallLarge = 1000
                          : obj.getSelectedPanel == 8 ? obj.setAmountBoll3SmallLarge = 1000
                          : obj.getSelectedPanel == 9 ? obj.setAmountBoll4SmallLarge = 1000
                          : obj.setAmountBoll5SmallLarge = 1000;
                    },
                    child: Container(
                      decoration: boxDecoration,
                      height: boxHeight,
                      width: appWidth(context) * .132,
                      child: Center(
                        child: Text('1000₹'),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      obj.getSelectedPanel == 1 ? obj.setAmountBoll1EvenOdd = 1500
                          : obj.getSelectedPanel == 2 ? obj.setAmountBoll2EvenOdd = 1500
                          : obj.getSelectedPanel == 3 ? obj.setAmountBoll3EvenOdd = 1500
                          : obj.getSelectedPanel == 4 ? obj.setAmountBoll4EvenOdd = 1500
                          : obj.getSelectedPanel == 5 ? obj.setAmountBoll5EvenOdd = 1500
                          : obj.getSelectedPanel == 6 ? obj.setAmountBoll1SmallLarge = 1500
                          : obj.getSelectedPanel == 7 ? obj.setAmountBoll2SmallLarge = 1500
                          : obj.getSelectedPanel == 8 ? obj.setAmountBoll3SmallLarge = 1500
                          : obj.getSelectedPanel == 9 ? obj.setAmountBoll4SmallLarge = 1500
                          : obj.setAmountBoll5SmallLarge = 1500;
                    },
                    child: Container(
                      decoration: boxDecoration,
                      height: boxHeight,
                      width: appWidth(context) * .132,
                      child: Center(
                        child: Text('1500₹'),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: boxHeight,
              width: appWidth(context) * .4,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      obj.getSelectedPanel == 1 ? obj.setAmountBoll1EvenOdd = 2000
                          : obj.getSelectedPanel == 2 ? obj.setAmountBoll2EvenOdd = 2000
                          : obj.getSelectedPanel == 3 ? obj.setAmountBoll3EvenOdd = 2000
                          : obj.getSelectedPanel == 4 ? obj.setAmountBoll4EvenOdd = 2000
                          : obj.getSelectedPanel == 5 ? obj.setAmountBoll5EvenOdd = 2000
                          : obj.getSelectedPanel == 6 ? obj.setAmountBoll1SmallLarge = 2000
                          : obj.getSelectedPanel == 7 ? obj.setAmountBoll2SmallLarge = 2000
                          : obj.getSelectedPanel == 8 ? obj.setAmountBoll3SmallLarge = 2000
                          : obj.getSelectedPanel == 9 ? obj.setAmountBoll4SmallLarge = 2000
                          : obj.setAmountBoll5SmallLarge = 2000;
                    },
                    child: Container(
                      decoration: boxDecoration,
                      height: boxHeight,
                      width: appWidth(context) * .132,
                      child: Center(
                        child: Text('2000₹'),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      obj.getSelectedPanel == 1 ? obj.setAmountBoll1EvenOdd = 2500
                          : obj.getSelectedPanel == 2 ? obj.setAmountBoll2EvenOdd = 2500
                          : obj.getSelectedPanel == 3 ? obj.setAmountBoll3EvenOdd = 2500
                          : obj.getSelectedPanel == 4 ? obj.setAmountBoll4EvenOdd = 2500
                          : obj.getSelectedPanel == 5 ? obj.setAmountBoll5EvenOdd = 2500
                          : obj.getSelectedPanel == 6 ? obj.setAmountBoll1SmallLarge = 2500
                          : obj.getSelectedPanel == 7 ? obj.setAmountBoll2SmallLarge = 2500
                          : obj.getSelectedPanel == 8 ? obj.setAmountBoll3SmallLarge = 2500
                          : obj.getSelectedPanel == 9 ? obj.setAmountBoll4SmallLarge = 2500
                          : obj.setAmountBoll5SmallLarge = 2500;
                    },
                    child: Container(
                      decoration: boxDecoration,
                      height: boxHeight,
                      width: appWidth(context) * .132,
                      child: Center(
                        child: Text('2500₹'),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      obj.getSelectedPanel == 1 ? obj.setAmountBoll1EvenOdd = 3000
                          : obj.getSelectedPanel == 2 ? obj.setAmountBoll2EvenOdd = 3000
                          : obj.getSelectedPanel == 3 ? obj.setAmountBoll3EvenOdd = 3000
                          : obj.getSelectedPanel == 4 ? obj.setAmountBoll4EvenOdd = 3000
                          : obj.getSelectedPanel == 5 ? obj.setAmountBoll5EvenOdd = 3000
                          : obj.getSelectedPanel == 6 ? obj.setAmountBoll1SmallLarge = 3000
                          : obj.getSelectedPanel == 7 ? obj.setAmountBoll2SmallLarge = 3000
                          : obj.getSelectedPanel == 8 ? obj.setAmountBoll3SmallLarge = 3000
                          : obj.getSelectedPanel == 9 ? obj.setAmountBoll4SmallLarge = 3000
                          : obj.setAmountBoll5SmallLarge = 3000;
                    },
                    child: Container(
                      height: boxHeight,
                      decoration: boxDecoration,
                      width: appWidth(context) * .132,
                      child: Center(
                        child: Text('3000₹'),
                      ),
                    ),
                  )
                ],
              ),
            ),
            PanelAmountIncDec(obj:obj,height: height * .18, oddEven: true, boll: 1)
          ],
        );
      }),
    );
  }


}
