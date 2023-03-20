import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ows_roller_app/model/audio_player/custom_audio.dart';
import 'package:ows_roller_app/view/app_config/local/components.dart';
import 'main_online_services.dart';

class StackOnlineServices extends StatelessWidget {
  const StackOnlineServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              height: appHeight(context) * .05,
            ),
            MainOnlineServices()
          ],
        ),
        Positioned(
            top: appHeight(context) * .014,
            left: appWidth(context) * .626,
            child: Material(
              color: Colors.transparent,
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
          left: appWidth(context) * .175,
          child:  Container(
          height: appHeight(context) * .1,
          width: appWidth(context) * .3,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.white, width: 1.0),
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage('assets/images/img_1.png')),
          ),
          child: Center(child: Text('Online Services',
          style: TextStyle(fontSize: 18,color: Colors.white, decoration: TextDecoration.none),
          ))
        ),)
      ],
    );
  }
}
