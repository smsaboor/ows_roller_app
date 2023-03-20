import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
class LoginHeader extends StatefulWidget {
  const LoginHeader({Key? key}) : super(key: key);

  @override
  State<LoginHeader> createState() => _LoginHeaderState();
}

class _LoginHeaderState extends State<LoginHeader> {
  final Uri _url = Uri.parse('https://google.com');

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.only(top: 28.0,left: 20),
      child: SizedBox(
        height: MediaQuery.of(context).size.height*.1,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                _launchInBrowser(_url);
              },
              child: Container(
                height: MediaQuery.of(context).size.width * .13,
                width: MediaQuery.of(context).size.width * .14,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.yellowAccent),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        height: MediaQuery.of(context).size.width * .065,
                        "assets/svg/call.svg",
                        color: Colors.white,
                      ),
                      SizedBox(height: 3,),
                      Text(
                        'Service',
                        style: TextStyle(fontSize:MediaQuery.of(context).size.width * .021,color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
           Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 18.0,top: 15),
              child: Text(
                'Version: 1.0.1',
                style: TextStyle(color: Colors.white,fontSize: 12),
              ),
            )
          ],
        ),
      ),
    );
  }
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
