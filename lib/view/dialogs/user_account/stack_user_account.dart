import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ows_roller_app/model/audio_player/custom_audio.dart';
import 'package:ows_roller_app/view/app_config/local/components.dart';
import 'main_container.dart';

class StackUserAccount extends StatelessWidget {
  const StackUserAccount({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              height: appHeight(context) * .05,
            ),
            MainContainer()
          ],
        ),
        Positioned(
            top: appHeight(context) * .015,
            left: appWidth(context) * .73,
            child: Material(
              color: Colors.transparent,
              clipBehavior: Clip.none,
              child: InkWell(
                onTap: () async{
                  CustomAudio.playAssetPop(context);
                  Navigator.pop(context);
                },
                child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    height: appWidth(context) * .04,
                    width: appWidth(context) * .04,
                    child: const Center(
                      child: FaIcon(
                        FontAwesomeIcons.xmark,
                        color: Colors.indigo,
                        size: 18,
                      ),
                    )),
              ),
            ))
      ],
    );
  }
}
