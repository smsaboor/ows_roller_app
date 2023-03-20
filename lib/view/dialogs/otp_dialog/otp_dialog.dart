import 'package:flutter/material.dart';
import 'package:ows_roller_app/model/audio_player/custom_audio.dart';
import 'package:ows_roller_app/view/app_config/local/components.dart';
import 'stack_otp_verification.dart';

class DialogOtpVerification {
  static show(BuildContext context,otp,number,userStatus) {
    CustomAudio.playAssetPush(context);
    return showDialog(
        context: context,
        builder: (_) => Center(
          child: Container(
            height: appHeight(context) * .7,
            width: appWidth(context) * .6,
            child:StackOtpVerification(otp:otp,number: number,userStatus:userStatus),
          ),
        ));
  }
}