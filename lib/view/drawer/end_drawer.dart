import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package1/components.dart';
import 'package:ows_roller_app/view/app_config/local/components.dart';
import 'package:ows_roller_app/view/login/login.dart';
import 'package:ows_roller_app/view/theme/resources/themes/theme_view_model.dart';
import 'package:ows_roller_app/view_model/roller_view_model.dart';
import 'package:ows_roller_app/view_model/setting_view_model.dart';
import 'package:provider/provider.dart';

class EndDrawer extends StatelessWidget {
  int currentPage = 0;
  bool flagOnOffSound = true;
  bool flagOnOffMusic = false;
  bool flagOnOffVibration = true;
  late RollerViewModel provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<RollerViewModel>(context, listen: false);
    final themeViewModel = context.watch<ThemeViewModel>();
    final onPrimaryColor = themeViewModel.colors.colorScheme.onPrimary;
    return Padding(
      padding: EdgeInsets.only(
          top: appHeight(context) * .2, bottom: appHeight(context) * .2),
      child: Container(
        height: appHeight(context) * .55,
        width: appWidth(context) * .45,
        decoration: BoxDecoration(color: Colors.white),
        child: Consumer<SettingViewModel>(builder: (context, obj, child) {
          return Column(
            children: [
              Container(
                height: appHeight(context) * .1,
                decoration: BoxDecoration(
                    color: themeViewModel.colors.colorScheme.primary),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.settings,
                      size: 28,
                      color: onPrimaryColor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Setting',
                      style: TextStyle(
                          fontSize: 20,
                          color: onPrimaryColor,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              // Container(
              //   height: appHeight(context) * .1,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //       SizedBox(
              //         width: 30,
              //       ),
              //       Text('Sound',style: TextStyle(color: Colors.black,fontSize: 18),),
              //       Spacer(),
              //       SizedBox(
              //         height: 20,
              //         child: CupertinoSwitch(
              //           value: obj.flagMobileSoundOn!,
              //           trackColor: Colors.grey,
              //           activeColor: Colors.green,
              //           onChanged: (value) {
              //             if(obj.flagMobileSoundOn!){
              //               obj.setSoundOnOff=false;
              //             }else{
              //               obj.setSoundOnOff=true;
              //             }
              //           },
              //         ),
              //       ),
              //       SizedBox(
              //         width: 15,
              //       ),
              //     ],
              //   ),
              // ),
              Container(
                height: appHeight(context) * .1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Music',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Spacer(),
                    SizedBox(
                      height: 20,
                      child: CupertinoSwitch(
                        value: flagOnOffMusic,
                        trackColor: Colors.grey,
                        activeColor: Colors.green,
                        onChanged: (value) {
                          flagOnOffMusic = !flagOnOffMusic;
                        },
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ),
              Container(
                height: appHeight(context) * .1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Vibration',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    Spacer(),
                    SizedBox(
                      height: 16,
                      child: CupertinoSwitch(
                        value: obj.flagMobileVibrationOn,
                        trackColor: Colors.grey,
                        activeColor: Colors.green,
                        onChanged: (value) {
                          if (obj.flagMobileVibrationOn) {
                            obj.setMobileVibrationOnOff = false;
                          } else {
                            obj.setMobileVibrationOnOff = true;
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: appHeight(context) * .02,
              ),
              Container(
                height: appHeight(context) * .1,
                width: appWidth(context) * .35,
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    onPressed: () {
                      navigateAndFinsh(context, LoginScreen());
                    },
                    child: Text('  Logout '),
                  ),
                ),
              ),
              Container(
                height: appHeight(context) * .1,
                width: appWidth(context) * .35,
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pinkAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: 15.0,
                    ),
                    onPressed: () {
                      exit(0);
                    },
                    child: Text('Exit Game'),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
