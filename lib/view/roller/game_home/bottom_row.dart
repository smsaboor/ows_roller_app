
import 'package:flutter/material.dart';
import 'package:ows_roller_app/view/app_config/local/components.dart';

class BottomRow extends StatefulWidget {
  const BottomRow({Key? key}) : super(key: key);

  @override
  State<BottomRow> createState() => _BottomRowState();
}

class _BottomRowState extends State<BottomRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      color: Colors.transparent,
      width: double.infinity,
      child: Row(
        children: [
          Container(
              color: Colors.transparent,
              width: appWidth(context)*.87),
        Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 82,
              width: appWidth(context)*.12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(0)),
                image: DecorationImage(
                  image: AssetImage("assets/images/gold2.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  'Bet',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ],),
    );
  }
}
