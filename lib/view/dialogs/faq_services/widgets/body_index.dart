import 'package:flutter/material.dart';
import 'package:ows_roller_app/view/app_config/local/components.dart';
import 'package:ows_roller_app/view/dialogs/faq_services/widgets/body_faq.dart';
import 'package:ows_roller_app/view_model/setting_view_model.dart';
import 'package:provider/provider.dart';

class BodyIndex extends StatelessWidget {
  const BodyIndex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingViewModel>(builder: (context, obj, child) {
      return Container(
        height: appHeight(context) * .785,
        width: appWidth(context) * .522,
        child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: obj.selectedTabsIndex == 1
                ? BodyFaq()
                : obj.selectedTabsIndex == 2
                    ? Dialog()
                    : obj.selectedTabsIndex == 3
                        ? Dialog()
                        : Dialog()),
      );
    });
  }
}
