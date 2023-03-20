import 'package:flutter/material.dart';
import 'package:ows_roller_app/view/app_config/local/components.dart';
import 'package:ows_roller_app/view_model/bet_view_model.dart';
import 'package:provider/provider.dart';
import 'chart/chart_title.dart';
import 'chart/chart_row.dart';
import 'chart/total_amount.dart';

class StackBetChart extends StatelessWidget {
  StackBetChart({Key? key, required this.bgColor, required this.height})
      : super(key: key);
  final bgColor;
  final height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (_) => Center(
                  child: Container(
                    height: appHeight(context) * .5,
                    width: appWidth(context) * .9,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: .5),
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(0)),
                        color: bgColor),
                    child:
                        Consumer<BetViewModel>(builder: (context, obj, child) {
                      return Column(
                        children: [
                          Container(
                            height: appHeight(context) * .05,
                            width: appWidth(context) * .9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(0)),
                              image: DecorationImage(
                                image: AssetImage("assets/bg/black1.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Center(
                              child: Row(
                                children: [
                                  SizedBox(width: appWidth(context) * .3),
                                  Text(
                                    'Bet Chart',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.pop(context);
                                    },
                                    child: Icon(Icons.clear,color: Colors.white,size: 30,)
                                  ),
                                  SizedBox(width: 10,)
                                ],
                              ),
                            ),
                          ),
                          ChartTitle(
                            height: appHeight(context) * .05,
                            bgColor: bgColor,
                            width: appWidth(context) * .9,
                            fontSize: appWidth(context) * .04,
                            cellWidth: appWidth(context) * .22,
                          ),
                          Container(
                            color: Colors.black45,
                            height: .5,
                          ),
                          ChartRow(
                            height: appHeight(context) * .3,
                            obj: obj,
                            cellWidth: appWidth(context) * .22,
                            width: appWidth(context) * .9,
                            fontSize: appWidth(context) * .04,
                          ),
                          TotalAmount(
                              fontSize: appHeight(context) * .025,
                              height: appHeight(context) * .08,
                              obj: obj),
                          // CharWallet(
                          //   height: appWidth(context) * .025,
                          //   obj: obj,
                          // ),
                          // CharGameId(
                          //     height: appWidth(context) * .02,
                          //     obj: obj,
                          //     gameId: obj.getBetId)
                        ],
                      );
                    }),
                  ),
                ));
      },
      child: Container(
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
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(0)),
                  image: DecorationImage(
                    image: AssetImage("assets/bg/black1.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Bet Chart',
                    style: TextStyle(color: Colors.white, fontSize: 11),
                  ),
                ),
              ),
              ChartTitle(
                height: height * .16,
                bgColor: bgColor,
                width: appWidth(context) * .4,
                fontSize: appWidth(context) * .02,
                cellWidth: appWidth(context) * .11,
              ),
              Container(
                color: Colors.black45,
                height: .5,
              ),
              ChartRow(
                height: height * .52,
                obj: obj,
                cellWidth: appWidth(context) * .11,
                width: appWidth(context) * .4,
                fontSize: appWidth(context) * .02,
              ),
              TotalAmount(
                  fontSize: appHeight(context) * .01,
                  height: height * .14, obj: obj),
              // CharWallet(
              //   height: appWidth(context) * .025,
              //   obj: obj,
              // ),
              // CharGameId(
              //     height: appWidth(context) * .02,
              //     obj: obj,
              //     gameId: obj.getBetId)
            ],
          );
        }),
      ),
    );
  }
}
