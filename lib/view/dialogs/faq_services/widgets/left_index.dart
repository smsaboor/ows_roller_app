import 'package:flutter/material.dart';
import 'package:ows_roller_app/model/audio_player/custom_audio.dart';
import 'package:ows_roller_app/view/app_config/local/components.dart';
import 'package:ows_roller_app/view_model/setting_view_model.dart';
import 'package:provider/provider.dart';

class LeftIndex extends StatelessWidget {
  const LeftIndex({Key? key}) : super(key: key);

 final int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: appHeight(context) * .785,
      width: appWidth(context) * .2,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
        topRight: Radius.circular(10),
        bottomRight: Radius.circular(10),
      )),
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
                  obj.setTabIndex(1);
                  CustomAudio.playAssetOnTap(context);
                },
                child: Container(
                  height: appHeight(context) * .15,
                  width: appWidth(context) * .24,
                  decoration: BoxDecoration(
                      color: obj.selectedTabsIndex == 1 ? Colors.white70 : null,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Text(
                      'How Use this Game',
                      style: TextStyle(
                          color: obj.selectedTabsIndex == 1
                              ? Colors.black
                              : Colors.white),
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
                  obj.setTabIndex(2);
                },
                child: Container(
                  height: appHeight(context) * .15,
                  width: appWidth(context) * .24,
                  decoration: BoxDecoration(
                      color: obj.selectedTabsIndex == 2 ? Colors.white70 : null,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Text(
                      'Deposit',
                      style: TextStyle(
                          color: obj.selectedTabsIndex == 2
                              ? Colors.black
                              : Colors.white),
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
                  obj.setTabIndex(3);
                },
                child: Container(
                  height: appHeight(context) * .15,
                  width: appWidth(context) * .24,
                  decoration: BoxDecoration(
                      color: obj.selectedTabsIndex == 3 ? Colors.white70 : null,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Text(
                      'Withdraw',
                      style: TextStyle(
                          color: obj.selectedTabsIndex == 3
                              ? Colors.black
                              : Colors.white),
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
                  obj.setTabIndex(4);
                },
                child: Container(
                  height: appHeight(context) * .15,
                  width: appWidth(context) * .24,
                  decoration: BoxDecoration(
                      color: obj.selectedTabsIndex == 4 ? Colors.white70 : null,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Text(
                      'Contact Us',
                      style: TextStyle(
                          color: obj.selectedTabsIndex == 4
                              ? Colors.black
                              : Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
