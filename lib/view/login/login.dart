import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ows_roller_app/view/app_config/local/components.dart';
import 'package:ows_roller_app/view/drawer/app_drawer.dart';
import 'package:ows_roller_app/view/login/widget/chekbox_registration.dart';
import 'package:ows_roller_app/view/login/widget/login_header.dart';
import 'package:ows_roller_app/view/login/widget/login_card.dart';
import 'package:ows_roller_app/view/theme/resources/themes/theme_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  bool showError = false;
  bool checkBoxValue = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeViewModel = context.watch<ThemeViewModel>();
    final backGroundColor = themeViewModel.colors.colorScheme.primary;
    final backGroundColorSecondary = themeViewModel.colors.colorScheme.onPrimary;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    return Scaffold(
      backgroundColor: backGroundColor,
      key: _key,
      drawer: AppDrawer(scaffoldKey: _key,),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          height: appHeight(context),
          child: Column(
            children: [
              LoginHeader(),
              SizedBox(
                height: MediaQuery.of(context).size.height * .1,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height*.6,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      LoginCard(checkBoxValue:checkBoxValue),
                      SizedBox(height: 2,),
                      CheckBoxRegistration(checkBoxValue:checkBoxValue,
                      onTap:(value){
                        setState(() {
                          checkBoxValue=value;
                        });
                      }
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.5, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}
