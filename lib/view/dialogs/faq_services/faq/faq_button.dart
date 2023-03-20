import 'package:flutter/material.dart';

class FaqButton extends StatelessWidget {
  const FaqButton({Key? key, required this.title, required this.color})
      : super(key: key);
  final title;
  final color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(5)),
      width: MediaQuery.of(context).size.width * .15,
      height: MediaQuery.of(context).size.height * .09,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(
            title,
            style: TextStyle(color:Colors.white,fontSize: 12,fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
