import 'package:flutter/material.dart';
import 'package:ows_roller_app/model/audio_player/custom_audio.dart';
import 'package:ows_roller_app/view/app_config/local/components.dart';
import 'package:ows_roller_app/view_model/setting_view_model.dart';
import 'package:provider/provider.dart';

class LeftIndex extends StatelessWidget {
  LeftIndex({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: appHeight(context) * .785,
      width: appWidth(context) * .2,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage('assets/bg/img_11.png'))),
      child: Consumer<SettingViewModel>(builder: (context, obj, child) {
        return Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  CustomAudio.playAssetOnTap(context);
                  obj.setAccountIndex=1;
                },
                child: Container(
                  height: appHeight(context) * .15,
                  width: appWidth(context) * .24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: obj.accountButtonIndex == 1 ? Colors.white70 : null,
                  ),
                  child: Center(
                    child: Text(
                      'Profile',
                      style: TextStyle(
                          color:
                          obj.accountButtonIndex == 1 ? Colors.black : Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: .5,
            ),

            Material(
              color: Colors.transparent,
              child: InkWell(
              onTap: () {
                CustomAudio.playAssetOnTap(context);
                obj.setAccountIndex=2;
              },
              child: Container(
                height: appHeight(context) * .15,
                width: appWidth(context) * .24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: obj.accountButtonIndex
                      == 2 ? Colors.white70 : null,
                ),
                child: Center(
                  child: Text(
                    'Transaction History',
                    style: TextStyle(
                        color:
                        obj.accountButtonIndex == 2 ? Colors.black : Colors.white),
                  ),
                ),
              ),
            ),),
            SizedBox(
              height: .5,
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
              onTap: () {
                CustomAudio.playAssetOnTap(context);
                obj.setAccountIndex=3;
              },
              child: Container(
                height: appHeight(context) * .15,
                width: appWidth(context) * .24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: obj.accountButtonIndex == 3 ? Colors.white70 : null,
                ),
                child: Center(
                  child: Text(
                    'Game History',
                    style: TextStyle(
                        color:
                        obj.accountButtonIndex == 3 ? Colors.black : Colors.white),
                  ),
                ),
              ),
            ),)
          ],
        );
      }),
    );
  }
}
