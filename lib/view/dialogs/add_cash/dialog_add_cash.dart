import 'package:flutter/material.dart';
import 'package:ows_roller_app/model/audio_player/custom_audio.dart';
import 'package:ows_roller_app/view/app_config/local/components.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'add_cash.dart';
class DialogAddCash {
  static show(BuildContext context,themeViewModel,backGroundColor) {
    CustomAudio.playAssetPush(context);
    return showDialog(
        context: context,
        builder: (_) => Center(
          child: Container(
            height: appHeight(context) * .6,
            width: appWidth(context) * .9,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: .5),
                borderRadius:
                BorderRadius.only(topLeft: Radius.circular(0)),
                color: backGroundColor),
            child: Column(
              children: [
                Container(
                  height: appHeight(context) * .05,
                  width: appWidth(context) * .9,
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(0)),
                    image: DecorationImage(
                      image: AssetImage("assets/bg/black1.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        SizedBox(width: appWidth(context) * .3),
                        GlowText(
                          glowColor: Colors.yellowAccent,
                          'Add Cash',
                          style:
                          TextStyle(fontSize: 22, color: Colors.white),
                        ),
                        Spacer(),
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.clear,
                              color: Colors.white,
                              size: 30,
                            )),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: appHeight(context) * .01,
                ),
                AddCash()
              ],
            ),
          ),
        ));
  }
}
