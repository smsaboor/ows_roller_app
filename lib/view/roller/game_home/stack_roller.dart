import 'package:flutter/material.dart';
import 'package:ows_roller_app/view/app_config/local/components.dart';
import 'package:ows_roller_app/view/roller/game_home/roller.dart';
import 'package:ows_roller_app/view/roller/widget/config.dart';
import 'package:ows_roller_app/view_model/bet_view_model.dart';
import 'package:ows_roller_app/view_model/roller_view_model.dart';
import 'package:provider/provider.dart';


class StackRoller extends StatelessWidget {
  StackRoller(
      {Key? key, required this.minute, required this.data, required this.timer,required this.bgColor})
      : super(key: key);
  final minute;
  final data;
  final timer;
  final bgColor;
  final WheelConfig wheelConfig = WheelConfig();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5)),
      ),
      child: Consumer<RollerViewModel>(
          builder: (contextRoller, objRoller, child) {
        return Consumer<BetViewModel>(builder: (contextBet, objBet, child) {
          print(
              'Consumen: ${objRoller.valueJumpForC1} ::: ${objBet.getNumberBoll1EvenOdd}');
          return Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                color: Colors.transparent,
                child: Stack(
                  children: [
                    GameRoller(
                      bgColor:bgColor,
                      minute: minute,
                    ),
                    Positioned(
                        child: Container(
                      height: 80,
                      width: appWidth(context) * .7,
                      color: Colors.transparent,
                    ))
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          );
        });
      }),
    );
  }
}
