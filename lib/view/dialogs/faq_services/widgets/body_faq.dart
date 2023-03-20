import 'dart:ui';
import 'package:flutter/material.dart';
import '../faq/faq_button_bar.dart';
import '../faq/faq_button_body.dart';

class BodyFaq extends StatelessWidget {
  const BodyFaq({Key? key}) : super(key: key);

  final bool flagUserData=true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FaqButtonBar(),
              FaqButtonBody(),
            ],
          ),
        ),
      ),
    );
  }
}
