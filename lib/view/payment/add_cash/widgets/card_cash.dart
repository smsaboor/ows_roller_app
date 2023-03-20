import 'package:flutter/material.dart';
import 'package:ows_roller_app/view/app_config/local/components.dart';

class CardCash extends StatefulWidget {
  const CardCash(
      {Key? key,
      required this.amount,
      required this.bonus,
      required this.color})
      : super(key: key);
  final amount;
  final bonus;
  final color;
  @override
  State<CardCash> createState() => _CardCashState();
}

class _CardCashState extends State<CardCash> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: appWidth(context) * .23,
          height: appHeight(context) * .1,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: widget.color==true?Border.all(width:2,color: Colors.red):null,
              image: DecorationImage(
                  image: AssetImage('assets/images/img_23.png'),
                  fit: BoxFit.fill)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${widget.amount + widget.amount * widget.bonus / 100}',style: TextStyle(fontSize: appHeight(context) * .013,color: Colors.black)),
              SizedBox(
                  height: appHeight(context) * .03,
                  width: appHeight(context) * .03,
                  child: Image.asset('assets/icon/coin.png')),
              Text('Bonus ${widget.bonus}%',style: TextStyle(fontSize: appHeight(context) * .012,color: Colors.black),),
            ],
          ),
        ),
        Container(
          width: appWidth(context) * .225,
          height: appHeight(context) * .02,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/img_3.png'),
                  fit: BoxFit.fitWidth)),
          child: Center(
            child: Text(
              '₹${widget.amount}',
              style: TextStyle(color: Colors.white,fontSize: appHeight(context) * .013),
            ),
          ),
        )
      ],
    );
  }
}
