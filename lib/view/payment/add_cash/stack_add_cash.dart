import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ows_roller_app/view/app_config/local/components.dart';
import 'main_add_cash.dart';

class StackAddCash extends StatefulWidget {
  const StackAddCash({Key? key}) : super(key: key);

  @override
  State<StackAddCash> createState() => _StackAddCashState();
}

class _StackAddCashState extends State<StackAddCash> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              height: appHeight(context) * .05,
            ),
            MainAddCash()
          ],
        ),
        Positioned(
            top: appHeight(context) * .022,
            left: appWidth(context) * .626,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.yellowAccent,
                      shape: BoxShape.circle,
                    ),
                    height: appWidth(context) * .04,
                    width: appWidth(context) * .04,
                    child: const Center(
                      child: FaIcon(
                        FontAwesomeIcons.xmark,
                        color: Colors.indigo,
                        size: 15,
                      ),
                    )),
              ),
            )),
        Positioned(
          top: appHeight(context) * .01,
          left: appWidth(context) * .175,
          child:  Container(
          height: appHeight(context) * .1,
          width: appWidth(context) * .3,
          decoration: BoxDecoration(
            color: Colors.yellowAccent,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.yellowAccent, width: 2.0),
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage('assets/images/img_1.png')),
          ),
          child: Center(child: Text('Add Cash',
          style: TextStyle(fontSize: 18,color: Colors.yellowAccent, decoration: TextDecoration.none),
          ))
        ),)
      ],
    );
  }
}
