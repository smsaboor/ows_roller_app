import 'package:flutter/material.dart';
import 'package:ows_roller_app/model/audio_player/custom_audio.dart';
import 'package:ows_roller_app/view_model/setting_view_model.dart';
import 'package:provider/provider.dart';
import 'faq_button.dart';

class FaqButtonBar extends StatelessWidget {
  const FaqButtonBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Consumer<SettingViewModel>(
        builder: (context,obj,child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                        onTap: () {
                          CustomAudio.playAssetOnSubTap(context);
                          obj.setFaqButtonIndex(1);
                          obj.setFaqBodyIndex(1);
                        },
                        child: FaqButton(
                          title: 'Add Cash Not Coming',
                          color:obj.faqButtonIndex==1?Color(0xff0a37ec): Colors.black45
                        )),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                        onTap: () {
                          CustomAudio.playAssetOnSubTap(context);
                          obj.setFaqButtonIndex(2);
                          obj.setFaqBodyIndex(2);
                        },
                        child: FaqButton(
                          title: 'Withdraw Cash Not Coming',
                            color:obj.faqButtonIndex==2?Color(0xff0a37ec): Colors.black45
                        )),
                  ),
                ],
              ),
              SizedBox(
                width: 5,
              ),
              Column(
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                        onTap: () {
                          CustomAudio.playAssetOnSubTap(context);
                          obj.setFaqButtonIndex(3);
                          obj.setFaqBodyIndex(3);
                        },
                        child: FaqButton(
                          title: 'How to Add Cash',
                            color:obj.faqButtonIndex==3?Color(0xff0a37ec): Colors.black45
                        )),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                        onTap: () {
                          CustomAudio.playAssetOnSubTap(context);
                          obj.setFaqButtonIndex(4);
                          obj.setFaqBodyIndex(4);
                        },
                        child: FaqButton(
                          title: 'How to Withdraw Cash',
                            color:obj.faqButtonIndex==4?Color(0xff0a37ec):Colors.black45
                        )),
                  ),
                ],
              ),
              SizedBox(
                width: 5,
              ),
              Column(
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                        onTap: () {
                          CustomAudio.playAssetOnSubTap(context);
                          obj.setFaqButtonIndex(5);
                          obj.setFaqBodyIndex(5);
                        },
                        child: FaqButton(
                          title: 'How to get Bonus',
                            color:obj.faqButtonIndex==5?Color(0xff0a37ec):Colors.black45
                        )),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                        onTap: () {
                          CustomAudio.playAssetOnSubTap(context);
                          obj.setFaqButtonIndex(6);
                          obj.setFaqBodyIndex(6);
                        },
                        child: FaqButton(
                          title: '?',
                            color:obj.faqButtonIndex==6?Color(0xff0a37ec): Colors.black45
                        )),
                  ),
                ],
              ),
            ],
          );
        }
      ),
    );
  }
}
