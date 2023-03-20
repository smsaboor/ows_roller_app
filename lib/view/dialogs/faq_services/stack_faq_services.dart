import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ows_roller_app/model/audio_player/custom_audio.dart';
import 'package:ows_roller_app/view/app_config/local/components.dart';
import 'package:ows_roller_app/view_model/setting_view_model.dart';
import 'package:provider/provider.dart';
import 'main_faq_services.dart';

class StackFaqServices extends StatefulWidget {
  const StackFaqServices({Key? key}) : super(key: key);

  @override
  State<StackFaqServices> createState() => _StackFaqServicesState();
}

class _StackFaqServicesState extends State<StackFaqServices> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              height: appHeight(context) * .05,
            ),
            MainFaqServices()
          ],
        ),
        Positioned(
            top: appHeight(context) * .015,
            left: appWidth(context) * .73,
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
                    height: appWidth(context) * .04,
                    width: appWidth(context) * .04,
                    child: const Center(
                      child: FaIcon(
                        FontAwesomeIcons.xmark,
                        color: Colors.indigo,
                        size: 15,
                      ),
                    )),
              ),
            ))
      ],
    );
  }
}
