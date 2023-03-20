import 'package:flutter/material.dart';
import 'package:ows_roller_app/view/app_config/local/components.dart';
import 'package:ows_roller_app/view/theme/resources/themes/theme_view_model.dart';
import 'package:provider/provider.dart';

class CheckBoxRegistration extends StatefulWidget {
  const CheckBoxRegistration({Key? key,required this.checkBoxValue,required this.onTap}) : super(key: key);
  final checkBoxValue;
  final onTap;
  @override
  State<CheckBoxRegistration> createState() => _CheckBoxRegistrationState();
}

class _CheckBoxRegistrationState extends State<CheckBoxRegistration> {
  bool checkBoxValue=false;
  @override
  Widget build(BuildContext context) {
    final themeViewModel = context.watch<ThemeViewModel>();
    final baseTextTheme = themeViewModel.baseTextTheme;
    final onPrimaryColor = themeViewModel.colors.colorScheme.onPrimary;
    return InkWell(
      onTap: () {
        widget.onTap(checkBoxValue = !checkBoxValue);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0),
        child: SizedBox(
          height: appHeight(context)*.1,
          child: Row(
            children: [
              Checkbox(
                value: checkBoxValue ? true : false,
                checkColor: Colors.black,
                activeColor: Colors.yellowAccent,
                side: const BorderSide(
                  color: Colors.yellowAccent,
                  width: 1.2,
                ),
                onChanged: (bool? value) {

                },
              ),
              Padding(
                padding: EdgeInsets.only(right: 1.0),
                child: Row(
                  children: [
                    Text(
                      "You are 18+ and agree ",
                      maxLines: 2,
                      style: TextStyle(color: Colors.white,fontSize: 9),
                    ),
                    Text(
                      "Registration Agreement",
                      style: TextStyle(color: Colors.white,fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
