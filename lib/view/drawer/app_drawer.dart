import 'package:flutter/material.dart';
import 'package:flutter_package1/components.dart';
import 'package:ows_roller_app/model/audio_player/custom_audio.dart';
import 'package:ows_roller_app/view/app_config/local/components.dart';
import 'package:ows_roller_app/view/app_config/local/custom_scaffold.dart';
import 'package:ows_roller_app/view/dialogs/user_account/profile/dialog_update_profile.dart';
import 'package:ows_roller_app/view/drawer/drawer_links.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ows_roller_app/view/theme/resources/themes/theme_view_model.dart';
import 'package:ows_roller_app/view_model/local_view_model.dart';
import 'package:provider/provider.dart';
import 'package:ows_roller_app/view/theme/widgets/company_selection.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key,required this.scaffoldKey}) : super(key: key);
  final scaffoldKey;
  final int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final themeViewModel = context.watch<ThemeViewModel>();
    final shapes = themeViewModel.shapes;
    final onPrimaryColor = themeViewModel.colors.colorScheme.onPrimary;
    final baseTextTheme = themeViewModel.baseTextTheme;
    final backGroundColor = themeViewModel.colors.colorScheme.primary;
    return Material(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Container(
          decoration: BoxDecoration(color: themeViewModel.colors.colorScheme.primary),
          height: appHeight(context),
          width: appWidth(context) * .75,
          child: Column(
            children: [
              SizedBox(height: appHeight(context) * .1),
              SizedBox(
                height: appHeight(context) * .06,
                width: appWidth(context) * .7,
                child: Stack(
                  children: [
                    SizedBox(
                      height: appHeight(context) * .06,
                      width: appWidth(context) * .7,
                    ),
                    Positioned(
                        top: 3,
                        left: 20,
                        child: Consumer<SharedPreferencesVM>(
                            builder: (context, objSP, child) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: appHeight(context) * .05,
                                width: appHeight(context) * .05,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: Image.asset(
                                    objSP.userDetails.image,
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
                                  objSP.userDetails.name,
                                  style: baseTextTheme.headline6!.copyWith(
                                      color: onPrimaryColor, fontSize: 18),
                                ),
                              )
                            ],
                          );
                        }))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(
                  height: appHeight(context) * .8,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 50),
                        InkWell(
                          onTap: () async {
                            CustomAudio.playAssetPush(context);
                            Navigator.pop(context);
                            DialogUpdateProfile.show(
                                scaffoldKey.currentContext, themeViewModel, backGroundColor);
                          },
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 15.0),
                                    child: FaIcon(
                                      FontAwesomeIcons.userShield,
                                      color: onPrimaryColor,
                                      size: 17,
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(left: 12.0),
                                      child: Text(
                                        'My Profile',
                                        style: themeViewModel
                                            .primaryTextTheme.caption,
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
                          ),
                        ),
                        // DrawerLinks(
                        //   icon: FaIcon(
                        //     FontAwesomeIcons.tableList,
                        //     color: onPrimaryColor,
                        //     size: 17,
                        //   ),
                        //   isLogout: false,
                        //   onTapWidget: CustomScaffold(title: 'Bonus Summary'),
                        //   title: "Bonus Summary",
                        // ),
                        DrawerLinks(
                          icon: FaIcon(
                            FontAwesomeIcons.wallet,
                            color: onPrimaryColor,
                            size: 17,
                          ),
                          isLogout: false,
                          onTapWidget: CustomScaffold(title: 'Withdraw Cash'),
                          title: "Withdraw Cash",
                        ),
                        DrawerLinks(
                          icon: FaIcon(
                            FontAwesomeIcons.moneyBillTransfer,
                            color: onPrimaryColor,
                            size: 17,
                          ),
                          isLogout: false,
                          onTapWidget:
                              CustomScaffold(title: 'Withdraw history'),
                          title: "Withdrawal history",
                        ),
                        DrawerLinks(
                          icon: FaIcon(
                            FontAwesomeIcons.history,
                            color: onPrimaryColor,
                            size: 17,
                          ),
                          isLogout: false,
                          onTapWidget: CustomScaffold(title: 'My Transaction'),
                          title: "My Transaction",
                        ),
                        // DrawerLinks(
                        //   icon: FaIcon(
                        //     FontAwesomeIcons.microphone,
                        //     color: onPrimaryColor,
                        //     size: 17,
                        //   ),
                        //   isLogout: false,
                        //   onTapWidget: CustomScaffold(title: 'Promotions'),
                        //   title: "Promotions",
                        // ),
                        DrawerLinks(
                          icon: FaIcon(
                            FontAwesomeIcons.bookOpenReader,
                            color: onPrimaryColor,
                            size: 17,
                          ),
                          isLogout: false,
                          onTapWidget:
                              CustomScaffold(title: 'Learn roller(app)'),
                          title: "learn Black Bull(App)",
                        ),
                        DrawerLinks(
                          icon: FaIcon(
                            FontAwesomeIcons.circleInfo,
                            color: onPrimaryColor,
                            size: 17,
                          ),
                          isLogout: false,
                          onTapWidget: CustomScaffold(title: 'Help & support'),
                          title: "Help & support",
                        ),
                        // DrawerLinks(
                        //   icon: FaIcon(
                        //     FontAwesomeIcons.arrowUpFromBracket,
                        //     color: onPrimaryColor,
                        //     size: 17,
                        //   ),
                        //   isLogout: false,
                        //   onTapWidget: CustomScaffold(title: 'Upgrade app'),
                        //   title: "Upgrade app",
                        // ),
                        DrawerLinks(
                          icon: FaIcon(
                            FontAwesomeIcons.fileCircleQuestion,
                            color: onPrimaryColor,
                            size: 15,
                          ),
                          isLogout: false,
                          onTapWidget:
                              CustomScaffold(title: 'Term & conditions'),
                          title: "Term & conditions",
                        ),
                        DrawerLinks(
                          icon: FaIcon(
                            FontAwesomeIcons.arrowRightFromBracket,
                            color: onPrimaryColor,
                            size: 17,
                          ),
                          isLogout: true,
                          onTapWidget: Scaffold(),
                          title: "Logout",
                        ),
                        SizedBox(
                          height: appHeight(context) * .2,
                        ),
                        CompanySelection(
                          toggleButtonShapeBorder:
                              shapes.toggleButtonShapeBorder,
                          onCompanySelected: (companyName) =>
                              themeViewModel.updateCompany(companyName),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
