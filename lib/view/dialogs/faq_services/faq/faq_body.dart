import 'package:flutter/material.dart';

class FaqBody extends StatelessWidget {
  const FaqBody({Key? key,required this.text}) : super(key: key);
 final text;
  @override
  Widget build(BuildContext context) {
    return  Container(color: Colors.green,
      width: MediaQuery.of(context).size.width*.5,
      height: MediaQuery.of(context).size.width*.3,
    child: Padding(
      padding: const EdgeInsets.all(38.0),
      child: Text(text),
    ),
    );
  }
}
