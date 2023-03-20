/*
 * Copyright 2020 Cagatay Ulusoy (Ulus Oy Apps). All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import 'package:flutter/material.dart';
import 'package:flutter_package1/components.dart';
import 'package:ows_roller_app/view/app_config/local/components.dart';
import 'package:ows_roller_app/view/roller/game_home/game_home.dart';
import 'package:provider/provider.dart';
import 'package:ows_roller_app/view/theme/resources/themes/theme_view_model.dart';

class ContainedInputChip extends StatelessWidget {
  final String labelText;
  final MaterialColor color;
  final game;

  const ContainedInputChip(
      {required this.labelText, required this.color, required this.game});

  @override
  Widget build(BuildContext context) {
    final themeViewModel = context.watch<ThemeViewModel>();
    final backgroundColor = themeViewModel.isDark ? color.shade200 : color
        .shade500;
    return ActionChip(
      backgroundColor: backgroundColor,
      label: Container(
        width: appWidth(context)*.35,
        height: appWidth(context)*.25,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              labelText.toString().substring(0,1),
              style: themeViewModel.primaryTextTheme.headline2,
            ),
            SizedBox(width: 3,),
            Text(
              labelText.toString().substring(2),
              maxLines: 2,
              style: themeViewModel.primaryTextTheme.headline6,
            ),
          ],
        ),
      ),
      onPressed: () {
        navigateTo(
            context,
            GameHome(
                minute: game,
                image: game,
                api: game == 3 ? "three_min_slot_api.php" : game == 6
                    ? "six_min_slot_api.php"
                    : game == 9 ? "nine_min_slot_api.php":"one_hour_slot_api.php"));
      },
    );
  }
}
