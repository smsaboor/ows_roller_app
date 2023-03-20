import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_package1/components.dart';
import 'package:ows_roller_app/view/app_config/local/components.dart';
import 'widgets/email.dart';
import 'widgets/online_service.dart';
import 'widgets/whatsapp.dart';
import 'widgets/note.dart';

class MainOnlineServices extends StatelessWidget {
  const MainOnlineServices({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: appHeight(context) * .66,
          width: appWidth(context) * .65,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.white, width: 1.0),
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage('assets/images/img_1.png')),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 28.0, right: 28.0),
            child: Column(
              children: [
              SizedBox(
              height: appHeight(context) * .08,),
                NoteOnlineService(),
                SizedBox(
                  height: appHeight(context) * .02,),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '1. Quick Contact',
                    style: TextStyle(
                        fontSize: 11,
                        color: Colors.white,
                        decoration: TextDecoration.none),
                  ),
                ),
                SizedBox(
                  height: appHeight(context) * .3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SizedBox(width: appWidth(context)*.1,),
                            CallService(),
                            Spacer(),
                            WhatsappService(),
                            Spacer(),
                            EmailService(),
                            SizedBox(width: appWidth(context)*.1,),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: appHeight(context) * .1,
                  color: Colors.black45,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Email:        blackbull@gmail.com',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              decoration: TextDecoration.none),
                        ),
                        Spacer(),
                        SizedBox(
                            height: 45,
                            width: 70,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                                onPressed: ()async{
                              await Clipboard.setData(ClipboardData(text: "blackbull@gmail.com"));
                              showToast(msg: 'text copied');
                            }, child: Text('Copy')))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: appWidth(context) * .05,
        )
      ],
    );
  }
}
