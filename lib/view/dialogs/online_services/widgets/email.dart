import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

class EmailService extends StatelessWidget {
  const EmailService({Key? key}) : super(key: key);
  Future<void> send() async {
    await launchUrl(Uri.parse("mailto:mca.saboor@gmail.com?subject=Black Bull Help&body=Hi I want some help."));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
              send();
            },
            child: Container(
              height: MediaQuery.of(context).size.height *
                  .16,
              width: MediaQuery.of(context).size.height *
                  .16,
              decoration: BoxDecoration(
                color: Colors.pink,
                border: Border.all(
                    color: Colors.yellowAccent),
                borderRadius: BorderRadius.circular(90),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height:
                  MediaQuery.of(context).size.height *
                      .1,
                  width:
                  MediaQuery.of(context).size.height *
                      .1,
                  child: SvgPicture.asset(
                    height: 2,
                    "assets/svg/email.svg",
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 2,),
        Text(
          'Contact Email',
          style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              decoration: TextDecoration.none),
        )
      ],
    );
  }
}
