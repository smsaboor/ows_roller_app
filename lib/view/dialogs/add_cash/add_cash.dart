import 'package:flutter/material.dart';
import 'package:flutter_package1/components.dart';
import 'package:intl/intl.dart';
import 'package:ows_roller_app/view/app_config/local/components.dart';
import 'package:ows_roller_app/view/payment/payment_mode.dart';
import 'package:ows_roller_app/view_model/cash_view_model.dart';
import 'package:ows_roller_app/view_model/local_view_model.dart';
import 'package:ows_roller_app/model/model/model_user.dart';
import 'package:provider/provider.dart';
import 'package:ows_roller_app/view/payment/add_cash/widgets/card_cash.dart';

class AddCash extends StatefulWidget {
  AddCash({Key? key}) : super(key: key);
  static List<String> assetList = [
    'a1',
    'a2',
    'a3',
    'a4',
    'a5',
    'a6',
    'a7',
    'a8',
    'a9'
  ];
  @override
  State<AddCash> createState() => _AddCashState();
}

class _AddCashState extends State<AddCash> {
  bool flagUserData = true;
  late final SharedPreferencesVM sharedPreferencesVM;
  AppUser? appUser;
  late final List<BonusCard> bonusList;
  final NumberFormat numberFormat = NumberFormat.decimalPattern('hi');
  late final provider;

  getUserDetails(BuildContext context) async {
    setState(() {
      flagUserData = true;
    });
    print('-----getUserDetails------------------');
    appUser = await sharedPreferencesVM.getUserDetails();
    print('-----getUserDetails-------------------${appUser}');
    setState(() {
      flagUserData = false;
    });
  }

  setUserDetails(BuildContext context, image) async {
    print('-----setUserDetails------------------');
    await sharedPreferencesVM.setUserDetails(AppUser(
      name: appUser!.name,
      email: appUser!.email,
      mobile: appUser!.mobile,
      image: image,
      userType: appUser!.userType,
    ));
    print('-----getUserDetails-------------------${appUser}');
    getUserDetails(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<CashViewModel>(context, listen: false);
    bonusList = [
      BonusCard(amount: provider.Card1Amount, bonus: provider.Card1Bonus),
      BonusCard(amount: provider.Card2Amount, bonus: provider.Card2Bonus),
      BonusCard(amount: provider.Card3Amount, bonus: provider.Card3Bonus),
      BonusCard(amount: provider.Card4Amount, bonus: provider.Card4Bonus),
      BonusCard(amount: provider.Card5Amount, bonus: provider.Card5Bonus),
      BonusCard(amount: provider.Card6Amount, bonus: provider.Card6Bonus),
      BonusCard(amount: provider.Card7Amount, bonus: provider.Card7Bonus),
      BonusCard(amount: provider.Card8Amount, bonus: provider.Card8Bonus),
      BonusCard(amount: provider.Card9Amount, bonus: provider.Card9Bonus),
      BonusCard(amount: provider.Card10Amount, bonus: provider.Card10Bonus),
    ];
    sharedPreferencesVM =
        Provider.of<SharedPreferencesVM>(context, listen: false);
    getUserDetails(context);
  }

  @override
  Widget build(BuildContext context) {
    final fontSize = appHeight(context) * .016;
    return flagUserData
        ? SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(),
          )
        : Consumer<CashViewModel>(builder: (context, obj, child) {
            return Column(
              children: [
                SizedBox(
                  height: appHeight(context) * .02,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Container(
                    height: appHeight(context) * .45,
                    child: GridView.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: 6.0,
                      mainAxisSpacing: 6.0,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      children: List.generate(
                        bonusList.length,
                        (index) {
                          return InkWell(
                            onTap: () {
                              obj.setAddCashIndex(index + 1);
                            },
                            child: Stack(
                              children: [
                                CardCash(
                                  amount: bonusList[index].amount,
                                  bonus: bonusList[index].bonus,
                                  color: obj.getAddCashIndex == index + 1
                                      ? true
                                      : false,
                                ),
                                obj.getAddCashIndex == index + 1
                                    ? Positioned(
                                        top: 5,
                                        left: 5,
                                        child: Image.asset(
                                          'assets/avtar/select3.png',
                                          scale: 20,
                                        ))
                                    : Container()
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  height: appHeight(context) * .06,
                  width: appWidth(context) * .9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Cash',
                            style: TextStyle(fontSize: fontSize),
                          ),
                          Text(
                            ' ₹${numberFormat.format(obj.getAddCashAmount)}',
                            style: TextStyle(fontSize: fontSize),
                          ),
                        ],
                      ),
                      SizedBox(width: appWidth(context) * .025),
                      Text(
                        '+',
                        style: TextStyle(fontSize: fontSize),
                      ),
                      SizedBox(
                        width: appWidth(context) * .025,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Bonus',
                            style: TextStyle(fontSize: fontSize),
                          ),
                          Text(
                            '${numberFormat.format(obj.getAddCashBonus)} %',
                            style: TextStyle(fontSize: fontSize),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: appWidth(context) * .017,
                      ),
                      Text(
                        '=',
                        style: TextStyle(fontSize: fontSize),
                      ),
                      SizedBox(
                        width: appWidth(context) * .017,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Total Get',
                            style: TextStyle(fontSize: fontSize),
                          ),
                          Text(
                            '₹${numberFormat.format(obj.getAddCashAmount + obj.getAddCashAmount * obj.getAddCashBonus / 100)}',
                            style: TextStyle(fontSize: fontSize),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: appWidth(context) * .05,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black),
                          onPressed: () {
                            // showToast(msg: 'payment gateway in process');
                            navigateTo(
                                context,
                                PaymentMode(
                                    memberId: '1',
                                    userId: appUser!.name,
                                    fees: '${obj.getAddCashAmount.toString()}',
                                    bookingType: 'Full',
                                    onTap: () {
                                      showToast(msg: 'Completed');
                                    },
                                    name: 'Black Bull ${appUser!.name}'));
                          },
                          child: Text(
                            'Add',
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  ),
                ),
              ],
            );
          });
  }
}

class BonusCard {
  BonusCard({required this.amount, required this.bonus});

  final amount;
  final bonus;
}
