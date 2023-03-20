import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_package1/components.dart';
import 'package:ows_roller_app/model/base/dio_create_user.dart';
import 'package:ows_roller_app/view/app_config/local/components.dart';
import 'package:ows_roller_app/view/constants/Strings.dart';
import 'package:ows_roller_app/view/home/home_page.dart';
import 'package:ows_roller_app/view_model/local_view_model.dart';
import 'package:ows_roller_app/model/model/model_user.dart';
import 'package:provider/provider.dart';
import 'package:ows_roller_app/model/model/model_login_response.dart';
import 'package:ows_roller_app/model/model/model_login_response2.dart';

class ReferralCode extends StatefulWidget {
  const ReferralCode({Key? key, required this.mobile}) : super(key: key);
  final mobile;
  @override
  State<ReferralCode> createState() => _ReferralCodeState();
}

class _ReferralCodeState extends State<ReferralCode> {
  TextEditingController referralIdController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: appHeight(context),
            width: appWidth(context),
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/img_3.png')),
            ),
            child: Padding(
                padding: const EdgeInsets.all(40),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: appHeight(context)*.1,),
                        SizedBox(
                          height: appHeight(context) * .14,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  ConstantString.referralScreenString1,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 45,
                          width: appWidth(context) * .80,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 18.0, right: 18),
                            child: TextFormField(
                              textAlign: TextAlign.left,
                              controller: referralIdController,
                              keyboardType: TextInputType.text,
                              inputFormatters: [UpperCaseTextFormatter()],
                              autofocus: false,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ConstantString.referralScreenString4;
                                }
                              },
                              decoration: new InputDecoration(
                                contentPadding: EdgeInsets.all(8),
                                prefixIconColor: Colors.grey,
                                filled: true,
                                fillColor: Colors.white,
                                errorStyle: TextStyle(color: Colors.white),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Icon(
                                    Icons.numbers,
                                    color: Colors.grey,
                                  ),
                                ),
                                prefixIconConstraints:
                                    BoxConstraints(minHeight: 40, minWidth: 40),
                                hintText: ConstantString.referralScreenString5,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintStyle:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                                border: new OutlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: Colors.orange)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        SizedBox(
                          height: 65,
                          width: MediaQuery.of(context).size.width * .90,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 18.0, right: 18, top: 8, bottom: 8),
                            child: InkWell(
                              onTap: () {
                                verifyReferralCode(context);
                              },
                              // style: ButtonStyle(side: ),
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      image: DecorationImage(
                                          image: AssetImage(
                                            'assets/bg/otp.png',
                                          ),
                                          fit: BoxFit.fill)),
                                  child: Center(
                                    child: Text(
                                      ConstantString.continueString,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .08,
                          width: MediaQuery.of(context).size.width * .7,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ConstantString.referralScreenString2,
                                maxLines: 2,
                                style: TextStyle(color: Colors.white,fontSize: 11),
                              ),
                              Row(
                                children: [
                                  Text(
                                    ConstantString.referralScreenString22,
                                    maxLines: 2,
                                    style: TextStyle(color: Colors.white,fontSize: 11),
                                  ),
                                  Icon(Icons.arrow_upward_outlined,size: 14,color: Colors.white,)
                                ],
                              ),

                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: .4,
                              width: appWidth(context) * .3,
                              color: Colors.white,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 5.0, right: 5.0),
                              child: Text(
                                'OR',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Container(
                              height: .4,
                              width: appWidth(context) * .3,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: appHeight(context) * .02,
                        ),
                        SizedBox(
                          height: 75,
                          width: appWidth(context) * .8,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15, top: 8, bottom: 8),
                            child: InkWell(
                              onTap: () {
                                var sharedPreferencesVM =
                                Provider.of<SharedPreferencesVM>(context, listen: false);
                                sharedPreferencesVM.setLoginStatus(true);
                                navigateTo(context, MyHomePage());
                              },
                              // style: ButtonStyle(side: ),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Colors.blueGrey.shade400),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 25.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        ConstantString.referralScreenString3,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .04),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: appHeight(context) * .03,
                        ),
                      ],
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
  verifyReferralCode(BuildContext context) async {
    bool loading = false;
    if (_formKey.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (_) => Center(
                child: Container(
                  height: 60,
                  width: 200,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          height: 25,
                          width: 25,
                          child: CircularProgressIndicator(),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text('Loading..',style: TextStyle(fontSize: 12),),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ));
      DioCreateUser createUser = DioCreateUser();
      LoginResponse2 data = await createUser.verifyReferral(
          number: widget.mobile, referralId: referralIdController.text.toUpperCase());
      print('verifyReferralCode:${data.response}');
      if (data.response == 'null'){
        showToast(msg: ConstantString.oopsTryAgain);
        Navigator.pop(context);
      }
      if (data.response == '0') {
        showToast(msg: ConstantString.oopsWrongReferral);
        Navigator.pop(context);
      }
      if (data.response == '1') {
        var sharedPreferencesVM = Provider.of<SharedPreferencesVM>(context, listen: false);
        sharedPreferencesVM.setLoginStatus(true);
        sharedPreferencesVM.setUserDetails(AppUser(
            name: data.id.toString(),
            email: data.refferal,
            mobile: data.mobile.toString(),
            image: 'assets/avtar/a1.jpg',
            userType: 'mobile'
        ));
        navigateAndFinsh(context, MyHomePage());
      }
    }
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
