import 'package:flutter/material.dart';
import 'package:ows_roller_app/view/roller/game_home/panel_odd_even.dart';
import 'package:ows_roller_app/view/roller/game_home/panel_small_large.dart';
import 'package:ows_roller_app/view/theme/resources/themes/theme_view_model.dart';
import 'package:provider/provider.dart';

class PanelRow extends StatelessWidget {
  const PanelRow(
      {Key? key, required this.title, required this.boll, required this.bgColor})
      : super(key: key);
  final title;
  final boll;
  final bgColor;

  @override
  Widget build(BuildContext context) {
    final themeViewModel = context.watch<ThemeViewModel>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 15,),
        Center(
          child: Text(
            title.toString(),
            style: themeViewModel.baseTextTheme.bodyLarge,
          ),
        ),
        SizedBox(width: 10),
        PanelOddEven(bgColor: bgColor, boll: boll),
        SizedBox(width: 10),
        PanelSmallLarge(bgColor: bgColor, boll: boll),
      ],
    );
  }
}
