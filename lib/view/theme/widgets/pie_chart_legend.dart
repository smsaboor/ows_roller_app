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
import 'package:flutter/material.dart';
import 'package:ows_roller_app/view/theme/widgets/contained_input_chip.dart';

class PieChartLegend extends StatelessWidget {
  final List<MaterialColor> supplementaryColors;

  const PieChartLegend({Key? key, required this.supplementaryColors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppDimens.SIZE_SPACING_MEDIUM,
      direction: Axis.vertical,
      children: [
        Row(
          children: [
            ContainedInputChip(labelText: '3 Minute\n  Game', color: supplementaryColors[0],game:3),
            SizedBox(width: 5,),
            ContainedInputChip(labelText: '6 Minute\n  Game', color: supplementaryColors[2],game:6),
          ],
        ),
        Row(
          children: [
            ContainedInputChip(labelText: '9 Minute\n  Game', color: supplementaryColors[1],game:9),
            SizedBox(width: 5,),
            ContainedInputChip(labelText: '1 Hour\n Game', color: supplementaryColors[3],game:1),

          ],
        )
        // for (int i = 0; i < 4; i++)
        //   ContainedInputChip(labelText: 'Game $i Minute', color: supplementaryColors[i])
      ],
    );
  }
}
