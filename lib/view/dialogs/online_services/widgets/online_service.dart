import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class CallService extends StatelessWidget {
  const CallService({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              // UrlLauncher.launch('tel:+${p.phone.toString()}');
              Navigator.pop(context);
              launchUrl(Uri.parse("tel://7052665551"));
            },
            child: Container(
              height: MediaQuery.of(context).size.height *
                  .16,
              width: MediaQuery.of(context).size.height *
                  .16,
              decoration: BoxDecoration(
                color: Colors.indigo,
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
                    height: 1.1,
                    "assets/svg/call.svg",
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 5,),
        Text(
          'Call Us',
          style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              decoration: TextDecoration.none),
        )
      ],
    );
  }
}
