import 'package:flutter/material.dart';
import 'package:ows_roller_app/model/model/model_game.dart';
import 'package:ows_roller_app/view/app_config/local/components.dart';
import 'package:ows_roller_app/view_model/bet_view_model.dart';
import 'package:provider/provider.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class StackSlotId extends StatelessWidget {
  const StackSlotId(
      {Key? key,
      required this.bgColor,
      required this.timer,
      required this.header,
        required this.data,
        required this.height
      })
      : super(key: key);
  final bgColor;
  final timer;
  final ModelGame data;
  final header;
  final height;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: height*.5,
          width: appWidth(context) * .23,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5),
                topLeft: Radius.circular(5),
              ),
              border: Border.all(color: Colors.yellowAccent, width: .5),
              color: bgColor),
          child: Consumer<BetViewModel>(builder: (context, obj, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  header,
                  style: TextStyle(
                      fontSize: 26,
                      fontFamily: 'Helvetica',
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 5,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      header == '1'
                          ? 'Hour'
                          : 'Minute',
                      style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Game',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            );
          }),
        ),
        Container(
          height: height*.25,
          width: appWidth(context) * .23,
          decoration: BoxDecoration(
              border: Border.all(color: bgColor, width: .8),
              color: Colors.white),
          child: Center(
              child: Consumer<BetViewModel>(builder: (context, obj, child) {
            return Text(
              'S.No: ${data.slotId}',
              style: TextStyle(
                  fontSize: 10,
                  fontFamily: 'Helvetica',
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            );
          })),
        ),
        Container(
          height: height*.25,
          width: appWidth(context) * .23,
          decoration: BoxDecoration(
              border: Border.all(color: bgColor, width: .8),
              color: Colors.white),
          child: Container(
            child: Center(
              child: StreamBuilder<int>(
                stream: timer.rawTime,
                initialData: 0,
                builder: (context, snap) {
                  final value = snap.data;
                  final displayTime = StopWatchTimer.getDisplayTime(value!);
                  return Text(
                    displayTime.toString().substring(3),
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.red,
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.bold),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
