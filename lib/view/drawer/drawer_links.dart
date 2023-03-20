import 'package:flutter/material.dart';
import 'package:flutter_package1/components.dart';
import 'package:ows_roller_app/model/audio_player/custom_audio.dart';
import 'package:ows_roller_app/view/login/login.dart';
import 'package:ows_roller_app/view/theme/resources/themes/theme_view_model.dart';
import 'package:ows_roller_app/view_model/local_view_model.dart';
import 'package:provider/provider.dart';

class DrawerLinks extends StatelessWidget {
  final String? title;
  final Widget? icon;
  final bool isLogout;
  final Widget onTapWidget;

  const DrawerLinks(
      {super.key,
      required this.title,
      required this.icon,
      required this.isLogout,
      required this.onTapWidget});

  @override
  Widget build(BuildContext context) {
    final themeViewModel = context.watch<ThemeViewModel>();
    return GestureDetector(
      onTap: () {
        CustomAudio.playAssetPush(context);
        if(isLogout == true){
          var sharedPreferencesVM =
          Provider.of<SharedPreferencesVM>(context,
              listen: false);
          sharedPreferencesVM.setLoginStatus(false);
          navigateAndFinsh(context, LoginScreen());
        }else{
          navigateTo(context, onTapWidget);
        }
      },
      child: Container(
          height: 45,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/image_10.png'))),
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: icon,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        title!,
                        style: themeViewModel.primaryTextTheme.caption,
                      )),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const Divider(
                color: Colors.yellowAccent,
              )
            ],
          )),
    );
  }
}
