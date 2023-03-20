import 'package:flutter/material.dart';

class BodyGameHistory extends StatelessWidget {
  const BodyGameHistory({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.pinkAccent, borderRadius: BorderRadius.circular(10),
      ),
      child: Column(children: [
        Container(
          height: 30,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: Color(0xff0a37ec)),
          child: Padding(
            padding: const EdgeInsets.only(left: 60.0,right: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Date',style: TextStyle(fontSize: 15,color: Colors.white),),
                Spacer(),
                Text('Game',style: TextStyle(fontSize: 15,color: Colors.white),),
                Spacer(),
                Text('Cash',style: TextStyle(fontSize: 15,color: Colors.white),)
              ],),
          ),)
      ],),
    );
  }
}
