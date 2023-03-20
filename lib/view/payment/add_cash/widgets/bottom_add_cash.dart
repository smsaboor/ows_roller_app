import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:ows_roller_app/view/app_config/local/components.dart';
import 'package:ows_roller_app/view/dialogs/online_services/dialog_online_services.dart';
import 'package:ows_roller_app/view_model/cash_view_model.dart';
import 'package:provider/provider.dart';


class BottomAddCash extends StatelessWidget {
  BottomAddCash({Key? key}) : super(key: key);
  final NumberFormat numberFormat = NumberFormat.decimalPattern('hi');

  @override
  Widget build(BuildContext context) {
    return  Consumer<CashViewModel>(
      builder: (context,obj,child) {
        return Container(
          height: appHeight(context) * .15,
          width: appWidth(context) * .7,
          color: Colors.green,
          child: Row(children: [
            InkWell(
              onTap: (){
                DialogOnlineServices.show(context);
              },
              child: Container(
                height: appHeight(context) * .15,
                width: appWidth(context) * .2,
                color: Colors.grey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  SvgPicture.asset(
                    height: MediaQuery.of(context).size.height * .1,
                    "assets/svg/call.svg",
                    color: Colors.white,
                  ),
                  SizedBox(width: 5,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text('If Payment fails,'),
                    Text('Please Click here')
                  ],)
                ],),
              ),
            ),
            Container(
              height: appHeight(context) * .15,
              width: appWidth(context) * .35,
              child: Row(
                mainAxisAlignment:MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text('Cash',style: TextStyle(fontSize: 16),),
                  Text(' ₹${numberFormat.format(obj.getAddCashAmount)}',style: TextStyle(fontSize: 17),),
                ],),
                SizedBox(width: appWidth(context)*.025),
                Text('+',style: TextStyle(fontSize: 28),),
                SizedBox(width: appWidth(context)*.025,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text('Bonus',style: TextStyle(fontSize: 16),),
                  Text('${numberFormat.format(obj.getAddCashBonus)} %',style: TextStyle(fontSize: 17),),
                ],),
                SizedBox(width: appWidth(context)*.017,),
                Text('=',style: TextStyle(fontSize: 25),),
                SizedBox(width: appWidth(context)*.017,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text('Total Get',style: TextStyle(fontSize: 16),),
                  Text('₹${numberFormat.format(obj.getAddCashAmount+obj.getAddCashAmount*obj.getAddCashBonus/100)}',style: TextStyle(fontSize: 17),),
                ],),
              ],),
            ),
            Container(
              height: appHeight(context) * .15,
              width: appWidth(context) * .15,
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25))),
                  onPressed: () {
                  },
                  child: Text('Recharge'),
                ),
              ),
            )
          ],),
        );
      }
    );
  }
}
