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

import 'package:ows_roller_app/view/theme/resources/dimens/app_dimens.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ows_roller_app/view/theme/widgets/contained_input_chip.dart';
import 'package:provider/provider.dart';
import 'package:ows_roller_app/view/theme/resources/themes/theme_view_model.dart';
import 'package:ows_roller_app/view/theme/widgets/pie_chart_legend.dart';

class SamplePieChart extends StatelessWidget {
  late List<MaterialColor> supplementaryColors;
  @override
  Widget build(BuildContext context) {
    final themeViewModel = context.watch<ThemeViewModel>();
    final companyColors = themeViewModel.colors;
    supplementaryColors=companyColors.supplementaryAccentColors;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Flexible(
        //   flex: 1,
        //   child: _pieChart(companyColors.supplementaryColors, themeViewModel.primaryTextTheme),
        // ),
        // SizedBox(width: AppDimens.SIZE_SPACING_MEDIUM),
        Flexible(
          flex: 1,
          child: PieChartLegend(supplementaryColors: companyColors.supplementaryAccentColors),
        )
        // ContainedInputChip(labelText: 'Game 3 Minute', color: supplementaryColors[0],game:1),
        // ContainedInputChip(labelText: 'Game 6 Minute', color: supplementaryColors[1],game:2),
        // ContainedInputChip(labelText: 'Game 9 Minute', color: supplementaryColors[2],game:3),
        // ContainedInputChip(labelText: 'Game 1 Hour', color: supplementaryColors[3],game:4)
      ],
    );
  }

  Widget _pieChart(List<Color> supplementaryColors, TextTheme? textTheme) {
    return PieChart(
      PieChartData(
        borderData: FlBorderData(show: false),
        sectionsSpace: 0,
        centerSpaceRadius: AppDimens.SIZE_SPACING_MEDIUM,
        sections: List.generate(
          5,
          (i) => PieChartSectionData(
            color: supplementaryColors[i],
            value: 20,
            title: '20%',
            radius: 50,
            titleStyle: textTheme!.caption,
          ),
        ),
      ),
    );
  }
}
