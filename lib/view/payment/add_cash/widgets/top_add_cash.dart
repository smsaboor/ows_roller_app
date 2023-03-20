import 'package:flutter/material.dart';
import 'package:ows_roller_app/model/audio_player/custom_audio.dart';
import 'package:ows_roller_app/view/app_config/local/components.dart';
import 'package:ows_roller_app/view/payment/add_cash/widgets/card_cash.dart';
import 'package:ows_roller_app/view_model/cash_view_model.dart';
import 'package:provider/provider.dart';

class TopAddCash extends StatefulWidget {
  const TopAddCash({Key? key}) : super(key: key);

  @override
  State<TopAddCash> createState() => _TopAddCashState();
}

class _TopAddCashState extends State<TopAddCash> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: appHeight(context) * .6,
      width: appWidth(context),
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Consumer<CashViewModel>(builder: (context, obj, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        CustomAudio.playAssetOnTap(context);
                        obj.setAddCashIndex(1);
                      },
                      child: CardCash(
                        amount: obj.Card1Amount,
                        bonus: obj.Card1Bonus,
                        color:obj.getAddCashIndex==1?true:false,
                      )),
                  SizedBox(
                    width: 6,
                  ),
                  InkWell(
                      onTap: () {
                        CustomAudio.playAssetOnTap(context);
                        obj.setAddCashIndex(2);
                      },
                      child: CardCash(
                        amount: obj.Card2Amount,
                        bonus: obj.Card2Bonus,
                        color:obj.getAddCashIndex==2?true:false,
                      )),
                  SizedBox(
                    width: 6,
                  ),
                  InkWell(
                      onTap: () {
                        CustomAudio.playAssetOnTap(context);
                        obj.setAddCashIndex(3);
                      },
                      child: CardCash(
                        amount: obj.Card3Amount,
                        bonus: obj.Card3Bonus,
                        color:obj.getAddCashIndex==3?true:false,
                      )),
                  SizedBox(
                    width: 6,
                  ),
                  InkWell(
                      onTap: () {
                        CustomAudio.playAssetOnTap(context);
                        obj.setAddCashIndex(4);
                      },
                      child: CardCash(
                        amount: obj.Card4Amount,
                        bonus: obj.Card4Bonus,
                        color:obj.getAddCashIndex==4?true:false,
                      )),
                  SizedBox(
                    width: 6,
                  ),
                  InkWell(
                      onTap: () {
                        CustomAudio.playAssetOnTap(context);
                        obj.setAddCashIndex(5);
                      },
                      child: CardCash(
                        amount: obj.Card5Amount,
                        bonus: obj.Card5Bonus,
                        color:obj.getAddCashIndex==5?true:false,
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      CustomAudio.playAssetOnTap(context);
                      obj.setAddCashIndex(6);
                    },
                    child: CardCash(
                      amount: obj.Card6Amount,
                      bonus: obj.Card6Bonus,
                      color:obj.getAddCashIndex==6?true:false,
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  InkWell(
                    onTap: (){
                      CustomAudio.playAssetOnTap(context);
                      obj.setAddCashIndex(7);
                    },
                    child: CardCash(
                      amount: obj.Card7Amount,
                      bonus: obj.Card7Bonus,
                      color:obj.getAddCashIndex==7?true:false,
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  InkWell(
                    onTap: (){
                      CustomAudio.playAssetOnTap(context);
                      obj.setAddCashIndex(8);
                    },
                    child: CardCash(
                      amount: obj.Card8Amount,
                      bonus: obj.Card8Bonus,
                      color:obj.getAddCashIndex==8?true:false,
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  InkWell(
                    onTap: (){
                      CustomAudio.playAssetOnTap(context);
                      obj.setAddCashIndex(9);
                    },
                    child: CardCash(
                      amount: obj.Card9Amount,
                      bonus: obj.Card9Bonus,
                      color:obj.getAddCashIndex==9?true:false,
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  InkWell(
                    onTap: (){
                      CustomAudio.playAssetOnTap(context);
                      obj.setAddCashIndex(10);
                    },
                    child: CardCash(
                      amount: obj.Card10Amount,
                      bonus: obj.Card10Bonus,
                      color:obj.getAddCashIndex==10?true:false,
                    ),
                  ),
                ],
              )
            ],
          );
        }),
      ),
    );
  }
}
