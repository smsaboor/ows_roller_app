import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ows_roller_app/view_model/setting_view_model.dart';
import 'package:provider/provider.dart';

class Setting extends StatelessWidget {
  Setting({Key? key}) : super(key: key);
  late double boxHeight;

  @override
  Widget build(BuildContext context) {
    boxHeight=MediaQuery.of(context).size.height * .1;
    return Padding(
      padding: EdgeInsets.only(
          right: 20,
          top: 50.0,
          bottom: MediaQuery.of(context).size.height * .4),
      child: Consumer<SettingViewModel>(builder: (context, obj, child) {
        return Drawer(
          width: 160,
          elevation: 16.0,
          child: Container(
            alignment: Alignment.topRight,
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 10,bottom: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: boxHeight,
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          if (obj.getFlagMobileSoundOn!) {
                            obj.setSoundOnOff = false;
                            obj.stopPlayer(context);
                          } else {
                            obj.setSoundOnOff = true;
                            obj.startPlayer(context);
                          }
                        },
                        child: Row(
                          children: [
                            Icon(
                              obj.getFlagMobileSoundOn!
                                  ? Icons.audiotrack_rounded
                                  : Icons.audio_file_outlined,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Sound',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: boxHeight,
                    child: InkWell(
                      onTap: () {
                        if (obj.getFlagMobileVibrationOn) {
                          obj.stopVibration();
                          obj.setMobileVibrationOnOff = false;
                        } else {
                          obj.starVibration();
                          obj.setMobileVibrationOnOff = true;
                        }
                      },
                      child: Row(
                        children: [
                          Icon(
                            obj.getFlagMobileVibrationOn
                                ? Icons.vibration
                                : Icons.vaccines_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Vibration',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: boxHeight,
                    child: Center(
                      child: Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Account',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: boxHeight,
                    child: InkWell(
                      onTap: () {
                        exit(0);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.exit_to_app_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Exit App',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
