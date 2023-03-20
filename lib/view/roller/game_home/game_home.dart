import 'package:flutter/material.dart';
import 'package:ows_roller_app/model/apis/api_response.dart';
import 'package:ows_roller_app/view/theme/resources/themes/theme_view_model.dart';
import 'package:ows_roller_app/view_model/local_view_model.dart';
import 'package:ows_roller_app/model/model/model_user.dart';
import 'package:provider/provider.dart';
import 'package:ows_roller_app/view_model/api_view_model.dart';
import 'package:ows_roller_app/model/model/model_game.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'game_home_panel.dart';

class GameHome extends StatefulWidget {
  const GameHome(
      {Key? key, required this.minute, required this.image, required this.api})
      : super(key: key);
  final minute;
  final image;
  final api;

  @override
  State<GameHome> createState() => _GameHomeState();
}

class _GameHomeState extends State<GameHome> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool flagEndDrawer = true;
  double _kSize = 60;
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

  loadData() async {
    await Provider.of<ApiViewModel>(context, listen: false)
        .fetchData(context, ModelGame(), widget.api, null);
  }

  @override
  void initState() {
    print('saboor minute${widget.minute}');
    super.initState();
    getUserDetails();
    loadData();
  }

  @override
  void dispose() async {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeViewModel = context.watch<ThemeViewModel>();
    final companyColors = themeViewModel.colors;
    return flagUserData
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Consumer<ApiViewModel>(builder: (context, obj, child) {
            switch (obj.apiResponse.status) {
              case Status.loading:
                return Scaffold(
                  body: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: widget.image == 3
                            ? companyColors.supplementaryColors[0]
                            : widget.image == 6
                                ? companyColors.supplementaryColors[2]
                                : widget.image == 9
                                    ? companyColors.supplementaryColors[1]
                                    : companyColors.supplementaryColors[3],
                        border: Border.fromBorderSide(BorderSide(
                            color: widget.api[0] == 't'
                                ? Colors.redAccent
                                : Colors.yellowAccent,
                            width: .2)),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${widget.image} ${widget.minute == 1 ? 'Hour' : 'Minute'}',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: widget.image == 3
                                      ? Colors.black
                                      : widget.image == 6
                                          ? Colors.black
                                          : widget.image == 9
                                              ? Colors.black
                                              : Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Game',
                              style: TextStyle(
                                  fontSize: 34,
                                  color: widget.image == 3
                                      ? Colors.black
                                      : widget.image == 6
                                          ? Colors.black
                                          : widget.image == 9
                                              ? Colors.black
                                              : Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * .1),
                              child: new LinearPercentIndicator(
                                width: MediaQuery.of(context).size.width * .8,
                                animation: true,
                                lineHeight: 22.0,
                                animationDuration: 2000,
                                percent: 0.9,
                                center: Text(
                                  "Please wait ${widget.minute == 1 ? '1' : widget.minute} ${widget.minute == 1 ? 'Hour' : 'Minute'} Game is Loading....",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: widget.image == 3
                                        ? Colors.white
                                        : widget.image == 6
                                            ? Colors.white
                                            : widget.image == 9
                                                ? Colors.white
                                                : Colors.white,
                                  ),
                                ),
                                progressColor: widget.image == 3
                                    ? Colors.black
                                    : widget.image == 6
                                        ? Colors.red
                                        : widget.image == 9
                                            ? Colors.black
                                            : Colors.black,
                                barRadius: Radius.circular(20),
                              ),
                            ),
                          ],
                        ),
                      )),
                );
              case Status.dataLoaded:
                return Scaffold(
                  body: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: widget.minute == 3
                            ? companyColors.supplementaryColors[0]
                            : widget.minute == 6
                                ? companyColors.supplementaryColors[1]
                                : widget.minute == 9
                                    ? companyColors.supplementaryColors[2]
                                    : companyColors.supplementaryColors[3],
                        border: Border.fromBorderSide(BorderSide(
                            color: widget.api[0] == 't'
                                ? Colors.redAccent
                                : Colors.yellowAccent,
                            width: .2)),
                      ),
                      child: Center(
                        child: LoadingAnimationWidget.inkDrop(
                          color: Colors.white,
                          size: _kSize,
                        ),
                      )),
                );
              case Status.completed:
                return GameHomePanel(
                    minute: widget.minute,
                    userId: appUser.name,
                    userMobile: appUser.mobile,
                    obj: obj);
              case Status.error:
                return Scaffold(
                    body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Error in loading data'),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('try again'))
                    ],
                  ),
                ));
              case Status.initial:
              default:
                return Scaffold(
                  body: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          border: Border.fromBorderSide(BorderSide(
                              color: Colors.yellowAccent, width: .2)),
                          image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: AssetImage('assets/images/img_3.png'))),
                      child: Center(
                        child: LoadingAnimationWidget.inkDrop(
                          color: Colors.yellowAccent,
                          size: _kSize,
                        ),
                      )),
                );
            }
          });
  }
}
