import 'package:flutter/material.dart';
import 'package:ows_roller_app/view/theme/resources/icon/company_icons.dart';
import 'package:ows_roller_app/view/theme/resources/themes/theme_view_model.dart';

class ThemeSwitchBottomAppBar extends StatelessWidget {
  final CompanyIcons icons;
  final Color onPrimaryColor;
  final scaffoldKey;
  final brightness;
  final themeViewModel;

  const ThemeSwitchBottomAppBar({
    Key? key,
    required this.icons,
    required this.onPrimaryColor,
    required this.scaffoldKey,
    required this.brightness,
    required this.themeViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                brightness == Brightness.dark ? icons.lightBulbOff : icons.lightBulbOn,
                color: onPrimaryColor,
              ),
            ),
            onTap: themeViewModel.toggleBrightness,
          ),
          IconButton(
            icon: Icon(icons.menu),
            color: onPrimaryColor,
            onPressed: (){
              scaffoldKey.currentState!.openDrawer();
            }
          ),
        ],
      ),
    );
  }
}
