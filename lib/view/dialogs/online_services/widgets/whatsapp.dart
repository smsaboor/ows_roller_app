import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp_share2/whatsapp_share2.dart';

class WhatsappService extends StatelessWidget {
  WhatsappService({Key? key}) : super(key: key);
  final String _phone = '917052665551';

  Future<void> share() async {
    await WhatsappShare.share(
      text: 'Example share text',
      linkUrl: 'https://flutter.dev/',
      phone: _phone,
    );
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
              share();
            },
            child: Container(
              height: MediaQuery.of(context).size.height *
                  .16,
              width: MediaQuery.of(context).size.height *
                  .16,
              decoration: BoxDecoration(
                color: Colors.green,
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
                    "assets/svg/whatsapp.svg",
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 5,),
        Text(
          'WhatsApp',
          style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              decoration: TextDecoration.none),
        )
      ],
    );
  }
}
