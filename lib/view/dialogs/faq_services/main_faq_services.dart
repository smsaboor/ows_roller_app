import 'package:flutter/material.dart';
import 'package:ows_roller_app/view/app_config/local/components.dart';
import 'package:ows_roller_app/view/dialogs/faq_services/widgets/body_index.dart';
import 'widgets/left_index.dart';

class MainFaqServices extends StatelessWidget {
  const MainFaqServices({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: appHeight(context) * .8,
          width: appWidth(context) * .75,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.white, width: 1.0),
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage('assets/images/img_1.png')),
          ),
          child: Row(
            children: [
              SizedBox(width: appWidth(context) * .01),
              LeftIndex(),
              SizedBox(width: appWidth(context) * .01),
              BodyIndex()
            ],
          ),
        ),
        SizedBox(
          width: appWidth(context) * .05,
        )
      ],
    );
  }
}
