import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_package1/components.dart';
import 'package:ows_roller_app/model/base/base_url.dart';
import 'package:ows_roller_app/model/model/model_bet_api.dart';
import 'package:ows_roller_app/model/model/model_bet_response.dart';
import 'package:ows_roller_app/model/model/model_check_bet_response.dart';
import 'package:ows_roller_app/model/model/model_game.dart';
import 'package:ows_roller_app/view/app_config/local/components.dart';
import 'package:ows_roller_app/view/roller/game_home/chart/chart_cells.dart';
import 'package:ows_roller_app/view/roller/game_home/chart/chart_cells_result.dart';
import 'package:ows_roller_app/view/roller/game_home/panel_home.dart';
import 'package:ows_roller_app/view/roller/game_home/setting.dart';
import 'package:ows_roller_app/view/roller/game_home/stack_bet_chart.dart';
import 'package:ows_roller_app/view/roller/game_home/stack_bet_panel.dart';
import 'package:ows_roller_app/view/roller/game_home/stack_roller.dart';
import 'package:ows_roller_app/view/roller/game_home/stack_slot_id.dart';
import 'package:ows_roller_app/view/roller/widget/config.dart';
import 'package:ows_roller_app/view/theme/resources/strings/app_strings.dart';
import 'package:ows_roller_app/view/theme/resources/themes/theme_view_model.dart';
import 'package:ows_roller_app/view_model/api_view_model.dart';
import 'package:ows_roller_app/view_model/bet_view_model.dart';
import 'package:ows_roller_app/view_model/local_view_model.dart';
import 'package:ows_roller_app/model/model/model_user.dart';
import 'package:ows_roller_app/view_model/timer_view_model.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_glow/flutter_glow.dart';
import 'package:spritewidget/spritewidget.dart';
import 'dart:async';
import 'dart:math' as math;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';

class DialogBetConfirmation {
  static show(BuildContext context, txt) {
    return showDialog(
        context: context,
        builder: (_) => Center(
              child: Container(
                height: appHeight(context) * .6,
                width: appWidth(context) * .9,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: .5),
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(0)),
                    color: Colors.green),
                child: Column(
                  children: [
                    Container(
                      height: appHeight(context) * .05,
                      width: appWidth(context) * .9,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(0)),
                        image: DecorationImage(
                          image: AssetImage("assets/bg/black1.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            SizedBox(width: appWidth(context) * .3),
                            GlowText(
                              glowColor: Colors.yellowAccent,
                              'Add Cash',
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white),
                            ),
                            Spacer(),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.clear,
                                  color: Colors.white,
                                  size: 30,
                                )),
                            SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: appHeight(context) * .01,
                    ),
                  ],
                ),
              ),
            ));
  }
}

class GameHomePanel extends StatefulWidget {
  GameHomePanel(
      {Key? key,
      required this.minute,
      required this.userId,
      required this.userMobile,
      required this.obj})
      : super(key: key);
  final minute;
  final obj;
  final userId, userMobile;

  @override
  State<GameHomePanel> createState() => _GameHomePanelState();
}

late SpriteSheet _sprites;
late ImageMap _images;

class _GameHomePanelState extends State<GameHomePanel> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  late ModelGame data;
  bool isBet = false;
  bool isLoading = false;
  late ModelBetResponse responseBetOk;
  late ModelCheckBetResponse modelCheckBetResponse;

  List<bool> isWin = [
    false,
    true,
    false,
    false,
    false,
    false,
    true,
    false,
    false,
    false
  ];
  bool _assetsLoaded = false;
  int _count = 0;
  int _time = 0;

  int get kcal => (_count * 0.2).toInt();
  late _WorkoutAnimationNode workoutAnimation;

  Future<String> checkBet(context, slotId) async {
    print('checkBet2:');
    setState(() {
      isLoading = true;
    });
    var api = widget.minute == 3
        ? checkBetApiList[0]
        : widget.minute == 6
            ? checkBetApiList[1]
            : widget.minute == 9
                ? checkBetApiList[2]
                : checkBetApiList[3];
    print(
        'checkBet2 : api: $api ---${widget.userId.toString()} -- ${slotId.toString()}');
    final response = await http.post(Uri.parse(apiBaseUrl + api), body: {
      'user_id': widget.userId.toString(),
      'slot_id': slotId.toString()
    });
    if (response.statusCode == 200) {
      print('checkBet3: ');
      print('checkBet33: ${response.body}');
      var json = jsonDecode(response.body);
      modelCheckBetResponse = ModelCheckBetResponse().fromJson(json[0]);
      setState(() {
        isLoading = false;
      });
      setState(() {
        print('checkBet333: ${modelCheckBetResponse.result.toString()[0]}');
      });
      if (json[0]['response'] == '0') {
        setState(() {
          isBet = true;
        });
        Provider.of<BetViewModel>(context, listen: false).setWinResult(false);
        // DialogBetConfirmation.show(context,'hello');
      } else {
        setState(() {
          isBet = false;
        });
      }
      return json[0]['response'];
    } else {
      print('checkBet4: ');
      setState(() {
        isLoading = false;
      });
      return '0';
    }
  }

  betData(BuildContext context, ModelBetApi betObj, betApi, slotId) async {
    print('checkBet0: ');
    Provider.of<BetViewModel>(context, listen: false).setWinValues(0, '11',false);
    Provider.of<BetViewModel>(context, listen: false).setWinValues(1, '11',false);
    Provider.of<BetViewModel>(context, listen: false).setWinValues(2, '11',false);
    Provider.of<BetViewModel>(context, listen: false).setWinValues(3, '11',false);
    Provider.of<BetViewModel>(context, listen: false).setWinValues(4, '11',false);
    responseBetOk = await Provider.of<ApiViewModel>(context, listen: false)
        .fetchDataBet(context, ModelBetResponse(), betApi, betObj.toJson());
    // ApiResponse response = obj.apiResponse.data[0];
    print('checkBet1: ${responseBetOk.message}');
    var response = await checkBet(context, slotId);
    print('checkBet5: ');
    print('response: ${response}');
  }

  Future<void> _loadAssets(AssetBundle bundle) async {
    _images = ImageMap();
    await _images.load(<String>[
      'assets/images/gold2.png',
    ]);
    String json = await DefaultAssetBundle.of(context)
        .loadString('assets/jumpingjack.json');
    _sprites = SpriteSheet(
      image: _images['assets/jumpingjack.png']!,
      jsonDefinition: json,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadAssets(rootBundle).then((_) {
      setState(() {
        _assetsLoaded = true;
        workoutAnimation = _WorkoutAnimationNode(onPerformedJumpingJack: () {
          setState(() {
            _count += 1;
          });
        }, onSecondPassed: (int seconds) {
          setState(() {
            _time = seconds;
          });
        });
      });
    });
    data = widget.obj.apiResponse.data[0] as ModelGame;
    checkBet(context, data!.slotId);
  }

  @override
  Widget build(BuildContext context) {
    final themeViewModel = context.watch<ThemeViewModel>();
    final onPrimaryColor = themeViewModel.colors.colorScheme.onPrimary;
    final icons = themeViewModel.icons;
    final companyColors = themeViewModel.colors;
    final backgrounColor = widget.minute == 3
        ? companyColors.supplementaryColors[0]
        : widget.minute == 6
            ? companyColors.supplementaryColors[2]
            : widget.minute == 9
                ? companyColors.supplementaryColors[1]
                : companyColors.supplementaryColors[3];
    return Consumer<BetViewModel>(builder: (context, betObj, child) {
      return Scaffold(
        key: scaffoldKey,
        endDrawer: Setting(),
        floatingActionButton: isLoading
            ? SizedBox(
                height: 40,
                width: 40,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : isBet
                ? FloatingActionButton(
                    backgroundColor: backgrounColor,
                    onPressed: () async {
                      showToast(
                          msg:
                              'Your bet is already fixed for Game ${widget.minute} \nslot no. ${data!.slotId} \n please wait for result...');
                      // DialogBetConfirmation.show(context, 'Hello');
                    },
                    tooltip: AppStrings.INCREMENT,
                    child: Text('  Bet\n Fixed',
                        style: themeViewModel.primaryTextTheme.bodyMedium))
                : FloatingActionButton(
                    backgroundColor: backgrounColor,
                    onPressed: () async {
                      AppUser appUser = await Provider.of<SharedPreferencesVM>(
                              context,
                              listen: false)
                          .getUserDetails();
                      print('appUser::::${appUser.userType}');
                      if (appUser.userType == 'guest') {
                        showToast(msg: 'Please login with your mobile to bet.');
                      } else {
                        betData(
                          context,
                          ModelBetApi(
                            ball1_l_s:
                                betObj.getNumberBoll1SmallLarge.toString(),
                            ball1_l_s_bet:
                                betObj.getAmountBoll1SmallLarge.toString(),
                            ball1_o_e: betObj.getNumberBoll1EvenOdd.toString(),
                            ball1_o_e_bet:
                                betObj.getAmountBoll1EvenOdd.toString(),
                            ball2_l_s:
                                betObj.getNumberBoll2SmallLarge.toString(),
                            ball2_l_s_bet:
                                betObj.getAmountBoll2SmallLarge.toString(),
                            ball2_o_e: betObj.getNumberBoll2EvenOdd.toString(),
                            ball2_o_e_bet:
                                betObj.getAmountBoll2EvenOdd.toString(),
                            ball3_l_s:
                                betObj.getNumberBoll3SmallLarge.toString(),
                            ball3_l_s_bet:
                                betObj.getAmountBoll3SmallLarge.toString(),
                            ball3_o_e: betObj.getNumberBoll3EvenOdd.toString(),
                            ball3_o_e_bet:
                                betObj.getAmountBoll3EvenOdd.toString(),
                            ball4_l_s:
                                betObj.getNumberBoll4SmallLarge.toString(),
                            ball4_l_s_bet:
                                betObj.getAmountBoll4SmallLarge.toString(),
                            ball4_o_e: betObj.getNumberBoll4EvenOdd.toString(),
                            ball4_o_e_bet:
                                betObj.getAmountBoll4EvenOdd.toString(),
                            ball5_l_s:
                                betObj.getNumberBoll5SmallLarge.toString(),
                            ball5_l_s_bet:
                                betObj.getAmountBoll5SmallLarge.toString(),
                            ball5_o_e: betObj.getNumberBoll5EvenOdd.toString(),
                            ball5_o_e_bet:
                                betObj.getAmountBoll5EvenOdd.toString(),
                            slot_id: data!.slotId,
                            user_id: widget.userId,
                          ),
                          widget.minute == 3
                              ? betApiList[0]
                              : widget.minute == 6
                                  ? betApiList[1]
                                  : widget.minute == 9
                                      ? betApiList[2]
                                      : betApiList[3],
                          data!.slotId,
                        );
                      }
                    },
                    tooltip: AppStrings.INCREMENT,
                    child: Text('Bet\n Ok',
                        style: themeViewModel.primaryTextTheme.bodyLarge)),
        bottomNavigationBar: BottomAppBar(
          color: backgrounColor,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Back',
                    style: themeViewModel.primaryTextTheme.headline6,
                  ),
                ),
              ),
              IconButton(
                  icon: Icon(icons.menu),
                  color: onPrimaryColor,
                  onPressed: () {
                    scaffoldKey.currentState!.openDrawer();
                  }),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        //
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              SingleChildScrollView(
                  child: Column(
                children: [
                  SizedBox(height: GameConfig.getSlotIdHeight(context)),
                  SizedBox(
                      height: StackPosition.gameIdTopPosition(context) * 4),
                  isLoading
                      ? Container()
                      : Text('${modelCheckBetResponse.result}'),
                  isBet
                      ? BetOkChart(
                          backgrounColor: backgrounColor,
                          model: modelCheckBetResponse,
                          winList: isWin,
                          result: modelCheckBetResponse.result)
                      : PanelHome(
                          height: GameConfig.getOddEvenHeight(context),
                          bgColor: backgrounColor,
                          data: widget.obj.apiResponse.data[0] as ModelGame?),
                ],
              )),
              // Slot Id,
              Consumer<TimerViewModel>(builder: (context, objTimer, child) {
                return Positioned(
                  top: StackPosition.gameIdTopPosition(context) * 4,
                  left: StackPosition.gameIdLeftPosition(context),
                  child: StackSlotId(
                    height: GameConfig.getSlotIdHeight(context),
                    timer: objTimer.getStopWatchTimer,
                    data: widget.obj.apiResponse.data[0] as ModelGame,
                    header: widget.minute == 3
                        ? '3'
                        : widget.minute == 6
                            ? '6'
                            : widget.minute == 9
                                ? '9'
                                : '1',
                    bgColor: backgrounColor,
                  ),
                );
              }),
              // Roller,
              Consumer<TimerViewModel>(builder: (context, objTimer, child) {
                return Positioned(
                  top: StackPosition.rollerTopPosition(context) * 5,
                  left: StackPosition.rollerLeftPosition(context),
                  child: StackRoller(
                      bgColor: backgrounColor,
                      data: widget.obj.apiResponse.data[0] as ModelGame?,
                      minute: widget.minute,
                      timer: objTimer.getStopWatchTimer),
                );
              }),
              // Bet Chart,
              isBet
                  ? Container()
                  : Consumer<TimerViewModel>(
                      builder: (context, objTimer, child) {
                      return Positioned(
                        top: StackPosition.betChartTopPosition(context),
                        left: StackPosition.betChartLeftPosition(context),
                        child: StackBetChart(
                          height: GameConfig.getBetChartHeight(context),
                          bgColor: backgrounColor,
                        ),
                      );
                    }),
              // Bet Panel,
              isBet
                  ? Container()
                  : Consumer<TimerViewModel>(
                      builder: (context, objTimer, child) {
                      return Positioned(
                        top: StackPosition.betPanelTopPosition(context),
                        left: StackPosition.betPanelLeftPosition(context),
                        child: StackBetPanel(
                          height: GameConfig.getBetChartHeight(context),
                          bgColor: backgrounColor,
                        ),
                      );
                    }),
            ],
          ),
        ),
      );
    });
  }
}

class BetOkChart extends StatelessWidget {
  BetOkChart(
      {Key? key,
      required this.backgrounColor,
      required this.model,
      required this.result,
      required this.winList})
      : super(key: key);
  final backgrounColor;
  final result;
  final ModelCheckBetResponse model;
  final List<bool> winList;
  bool resultUpdated = false;

  TextStyle getTextStyle(BuildContext context, double height) {
    final themeViewModel = context.watch<ThemeViewModel>();
    return TextStyle(
        color: Colors.white, fontWeight: FontWeight.w500, fontSize: height);
  }

  @override
  Widget build(BuildContext context) {
    final total = int.parse(model.ball1LSBet!) +
        int.parse(model.ball2LSBet!) +
        int.parse(model.ball3LSBet!) +
        int.parse(model.ball4LSBet!) +
        int.parse(model.ball5LSBet!) +
        int.parse(model.ball1OEBet!) +
        int.parse(model.ball2OEBet!) +
        int.parse(model.ball3OEBet!) +
        int.parse(model.ball4OEBet!) +
        int.parse(model.ball5OEBet!);
    return Padding(
      padding: EdgeInsets.only(top: appHeight(context) * .05),
      child: Center(
        child: Container(
          height: appHeight(context) * .5,
          width: appWidth(context) * .9,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: .5),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(0)),
              color: backgrounColor),
          child:
              Consumer<BetViewModel>(builder: (context, betViewModel, child) {
            return Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: appHeight(context) * .05,
                      width: appWidth(context) * .9,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(0)),
                          color: Colors.red),
                      child: Row(
                        children: [
                          SizedBox(
                              width: appWidth(context) * .22 * .6,
                              child: Center(
                                  child: Text('Boll',
                                      style: getTextStyle(
                                          context, appWidth(context) * .04)))),
                          Container(
                            height: 1,
                            color: Colors.red,
                          ),
                          SizedBox(
                              width: appWidth(context) * .22,
                              child: Center(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Odd/',
                                    style: getTextStyle(
                                        context, appWidth(context) * .04),
                                  ),
                                  Text(
                                    'Even',
                                    style: getTextStyle(
                                        context, appWidth(context) * .04),
                                  ),
                                ],
                              ))),
                          Container(
                            height: 1,
                            color: Colors.red,
                          ),
                          SizedBox(
                              width: appWidth(context) * .22,
                              child: Center(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Small/',
                                    style: getTextStyle(
                                        context, appWidth(context) * .04),
                                  ),
                                  Text(
                                    'Large',
                                    style: getTextStyle(
                                        context, appWidth(context) * .04),
                                  ),
                                ],
                              ))),
                          Container(
                            height: 1,
                            color: Colors.red,
                          ),
                          SizedBox(
                              width: appWidth(context) * .22,
                              child: Center(
                                  child: Text(
                                'Total',
                                style: getTextStyle(
                                    context, appWidth(context) * .04),
                              ))),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.black45,
                      height: .5,
                    ),
                    SizedBox(
                        height: appHeight(context) * .3,
                        width: appWidth(context) * .9,
                        child: Row(
                          children: [
                            SizedBox(
                                width: appWidth(context) * .22 * .6,
                                child: Column(
                                  children: [
                                    ChartCells(
                                      height: appHeight(context) * .3 * .2,
                                      border: false,
                                      title: '1',
                                      width: appWidth(context) * .22 * .6,
                                      fontSize: appWidth(context) * .04,
                                    ),
                                    ChartCells(
                                      border: false,
                                      height: appHeight(context) * .3 * .2,
                                      title: '2',
                                      width: appWidth(context) * .22 * .6,
                                      fontSize: appWidth(context) * .04,
                                    ),
                                    ChartCells(
                                      border: false,
                                      height: appHeight(context) * .3 * .2,
                                      title: '3',
                                      width: appWidth(context) * .22 * .6,
                                      fontSize: appWidth(context) * .04,
                                    ),
                                    ChartCells(
                                      border: false,
                                      height: appHeight(context) * .3 * .2,
                                      title: '4',
                                      width: appWidth(context) * .22 * .6,
                                      fontSize: appWidth(context) * .04,
                                    ),
                                    ChartCells(
                                      border: false,
                                      height: appHeight(context) * .3 * .2,
                                      title: '5',
                                      width: appWidth(context) * .22 * .6,
                                      fontSize: appWidth(context) * .04,
                                    ),
                                  ],
                                )),
                            SizedBox(
                                width: appWidth(context) * .22,
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        betViewModel.getWinValues[0] ==
                                                model.ball1OE
                                            ? getFireWorks(context)
                                            : Container(),
                                        ChartCellsResult(
                                            height:
                                                appHeight(context) * .3 * .2,
                                            border:
                                                betViewModel.getWinValues[0] ==
                                                        model.ball1OE
                                                    ? true
                                                    : false,
                                            width: appWidth(context) * .22,
                                            fontSize: appWidth(context) * .04,
                                            title:
                                                '${model.ball1OE}/${model.ball1OEBet}₹'),
                                      ],
                                    ),
                                    Stack(
                                      children: [
                                        betViewModel.getWinValues[1] ==
                                                model.ball2OE
                                            ? getFireWorks(context)
                                            : Container(),
                                        ChartCellsResult(
                                            height:
                                                appHeight(context) * .3 * .2,
                                            border:
                                                betViewModel.getWinValues[1] ==
                                                        model.ball2OE
                                                    ? true
                                                    : false,
                                            width: appWidth(context) * .22,
                                            fontSize: appWidth(context) * .04,
                                            title:
                                                '${model.ball2OE}/${model.ball2OEBet}₹'),
                                      ],
                                    ),
                                    Stack(
                                      children: [
                                        betViewModel.getWinValues[2] ==
                                                model.ball3OE
                                            ? getFireWorks(context)
                                            : Container(),
                                        ChartCellsResult(
                                            height:
                                                appHeight(context) * .3 * .2,
                                            border:
                                                betViewModel.getWinValues[2] ==
                                                        model.ball3OE
                                                    ? true
                                                    : false,
                                            width: appWidth(context) * .22,
                                            fontSize: appWidth(context) * .04,
                                            title:
                                                '${model.ball3OE}/${model.ball3OEBet}₹'),
                                      ],
                                    ),
                                    Stack(
                                      children: [
                                        betViewModel.getWinValues[3] ==
                                                model.ball4OE
                                            ? getFireWorks(context)
                                            : Container(),
                                        ChartCellsResult(
                                            height:
                                                appHeight(context) * .3 * .2,
                                            border:
                                                betViewModel.getWinValues[3] ==
                                                        model.ball4OE
                                                    ? true
                                                    : false,
                                            width: appWidth(context) * .22,
                                            fontSize: appWidth(context) * .04,
                                            title:
                                                '${model.ball4OE}/${model.ball4OEBet}₹'),
                                      ],
                                    ),
                                    Stack(
                                      children: [
                                        betViewModel.getWinValues[4] ==
                                                model.ball5OE
                                            ? getFireWorks(context)
                                            : Container(),
                                        ChartCellsResult(
                                            height:
                                                appHeight(context) * .3 * .2,
                                            border:
                                                betViewModel.getWinValues[4] ==
                                                        model.ball5OE
                                                    ? true
                                                    : false,
                                            width: appWidth(context) * .22,
                                            fontSize: appWidth(context) * .04,
                                            title:
                                                '${model.ball5OE}/${model.ball5OEBet}₹'),
                                      ],
                                    ),
                                  ],
                                )),
                            SizedBox(
                                width: appWidth(context) * .22,
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        betViewModel.getWinValues[0] ==
                                                model.ball1LS
                                            ? getFireWorks(context)
                                            : Container(),
                                        ChartCellsResult(
                                            height:
                                                appHeight(context) * .3 * .2,
                                            border:
                                                betViewModel.getWinValues[0] ==
                                                        model.ball1LS
                                                    ? true
                                                    : false,
                                            width: appWidth(context) * .22,
                                            fontSize: appWidth(context) * .04,
                                            title:
                                                '${model.ball1LS}/${model.ball1LSBet}₹'),
                                      ],
                                    ),
                                    Stack(
                                      children: [
                                        betViewModel.getWinValues[1] ==
                                                model.ball2LS
                                            ? getFireWorks(context)
                                            : Container(),
                                        ChartCellsResult(
                                            height:
                                                appHeight(context) * .3 * .2,
                                            border:
                                                betViewModel.getWinValues[1] ==
                                                        model.ball2LS
                                                    ? true
                                                    : false,
                                            width: appWidth(context) * .22,
                                            fontSize: appWidth(context) * .04,
                                            title:
                                                '${model.ball2LS}/${model.ball2LSBet}₹'),
                                      ],
                                    ),
                                    Stack(
                                      children: [
                                        winList[7] == true
                                            ? getFireWorks(context)
                                            : Container(),
                                        ChartCellsResult(
                                            height:
                                                appHeight(context) * .3 * .2,
                                            border:
                                                betViewModel.getWinValues[2] ==
                                                        model.ball3LS
                                                    ? true
                                                    : false,
                                            width: appWidth(context) * .22,
                                            fontSize: appWidth(context) * .04,
                                            title:
                                                '${model.ball3LS}/${model.ball3LSBet}₹'),
                                      ],
                                    ),
                                    Stack(
                                      children: [
                                        betViewModel.getWinValues[3] ==
                                                model.ball4LS
                                            ? getFireWorks(context)
                                            : Container(),
                                        ChartCellsResult(
                                            height:
                                                appHeight(context) * .3 * .2,
                                            border:
                                                betViewModel.getWinValues[3] ==
                                                        model.ball4LS
                                                    ? true
                                                    : false,
                                            width: appWidth(context) * .22,
                                            fontSize: appWidth(context) * .04,
                                            title:
                                                '${model.ball4LS}/${model.ball4LSBet}₹'),
                                      ],
                                    ),
                                    Stack(
                                      children: [
                                        betViewModel.getWinValues[4] ==
                                                model.ball5LS
                                            ? getFireWorks(context)
                                            : Container(),
                                        ChartCells(
                                            height:
                                                appHeight(context) * .3 * .2,
                                            border:
                                                betViewModel.getWinValues[4] ==
                                                        model.ball5LS
                                                    ? true
                                                    : false,
                                            width: appWidth(context) * .22,
                                            fontSize: appWidth(context) * .04,
                                            title:
                                                '${model.ball5LS}/${model.ball5LSBet}₹'),
                                      ],
                                    ),
                                  ],
                                )),
                            SizedBox(
                                width: appWidth(context) * .22,
                                child: Column(
                                  children: [
                                    ChartCells(
                                        height: appHeight(context) * .3 * .2,
                                        border: false,
                                        width: appWidth(context) * .22,
                                        fontSize: appWidth(context) * .04,
                                        title:
                                            '${int.parse(model.ball1OEBet!) + int.parse(model.ball1LSBet!)}₹'),
                                    ChartCells(
                                        height: appHeight(context) * .3 * .2,
                                        border: false,
                                        width: appWidth(context) * .22,
                                        fontSize: appWidth(context) * .04,
                                        title:
                                            '${int.parse(model.ball2OEBet!) + int.parse(model.ball2LSBet!)}₹'),
                                    ChartCells(
                                        height: appHeight(context) * .3 * .2,
                                        border: false,
                                        width: appWidth(context) * .22,
                                        fontSize: appWidth(context) * .04,
                                        title:
                                            '${int.parse(model.ball3OEBet!) + int.parse(model.ball3LSBet!)}₹'),
                                    ChartCells(
                                        height: appHeight(context) * .3 * .2,
                                        border: false,
                                        width: appWidth(context) * .22,
                                        fontSize: appWidth(context) * .04,
                                        title:
                                            '${int.parse(model.ball4OEBet!) + int.parse(model.ball4LSBet!)}₹'),
                                    ChartCells(
                                        height: appHeight(context) * .3 * .2,
                                        border: false,
                                        width: appWidth(context) * .22,
                                        fontSize: appWidth(context) * .04,
                                        title:
                                            '${int.parse(model.ball5OEBet!) + int.parse(model.ball5LSBet!)}₹'),
                                  ],
                                )),
                          ],
                        )),
                    SizedBox(
                      height: appHeight(context) * .06,
                      child: Center(
                        child: Text(
                          'Total Bet Amount = $total ₹',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: appHeight(context) * .025),
                        ),
                      ),
                    ),
                    Container(
                        height: appHeight(context) * .07,
                        width: appWidth(context) * .7,
                        decoration: BoxDecoration(color: Colors.white),
                        child: betViewModel.getWinResult
                            ? Container(
                                height: appHeight(context) * .07,
                                width: appWidth(context) * .7,
                                decoration: BoxDecoration(color: Colors.white),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: appHeight(context) * .06,
                                      width: appWidth(context) * .1,
                                      child: Column(
                                        children: [
                                          Text(
                                            '${result[0]}',
                                            style: TextStyle(
                                                fontSize:
                                                    appHeight(context) * .03),
                                          ),
                                          betViewModel.getWinValues[0] ==
                                                      model.ball1OE ||
                                                  betViewModel
                                                          .getWinValues[0] ==
                                                      model.ball1LS
                                              ? FaIcon(
                                                  FontAwesomeIcons.thumbsUp,
                                                  color: Colors.green,
                                                  size:
                                                      appHeight(context) * .02,
                                                )
                                              : FaIcon(
                                                  FontAwesomeIcons.thumbsDown,
                                                  color: Colors.red,
                                                  size:
                                                      appHeight(context) * .02,
                                                ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: appHeight(context) * .06,
                                      width: appWidth(context) * .1,
                                      child: Column(
                                        children: [
                                          Text(
                                            '${result[1]}',
                                            style: TextStyle(
                                                fontSize:
                                                    appHeight(context) * .03),
                                          ),
                                          betViewModel.getWinValues[1] ==
                                                      model.ball2OE ||
                                                  betViewModel
                                                          .getWinValues[1] ==
                                                      model.ball2LS
                                              ? FaIcon(
                                                  FontAwesomeIcons.thumbsUp,
                                                  color: Colors.green,
                                                  size:
                                                      appHeight(context) * .02,
                                                )
                                              : FaIcon(
                                                  FontAwesomeIcons.thumbsDown,
                                                  color: Colors.red,
                                                  size:
                                                      appHeight(context) * .02,
                                                ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: appHeight(context) * .06,
                                      width: appWidth(context) * .1,
                                      child: Column(
                                        children: [
                                          Text(
                                            '${result[2]}',
                                            style: TextStyle(
                                                fontSize:
                                                    appHeight(context) * .03),
                                          ),
                                          betViewModel.getWinValues[2] ==
                                                      model.ball3OE ||
                                                  betViewModel
                                                          .getWinValues[2] ==
                                                      model.ball3LS
                                              ? FaIcon(
                                                  FontAwesomeIcons.thumbsUp,
                                                  color: Colors.green,
                                                  size:
                                                      appHeight(context) * .02,
                                                )
                                              : FaIcon(
                                                  FontAwesomeIcons.thumbsDown,
                                                  color: Colors.red,
                                                  size:
                                                      appHeight(context) * .02,
                                                ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: appHeight(context) * .06,
                                      width: appWidth(context) * .1,
                                      child: Column(
                                        children: [
                                          Text(
                                            '${result[3]}',
                                            style: TextStyle(
                                                fontSize:
                                                    appHeight(context) * .03),
                                          ),
                                          betViewModel.getWinValues[3] ==
                                                      model.ball4OE ||
                                                  betViewModel
                                                          .getWinValues[3] ==
                                                      model.ball4LS
                                              ? FaIcon(
                                                  FontAwesomeIcons.thumbsUp,
                                                  color: Colors.green,
                                                  size:
                                                      appHeight(context) * .02,
                                                )
                                              : FaIcon(
                                                  FontAwesomeIcons.thumbsDown,
                                                  color: Colors.red,
                                                  size:
                                                      appHeight(context) * .02,
                                                ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: appHeight(context) * .06,
                                      width: appWidth(context) * .1,
                                      child: Column(
                                        children: [
                                          Text(
                                            '${result[4]}',
                                            style: TextStyle(
                                                fontSize:
                                                    appHeight(context) * .03),
                                          ),
                                          betViewModel.getWinValues[4] ==
                                                      model.ball5OE ||
                                                  betViewModel
                                                          .getWinValues[4] ==
                                                      model.ball5LS
                                              ? FaIcon(
                                                  FontAwesomeIcons.thumbsUp,
                                                  color: Colors.green,
                                                  size:
                                                      appHeight(context) * .02,
                                                )
                                              : FaIcon(
                                                  FontAwesomeIcons.thumbsDown,
                                                  color: Colors.red,
                                                  size:
                                                      appHeight(context) * .02,
                                                ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Center(
                                child: GestureDetector(
                                    onTap: () {
                                      // navigateTo(context, FitnessDemo());
                                    },
                                    child: Text('Please wait for result...')),
                              ))
                  ],
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget getFireWorks(BuildContext context) {
    return SizedBox(
        height: appHeight(context) * .3 * .2,
        width: appWidth(context) * .22,
        child: Center(
            child: SizedBox(
                height: appHeight(context) * .3 * .1,
                width: appWidth(context) * .1,
                child: _Fireworks())));
  }
}

class _Fireworks extends StatefulWidget {
  const _Fireworks({Key? key}) : super(key: key);

  @override
  _FireworksState createState() => _FireworksState();
}

class _FireworksState extends State<_Fireworks> {
  @override
  void initState() {
    super.initState();
    fireworks = _FireworksNode();
  }

  late _FireworksNode fireworks;

  @override
  Widget build(BuildContext context) {
    return SpriteWidget(fireworks);
  }
}

class _FireworksNode extends NodeWithSize {
  _FireworksNode() : super(const Size(1024.0, 1024.0));
  double _countDown = 0.0;

  @override
  void update(double dt) {
    if (_countDown <= 0.0) {
      _addExplosion();
      _countDown = randomDouble();
    }

    _countDown -= dt;
  }

  Color _randomExplosionColor() {
    double rand = randomDouble();
    if (rand < 0.25) {
      return Colors.pink[200]!;
    } else if (rand < 0.5) {
      return Colors.lightBlue[200]!;
    } else if (rand < 0.75) {
      return Colors.purple[200]!;
    } else {
      return Colors.cyan[200]!;
    }
  }

  void _addExplosion() {
    Color startColor = _randomExplosionColor();
    Color endColor = startColor.withAlpha(0);

    ParticleSystem system = ParticleSystem(
      texture: _sprites['particle-0.png']!,
      numParticlesToEmit: 100,
      emissionRate: 1000.0,
      rotateToMovement: true,
      startRotation: 90.0,
      endRotation: 90.0,
      speed: 100.0,
      speedVar: 50.0,
      startSize: 1.0,
      startSizeVar: 0.5,
      gravity: const Offset(0.0, 30.0),
      colorSequence: ColorSequence.fromStartAndEndColor(
        start: startColor,
        end: endColor,
      ),
    );
    system.position = Offset(randomDouble() * 1024.0, randomDouble() * 1024.0);
    addChild(system);
  }
}

class _WorkoutAnimationNode extends NodeWithSize {
  _WorkoutAnimationNode({
    required this.onPerformedJumpingJack,
    required this.onSecondPassed,
  }) : super(const Size(1024.0, 1024.0)) {
    reset();

    _progress = _ProgressCircle(const Size(800.0, 800.0));
    _progress.pivot = const Offset(0.5, 0.5);
    _progress.position = const Offset(512.0, 512.0);
    addChild(_progress);

    _jumpingJack = _JumpingJack(() {
      onPerformedJumpingJack();
    });
    _jumpingJack.scale = 0.5;
    _jumpingJack.position = const Offset(512.0, 550.0);
    addChild(_jumpingJack);
  }

  final VoidCallback onPerformedJumpingJack;
  final _SecondPassedCallback onSecondPassed;

  int seconds = 0;

  late bool workingOut;

  static const int _kTargetMillis = 1000 * 30;
  late int _startTimeMillis;
  late _ProgressCircle _progress;
  late _JumpingJack _jumpingJack;

  void reset() {
    seconds = 0;
    workingOut = false;
  }

  void start() {
    reset();
    _startTimeMillis = DateTime.now().millisecondsSinceEpoch;
    workingOut = true;
    _jumpingJack.animateJumping();
  }

  void stop() {
    workingOut = false;
    _jumpingJack.neutralPose();
  }

  @override
  void update(double dt) {
    if (workingOut) {
      int millis = DateTime.now().millisecondsSinceEpoch - _startTimeMillis;
      int newSeconds = (millis) ~/ 1000;
      if (newSeconds != seconds) {
        seconds = newSeconds;
        onSecondPassed(seconds);
      }

      _progress.value = millis / _kTargetMillis;
    } else {
      _progress.value = 0.0;
    }
  }
}

class _ProgressCircle extends NodeWithSize {
  _ProgressCircle(Size size, [this.value = 0.0]) : super(size);

  static const double _kTwoPI = math.pi * 2.0;
  static const double _kEpsilon = .0000001;
  static const double _kSweep = _kTwoPI - _kEpsilon;

  double value;

  @override
  void paint(Canvas canvas) {
    applyTransformForPivot(canvas);

    Paint circlePaint = Paint()
      ..color = Colors.white30
      ..strokeWidth = 24.0
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(
      Offset(size.width / 2.0, size.height / 2.0),
      size.width / 2.0,
      circlePaint,
    );

    Paint pathPaint = Paint()
      ..color = Colors.purple[500]!
      ..strokeWidth = 25.0
      ..style = PaintingStyle.stroke;

    double angle = value.clamp(0.0, 1.0) * _kSweep;
    Path path = Path()..arcTo(Offset.zero & size, -math.pi / 2.0, angle, false);
    canvas.drawPath(path, pathPaint);
  }
}

class _JumpingJack extends Node {
  _JumpingJack(VoidCallback onPerformedJumpingJack) {
    left = _JumpingJackSide(false, onPerformedJumpingJack);
    right = _JumpingJackSide(true, null);
    addChild(left);
    addChild(right);
  }

  void animateJumping() {
    left.animateJumping();
    right.animateJumping();
  }

  void neutralPose() {
    left.neutralPosition(true);
    right.neutralPosition(true);
  }

  late _JumpingJackSide left;
  late _JumpingJackSide right;
}

class _JumpingJackSide extends Node {
  _JumpingJackSide(bool right, this.onPerformedJumpingJack) {
    // Torso and head
    torso = _createPart('torso.png', const Offset(512.0, 512.0));
    addChild(torso);

    head = _createPart('head.png', const Offset(512.0, 160.0));
    torso.addChild(head);

    if (right) {
      torso.opacity = 0.0;
      head.opacity = 0.0;
      torso.scaleX = -1.0;
    }

    // Left side movable parts
    upperArm = _createPart('upper-arm.png', const Offset(445.0, 220.0));
    torso.addChild(upperArm);
    lowerArm = _createPart('lower-arm.png', const Offset(306.0, 200.0));
    upperArm.addChild(lowerArm);
    hand = _createPart('hand.png', const Offset(215.0, 127.0));
    lowerArm.addChild(hand);
    upperLeg = _createPart('upper-leg.png', const Offset(467.0, 492.0));
    torso.addChild(upperLeg);
    lowerLeg = _createPart('lower-leg.png', const Offset(404.0, 660.0));
    upperLeg.addChild(lowerLeg);
    foot = _createPart('foot.png', const Offset(380.0, 835.0));
    lowerLeg.addChild(foot);

    torso.setPivotAndPosition(Offset.zero);

    neutralPosition(false);
  }

  late _JumpingJackPart torso;
  late _JumpingJackPart head;
  late _JumpingJackPart upperArm;
  late _JumpingJackPart lowerArm;
  late _JumpingJackPart hand;
  late _JumpingJackPart lowerLeg;
  late _JumpingJackPart upperLeg;
  late _JumpingJackPart foot;

  final VoidCallback? onPerformedJumpingJack;

  _JumpingJackPart _createPart(String textureName, Offset pivotPosition) {
    return _JumpingJackPart(
      _sprites[textureName]!,
      pivotPosition,
      name: textureName,
    );
  }

  void animateJumping() {
    motions.stopAll();
    motions.run(
      MotionSequence(
        motions: [
          _createPoseAction(null, 0, 0.5),
          MotionCallFunction(callback: _animateJumpingLoop),
        ],
      ),
    );
  }

  void _animateJumpingLoop() {
    motions.run(
      MotionRepeatForever(
        motion: MotionSequence(
          motions: [
            _createPoseAction(0, 1, 0.30),
            _createPoseAction(1, 2, 0.30),
            _createPoseAction(2, 1, 0.30),
            _createPoseAction(1, 0, 0.30),
            MotionCallFunction(
              callback: () {
                if (onPerformedJumpingJack != null) onPerformedJumpingJack!();
              },
            ),
          ],
        ),
      ),
    );
  }

  void neutralPosition(bool animate) {
    motions.stopAll();
    if (animate) {
      motions.run(_createPoseAction(null, 1, 0.5));
    } else {
      List<double> d = _dataForPose(1);
      upperArm.rotation = d[0];
      lowerArm.rotation = d[1];
      hand.rotation = d[2];
      upperLeg.rotation = d[3];
      lowerLeg.rotation = d[4];
      foot.rotation = d[5];
      torso.position = Offset(0.0, d[6]);
    }
  }

  MotionInterval _createPoseAction(
      int? startPose, int endPose, double duration) {
    List<double> d0 = _dataForPose(startPose);
    List<double> d1 = _dataForPose(endPose);

    List<MotionTween> tweens = <MotionTween>[
      _tweenRotation(upperArm, d0[0], d1[0], duration),
      _tweenRotation(lowerArm, d0[1], d1[1], duration),
      _tweenRotation(hand, d0[2], d1[2], duration),
      _tweenRotation(upperLeg, d0[3], d1[3], duration),
      _tweenRotation(lowerLeg, d0[4], d1[4], duration),
      _tweenRotation(foot, d0[5], d1[5], duration),
      MotionTween<Offset>(
        setter: (a) => torso.position = a,
        start: Offset(0.0, d0[6]),
        end: Offset(0.0, d1[6]),
        duration: duration,
      )
    ];

    return MotionGroup(motions: tweens);
  }

  MotionTween _tweenRotation(
      _JumpingJackPart part, double r0, double r1, double duration) {
    return MotionTween(
      setter: (a) => part.rotation = a,
      start: r0,
      end: r1,
      duration: duration,
    );
  }

  List<double> _dataForPose(int? pose) {
    if (pose == null) return _dataForCurrentPose();

    if (pose == 0) {
      return <double>[
        -80.0, // Upper arm rotation
        -30.0, // Lower arm rotation
        -10.0, // Hand rotation
        -15.0, // Upper leg rotation
        5.0, // Lower leg rotation
        15.0, // Foot rotation
        0.0 // Torso y offset
      ];
    } else if (pose == 1) {
      return <double>[0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -70.0];
    } else {
      return <double>[40.0, 30.0, 10.0, 20.0, -20.0, 15.0, 40.0];
    }
  }

  List<double> _dataForCurrentPose() {
    return <double>[
      upperArm.rotation,
      lowerArm.rotation,
      hand.rotation,
      upperLeg.rotation,
      lowerLeg.rotation,
      foot.rotation,
      torso.position.dy
    ];
  }
}

class _JumpingJackPart extends Sprite {
  String name;

  _JumpingJackPart(SpriteTexture texture, this.pivotPosition, {this.name = ''})
      : super(texture: texture);
  final Offset pivotPosition;

  void setPivotAndPosition(Offset newPosition) {
    pivot = Offset(pivotPosition.dx / 1024.0, pivotPosition.dy / 1024.0);
    position = newPosition;

    for (Node child in children) {
      _JumpingJackPart subPart = child as _JumpingJackPart;
      subPart.setPivotAndPosition(Offset(subPart.pivotPosition.dx - pivot.dx,
          subPart.pivotPosition.dy - pivot.dy));
      /*subPart.setPivotAndPosition(
          new Offset(subPart.pivotPosition.dx, subPart.pivotPosition.dy));*/
    }
  }
}

typedef _SecondPassedCallback = void Function(int seconds);
