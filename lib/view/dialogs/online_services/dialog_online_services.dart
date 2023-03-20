import 'package:flutter/material.dart';
import 'package:ows_roller_app/model/audio_player/custom_audio.dart';
import 'package:ows_roller_app/view/app_config/local/components.dart';
import 'stack_online_services.dart';

class DialogOnlineServices {
  static show(BuildContext context) {
    CustomAudio.playAssetPush(context);
    return showDialog(
        context: context,
        builder: (_) => Center(
          child: Container(
            height: appHeight(context) * .8,
            width: appWidth(context) * .7,
            child:StackOnlineServices(),
          ),
        ));
  }
}
