import 'package:flutter/material.dart';
class RollerCustomFormField extends StatelessWidget {
  const RollerCustomFormField(
      {Key? key,required this.number})
      : super(key: key);
  // final TextEditingController controlller;
  // final errorMsg;
  // final labelText;
  // final icon;
  // final textInputType;
  // final readOnly;
  final number;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(number,style: TextStyle(color: Colors.white),),
          SizedBox(height: 5,),
          Theme(
            data: new ThemeData(
              primaryColor: Colors.redAccent,
              primaryColorDark: Colors.red,
            ),
            child: SizedBox(
              height: 45,
              width: MediaQuery.of(context).size.width*.2,
              child: new TextFormField(
                textAlignVertical: TextAlignVertical.center,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.0, color: Colors.red),
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  contentPadding: EdgeInsets.all(8),
                  isDense: true,
                  filled: true,
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.orange)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  labelText: '₹',
                  disabledBorder: InputBorder.none,
                  labelStyle: TextStyle(fontSize: 14,color: Colors.black54),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
