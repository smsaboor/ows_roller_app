import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ows_roller_app/view/app_config/local/components.dart';
import 'package:ows_roller_app/view/drawer/app_drawer.dart';
import 'package:ows_roller_app/view/drawer/end_drawer.dart';
import 'package:ows_roller_app/view/theme/widgets/contained_input_chip.dart';
import 'package:ows_roller_app/model/model/model_user.dart';
import 'package:provider/provider.dart';
import 'package:ows_roller_app/view/theme/resources/themes/theme_view_model.dart';
import 'package:ows_roller_app/view/theme/resources/dimens/app_dimens.dart';
import 'package:ows_roller_app/view/theme/widgets/theme_switch_bottom_app_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'app_bar.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Uri _url = Uri.parse('https://google.com');
  final clickCounterNotifier = ValueNotifier(0);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  late List<MaterialColor> supplementaryColors;
  double textFieldHeight = 35.0;
  final flutterColor = Color(0xFF40D0FD);
  late final AppUser appUser;
  bool flagUserData = true;
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeViewModel = context.watch<ThemeViewModel>();
    final baseTextTheme = themeViewModel.baseTextTheme;
    final onPrimaryColor = themeViewModel.colors.colorScheme.onPrimary;
    final backGroundColor = themeViewModel.colors.colorScheme.primary;
    final brightness = themeViewModel.brightness;
    final shapes = themeViewModel.shapes;
    final icons = themeViewModel.icons;
    final companyColors = themeViewModel.colors;
    final textFieldWidth = appWidth(context) * .75;
    supplementaryColors = companyColors.supplementaryAccentColors;
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(scaffoldKey:_scaffoldKey),
      endDrawer: EndDrawer(),
      bottomNavigationBar: ThemeSwitchBottomAppBar(
          icons: icons,
          onPrimaryColor: onPrimaryColor,
          scaffoldKey: _scaffoldKey,
          brightness: brightness,
          themeViewModel: themeViewModel),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AppBarBlackBull(),
            SizedBox(height: AppDimens.SIZE_SPACING_LARGE),
            // ClickCounter(
            //   clickCounterNotifier: clickCounterNotifier,
            //   textStyle: themeViewModel.baseTextTheme.headline4!,
            //   alertLevels: themeViewModel.colors.alertLevels,
            // ),
            SizedBox(height: appHeight(context) * .1),
            Divider(),
            SizedBox(
                height: appHeight(context) * .35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Wrap(
                        spacing: AppDimens.SIZE_SPACING_MEDIUM,
                        direction: Axis.vertical,
                        children: [
                          Row(
                            children: [
                              ContainedInputChip(
                                  labelText: '3 Minute\nGame',
                                  color: supplementaryColors[0],
                                  game: 3),
                              SizedBox(
                                width: 5,
                              ),
                              ContainedInputChip(
                                  labelText: '6 Minute\nGame',
                                  color: supplementaryColors[2],
                                  game: 6),
                            ],
                          ),
                          Row(
                            children: [
                              ContainedInputChip(
                                  labelText: '9 Minute\nGame',
                                  color: supplementaryColors[1],
                                  game: 9),
                              SizedBox(
                                width: 5,
                              ),
                              ContainedInputChip(
                                  labelText: '1 Hour\nGame',
                                  color: supplementaryColors[3],
                                  game: 1),
                            ],
                          )
                          // for (int i = 0; i < 4; i++)
                          //   ContainedInputChip(labelText: 'Game $i Minute', color: supplementaryColors[i])
                        ],
                      ),
                    )
                  ],
                )),
            Divider(),
            SizedBox(
              height: appHeight(context) * .1,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: Container(
                      width: MediaQuery.of(context).size.width * .2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Icon(Icons.settings, color: Colors.white),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Setting',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                          SizedBox(
                            height: 5,
                          )
                        ],
                      ),
                    ),
                    onPressed: () {
                      _scaffoldKey.currentState!.openEndDrawer();
                    },
                  ),
                  ElevatedButton(
                    child: Container(
                      width: MediaQuery.of(context).size.width * .2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 5),
                          SvgPicture.asset(
                            height: 24,
                            "assets/svg/call.svg",
                            color: Colors.white,
                          ),
                          SizedBox(height: 3),
                          Text(
                            'Service',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                          SizedBox(
                            height: 5,
                          )
                        ],
                      ),
                    ),
                    onPressed: () {
                      _launchInBrowser(_url);
                    },
                  ),
                  ElevatedButton(
                    child: Container(
                      width: MediaQuery.of(context).size.width * .2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Icon(Icons.share, color: Colors.white),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Share',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                          SizedBox(
                            height: 5,
                          )
                        ],
                      ),
                    ),
                    onPressed: () {
                      Share.share('Install and Play Game and Win More Price ',
                          subject: 'Play King Fasy Game!');
                    },
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding:
            //   EdgeInsets.symmetric(vertical: AppDimens.SIZE_SPACING_LARGE),
            //   child: SizedBox(height: 180, child: SampleBarChart()),
            // )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //     onPressed: themeViewModel.toggleBrightness,
      //     tooltip: AppStrings.INCREMENT,
      //     child: Text(
      //       '₹',
      //       style: themeViewModel.baseTextTheme.headline4,
      //     )), // This
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
