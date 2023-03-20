import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_package1/components.dart';
import 'package:ows_roller_app/model/audio_player/custom_audio.dart';
import 'package:ows_roller_app/model/local/local_data.dart';
import 'package:ows_roller_app/view/login/login.dart';
import 'package:ows_roller_app/view/home/home_page.dart';
import 'package:ows_roller_app/view_model/api_view_model.dart';
import 'package:ows_roller_app/view_model/local_view_model.dart';
import 'package:ows_roller_app/view_model/roller_view_model.dart';
import 'package:ows_roller_app/view_model/setting_view_model.dart';
import 'package:ows_roller_app/view_model/cash_view_model.dart';
import 'package:ows_roller_app/view_model/bet_view_model.dart';
import 'package:ows_roller_app/view_model/timer_view_model.dart';
import 'package:provider/provider.dart';
import 'package:ows_roller_app/view/theme/resources/themes/theme_view_model.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global=new MyHttpOverrides();
  LocalData.init();
  await CustomAudio.setPlayersAssets();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  bool displaySplash = true;
  bool shouldPop = false;
  static const MethodChannel _channel =
      const MethodChannel('move_to_background');
  SettingViewModel settingViewModel = SettingViewModel();
  /// Calls the platform-specific function to send the app to the background
  Future<void> moveTaskToBack(BuildContext context) async {
    await _channel.invokeMethod('moveTaskToBack');
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<RollerViewModel>(
          create: (context) => RollerViewModel()),
      ChangeNotifierProvider<SettingViewModel>(
          create: (context) => SettingViewModel()),
      ChangeNotifierProvider<ApiViewModel>(create: (context) => ApiViewModel()),
      ChangeNotifierProvider<BetViewModel>(create: (context) => BetViewModel()),
      ChangeNotifierProvider<SharedPreferencesVM>(
          create: (context) => SharedPreferencesVM(localData: LocalData())),
      ChangeNotifierProvider<SettingViewModel>(
          create: (context) => SettingViewModel()),
      ChangeNotifierProvider<CashViewModel>(
          create: (context) => CashViewModel()),
      ChangeNotifierProvider<TimerViewModel>(
          create: (context) => TimerViewModel()),
      ChangeNotifierProvider<ThemeViewModel>(
        create: (context) => ThemeViewModel(),
      ),
    ], child: SelectHome());
  }
}

class SelectHome extends StatefulWidget {
  const SelectHome({Key? key}) : super(key: key);

  @override
  State<SelectHome> createState() => _SelectHomeState();
}

class _SelectHomeState extends State<SelectHome> {
  bool loading = true;
  late bool loginStatus;

  getLoginStatus() async {
    try {
      var sharedPreferencesVM =
          Provider.of<SharedPreferencesVM>(context, listen: false);
      loginStatus = await sharedPreferencesVM.getLoginStatus();
    } catch (e) {
      showToast(msg: 'exc:: $e');
      print('exc:: $e');
    }
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    // CustomAudio.playAssetRoller(context);
    getLoginStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeViewModel = context.watch<ThemeViewModel>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeViewModel.currentTheme.themeData,
      title: 'Black Bull',
      color: Colors.red,
      home: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : loginStatus
              ? MyHomePage()
              : LoginScreen(),
      // home:FitnessDemo(),
      builder: EasyLoading.init(),
      // home: displaySplash?const SplashScreen():const HomeScreen(),
    );
  }
}


