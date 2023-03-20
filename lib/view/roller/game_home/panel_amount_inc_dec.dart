
import 'package:flutter/material.dart';
import 'package:ows_roller_app/view/app_config/local/components.dart';
import 'package:ows_roller_app/view_model/bet_view_model.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class PanelAmountIncDec extends StatelessWidget {
  PanelAmountIncDec(
      {Key? key,
      required this.oddEven,
      required this.boll,
      required this.height,
      required this.obj})
      : super(key: key);
  final oddEven;
  final boll;
  final height;
  final obj;
  final NumberFormat numberFormat = NumberFormat.decimalPattern('hi');

  @override
  Widget build(BuildContext context) {
    return Container(
      width: appWidth(context) * .4,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
      ),
      child: Consumer<BetViewModel>(builder: (context, obj, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async{
                int amount=await Provider.of<BetViewModel>(context, listen: false)
                    .setDecrementTotalAmount(10);
                obj.getSelectedPanel == 1 ? obj.setAmountBoll1EvenOdd = amount
                    : obj.getSelectedPanel == 2 ? obj.setAmountBoll2EvenOdd = amount
                    : obj.getSelectedPanel == 3 ? obj.setAmountBoll3EvenOdd = amount
                    : obj.getSelectedPanel == 4 ? obj.setAmountBoll4EvenOdd = amount
                    : obj.getSelectedPanel == 5 ? obj.setAmountBoll5EvenOdd = amount
                    : obj.getSelectedPanel == 6 ? obj.setAmountBoll1SmallLarge = amount
                    : obj.getSelectedPanel == 7 ? obj.setAmountBoll2SmallLarge = amount
                    : obj.getSelectedPanel == 8 ? obj.setAmountBoll3SmallLarge = amount
                    : obj.getSelectedPanel == 9 ? obj.setAmountBoll4SmallLarge = amount
                    : obj.setAmountBoll5SmallLarge = amount;
              },
              child: SizedBox(
                width: appWidth(context) * .09,
                child: Center(
                    child: Icon(
                  Icons.remove,
                  size: 20,
                  color: Colors.yellowAccent,
                )),
              ),
            ),
            SizedBox(
              width: appWidth(context) * .2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    numberFormat.format(obj.getTotalBalance),
                    style: TextStyle(
                        color: Colors.white, fontSize: appWidth(context) * .04),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () async{
                int amount=await Provider.of<BetViewModel>(context, listen: false)
                    .setIncrementTotalAmount(10);
                obj.getSelectedPanel == 1 ? obj.setAmountBoll1EvenOdd = amount
                    : obj.getSelectedPanel == 2 ? obj.setAmountBoll2EvenOdd = amount
                    : obj.getSelectedPanel == 3 ? obj.setAmountBoll3EvenOdd = amount
                    : obj.getSelectedPanel == 4 ? obj.setAmountBoll4EvenOdd = amount
                    : obj.getSelectedPanel == 5 ? obj.setAmountBoll5EvenOdd = amount
                    : obj.getSelectedPanel == 6 ? obj.setAmountBoll1SmallLarge = amount
                    : obj.getSelectedPanel == 7 ? obj.setAmountBoll2SmallLarge = amount
                    : obj.getSelectedPanel == 8 ? obj.setAmountBoll3SmallLarge = amount
                    : obj.getSelectedPanel == 9 ? obj.setAmountBoll4SmallLarge = amount
                    : obj.setAmountBoll5SmallLarge = amount;
              },
              child: SizedBox(
                width: appWidth(context) * .09,
                child: Center(
                    child: Icon(
                  Icons.add,
                  size: 20,
                  color: Colors.yellowAccent,
                )),
              ),
            ),
          ],
        );
      }),
    );
  }
}
