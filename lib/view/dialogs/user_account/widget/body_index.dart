import 'package:flutter/material.dart';
import 'package:ows_roller_app/view/app_config/local/components.dart';
import 'package:ows_roller_app/view/dialogs/user_account/widget/body_profile.dart';
import 'package:ows_roller_app/view/dialogs/user_account/widget/body_transaction_history.dart';
import 'package:ows_roller_app/view_model/setting_view_model.dart';
import 'package:provider/provider.dart';
import 'body_game_history.dart';

class BodyIndex extends StatelessWidget {
  const BodyIndex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingViewModel>(
        builder: (context, obj, child) {
          return Container(
            height: appHeight(context) * .785,
            width: appWidth(context) * .522,
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: obj.accountButtonIndex == 1
                    ? BodyProfile()
                    : obj.accountButtonIndex == 2
                    ? BodyTransactionHistory()
                    : BodyGameHistory()
            ),
          );
        }
    );
  }
}
