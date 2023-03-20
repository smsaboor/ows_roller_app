import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ows_roller_app/model/audio_player/custom_audio.dart';
import 'package:ows_roller_app/view/app_config/local/components.dart';
import 'main_otp_verification.dart';

class StackOtpVerification extends StatelessWidget {
  const StackOtpVerification(
      {Key? key,
      required this.otp,
      required this.userStatus,
      required this.number})
      : super(key: key);
  final otp, number;
  final userStatus;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              height: appHeight(context) * .05,
            ),
            MainOtpVerification(
              otp: otp,
              number: number,
              userStatus:userStatus
            )
          ],
        ),
        Positioned(
            top: appHeight(context) * .014,
            left: appWidth(context) * .525,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () async{
                  CustomAudio.playAssetPop(context);
                  Navigator.pop(context);
                },
                child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.yellowAccent,
                      shape: BoxShape.circle,
                    ),
                    height: appWidth(context) * .045,
                    width: appWidth(context) * .045,
                    child: const Center(
                      child: FaIcon(
                        FontAwesomeIcons.xmark,
                        color: Colors.indigo,
                        size: 19,
                      ),
                    )),
              ),
            )),
        Positioned(
          top: appHeight(context) * .01,
          left: appWidth(context) * .12,
          child: Container(
            height: appHeight(context) * .1,
            width: appWidth(context) * .3,
            decoration: BoxDecoration(
              color: Colors.yellowAccent,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: Colors.yellowAccent, width: 2.0),
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/img_1.png')),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 25,
                    width: 25,
                    child: Center(
                        child: Icon(
                      Icons.phone_android,
                      size: 24,
                      color: Colors.white,
                    )),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Enter your OTP $otp',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
