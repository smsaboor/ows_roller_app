import 'package:flutter/material.dart';
import 'package:ows_roller_app/view/app_config/local/components.dart';

class NoteOnlineService extends StatelessWidget {
  const NoteOnlineService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: appHeight(context) * .1,
      child: Column(
        children: [
          Text(
            'If you have any questions, please contact us customer service contact time ',
            style: TextStyle(
                fontSize: 11,
                color: Colors.white,
                decoration: TextDecoration.none),
          ),
          Text(
            '8:00AM-8:00PM',
            style: TextStyle(
                fontSize: 11,
                color: Colors.yellowAccent,
                decoration: TextDecoration.none),
          ),
          Text(
            ' Monday to Sunday except National holidays.',
            style: TextStyle(
                fontSize: 11,
                color: Colors.white,
                decoration: TextDecoration.none),
          ),
        ],
      ),
    );
  }
}
