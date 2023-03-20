import 'package:flutter/material.dart';
import 'package:ows_roller_app/view/app_config/local/components.dart';
import 'dart:ui';
import 'package:ows_roller_app/view_model/local_view_model.dart';
import 'package:ows_roller_app/model/model/model_user.dart';
import 'package:provider/provider.dart';
import 'package:ows_roller_app/view/theme/resources/themes/theme_view_model.dart';
import 'package:ows_roller_app/view/dialogs/user_account/profile/dialog_update_profile.dart';
import 'package:ows_roller_app/view/dialogs/add_cash/dialog_add_cash.dart';

class AppBarBlackBull extends StatefulWidget {
  const AppBarBlackBull({Key? key}) : super(key: key);

  @override
  State<AppBarBlackBull> createState() => _AppBarBlackBullState();
}

class _AppBarBlackBullState extends State<AppBarBlackBull> {
  List<String> assetList = [
    'a1',
    'a2',
    'a3',
    'a4',
    'a5',
    'a6',
    'a7',
    'a8',
    'a9'
  ];
  late final AppUser appUser;
  bool flagUserData = true;

  getUserDetails() async {
    print('-----getUserDetails------------------');
    var sharedPreferencesVM =
        Provider.of<SharedPreferencesVM>(context, listen: false);
    print('-----getUserDetails------------------');
    appUser = await sharedPreferencesVM.getUserDetails();
    print('-----getUserDetails-------------------${appUser}');
    setState(() {
      flagUserData = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    final themeViewModel = context.watch<ThemeViewModel>();
    final baseTextTheme = themeViewModel.baseTextTheme;
    final onPrimaryColor = themeViewModel.colors.colorScheme.onPrimary;
    final backGroundColor = themeViewModel.colors.colorScheme.primary;
    return Container(
      color: backGroundColor,
      width: appWidth(context),
      height: appHeight(context) * .12,
      child: Consumer<SharedPreferencesVM>(builder: (context, obj, child) {
        return Column(
          children: [
            SizedBox(
              height: appHeight(context) * .05,
            ),
            flagUserData
                ? SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: EdgeInsets.only(
                        top: appHeight(context) * .01,
                        bottom: appHeight(context) * .01,
                        left: appWidth(context) * .05,
                        right: appWidth(context) * .05),
                    child: SizedBox(
                        height: appHeight(context) * .05,
                        width: appWidth(context),
                        child: Row(
                          children: [
                            SizedBox(
                              width: appWidth(context) * .55,
                              child: InkWell(
                                onTap: () {
                                  DialogUpdateProfile.show(
                                      context, themeViewModel, backGroundColor);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: appHeight(context) * .04,
                                      width: appHeight(context) * .04,
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        child: Image.asset(
                                          obj.userDetails.image,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        obj.userDetails.name,
                                        style: baseTextTheme.headline6!
                                            .copyWith(
                                                color: onPrimaryColor,
                                                fontSize: 16),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            obj.userDetails.userType == "guest"
                                ? Container(
                                    width: appWidth(context) * .35,
                                    color: Colors.black12,
                                    padding: EdgeInsets.all(5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/icon/coin.webp',
                                          fit: BoxFit.fitHeight,
                                          scale: 10,
                                        ),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Text(
                                          '₹150000',
                                          style: baseTextTheme.headline6!
                                              .copyWith(
                                                  color: onPrimaryColor,
                                                  fontSize: 12),
                                        ),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            DialogAddCash.show(
                                                context,
                                                themeViewModel,
                                                backGroundColor);
                                          },
                                          child: Container(
                                              child: Icon(
                                            Icons.add,
                                            size: 25,
                                            color: Colors.orange,
                                          )),
                                        ),
                                      ],
                                    ),
                                  )
                                : Container(),
                          ],
                        )),
                  ),
          ],
        );
      }),
    );
  }
}
