import 'package:flutter/material.dart';
import 'package:ows_roller_app/view_model/setting_view_model.dart';
import 'package:provider/provider.dart';
import 'faq_body.dart';
import 'faq_json.dart';

class FaqButtonBody extends StatelessWidget {
  const FaqButtonBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(5.0),
      child: Consumer<SettingViewModel>(
        builder: (context,obj,child) {
          return Container(
            width: MediaQuery.of(context).size.width*.5,
            height: MediaQuery.of(context).size.width*.28,
            decoration: BoxDecoration(
                color:  Colors.black45,
                borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                  obj.faqBodyIndex==1?faqJson[0]:
                  obj.faqBodyIndex==2?faqJson[1]:
                  obj.faqBodyIndex==3?faqJson[2]:
                  obj.faqBodyIndex==4?faqJson[3]:
                  obj.faqBodyIndex==5?faqJson[4]:
                  faqJson[5],style: TextStyle(color: Colors.white),
              ),
            ),
          );
        }
      ),
    );
  }
}
