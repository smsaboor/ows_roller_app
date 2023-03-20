import 'package:flutter/material.dart';
import 'package:ows_roller_app/view/app_config/local/components.dart';
import 'stack_add_cash.dart';

class DialogAddCash {
  static show(BuildContext context) {
    return showDialog(
        context: context,
        builder: (_) => Center(
          child: Container(
            height: appHeight(context) * .8,
            width: appWidth(context) * .7,
            child:StackAddCash(),
          ),
        ));
  }
}
