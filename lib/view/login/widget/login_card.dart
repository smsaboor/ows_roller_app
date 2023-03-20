import 'package:flutter/material.dart';
import 'package:flutter_package1/components.dart';
import 'package:ows_roller_app/model/base/dio_create_user.dart';
import 'package:ows_roller_app/view/app_config/local/components.dart';
import 'package:ows_roller_app/view/constants/Strings.dart';
import 'package:ows_roller_app/view/dialogs/otp_dialog/main_otp_verification.dart';
import 'package:ows_roller_app/view/home/home_page.dart';
import 'package:ows_roller_app/view/theme/resources/themes/theme_view_model.dart';
import 'package:ows_roller_app/view_model/local_view_model.dart';
import 'package:ows_roller_app/model/model/model_user.dart';
import 'package:provider/provider.dart';
import 'package:ows_roller_app/model/model/model_login_response.dart';

class LoginCard extends StatefulWidget {
  const LoginCard({Key? key, required this.checkBoxValue}) : super(key: key);
  final checkBoxValue;

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  final TextEditingController mobileController = TextEditingController();
  bool loadingFlag = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final themeViewModel = context.watch<ThemeViewModel>();
    final backGroundColor = themeViewModel.colors.colorScheme.primary;
    final backGroundColorSecondary =
        themeViewModel.colors.colorScheme.onPrimary;
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: appHeight(context) * .46,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black54),
              color: backGroundColorSecondary,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .1,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: backGroundColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Center(
                            child: Icon(
                          Icons.phone_android,
                          color: backGroundColorSecondary,
                          size: 20,
                        )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        ConstantString.loginScreenString1,
                        style: themeViewModel.baseTextTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 28.0, right: 28),
                  child: TextFormField(
                    textAlign: TextAlign.left,
                    controller: mobileController,
                    keyboardType: TextInputType.phone,
                    autofocus: false,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ConstantString.loginScreenString2;
                      }
                      if (value!.length < 10) {
                        return ConstantString.loginScreenString3;
                        return 'Mobile number must be 10 digit';
                      }
                    },
                    decoration: new InputDecoration(
                      contentPadding: EdgeInsets.all(8),
                      prefixIconColor: Colors.grey,
                      filled: true,
                      fillColor: Colors.white,
                      errorStyle: TextStyle(color: backGroundColor),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Icon(
                          Icons.phone_android,
                          color: Colors.grey,
                        ),
                      ),
                      prefixIconConstraints:
                          BoxConstraints(minHeight: 40, minWidth: 40),
                      hintText: ConstantString.loginScreenString4,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.orange)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .07,
                width: MediaQuery.of(context).size.width * .9,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 28.0, right: 28, top: 8, bottom: 8),
                  child: InkWell(
                    onTap: () {
                      login();
                    },
                    // style: ButtonStyle(side: ),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: themeViewModel.colors.colorScheme.primary),
                      child: Center(
                        child: Text(
                          ConstantString.loginScreenString5,
                          style: TextStyle(color: backGroundColorSecondary),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: .4,
                    width: MediaQuery.of(context).size.width * .15,
                    color: backGroundColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                    child: Text(
                      'OR',
                      style: TextStyle(color: backGroundColor),
                    ),
                  ),
                  Container(
                    height: .4,
                    width: MediaQuery.of(context).size.width * .15,
                    color: backGroundColor,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .07,
                width: MediaQuery.of(context).size.width * .9,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 28.0, right: 28, top: 8, bottom: 8),
                  child: InkWell(
                    onTap: () async {
                      var sharedPreferencesVM =
                          Provider.of<SharedPreferencesVM>(context,
                              listen: false);
                      sharedPreferencesVM.setLoginStatus(true);
                      await sharedPreferencesVM.setUserDetails(AppUser(
                          name: 'BB#Guest',
                          email: 'email',
                          mobile: '0000000000',
                          image: 'assets/avtar/a1.jpg',
                          userType: 'guest'));
                      navigateTo(context, MyHomePage());
                    },
                    // style: ButtonStyle(side: ),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.black45),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Row(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * .04,
                              width: MediaQuery.of(context).size.height * .04,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Icon(Icons.person),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.height * .01,
                            ),
                            Text(
                              'Play as Guest',
                              style: TextStyle(color: backGroundColorSecondary),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  login() async {
    bool loading = false;
   if(widget.checkBoxValue==true){
     if (_formKey.currentState!.validate()) {
       showDialog(
           context: context,
           builder: (_) => Center(
             child: Container(
               height: 80,
               width: 300,
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
                     Text('Loading..'),
                     SizedBox(
                       width: 20,
                     ),
                   ],
                 ),
               ),
             ),
           ));
       DioCreateUser createUser = DioCreateUser();
       LoginResponse data =
       await createUser.createUser(number: mobileController.text);
       if (data.response == 'null') {
         showToast(msg: 'oops! please try again.');
         Navigator.pop(context);
       } else {
         Navigator.pop(context);
         navigateTo(
             context,
             MainOtpVerification(
                 otp: data.otp,
                 number: mobileController.text,
                 userStatus: data.response));
         // DialogOtpVerification.show(context, data.otp,mobileController.text,data.response);
       }
     }
   }else{
     showToast(msg: 'Please confirm your age !');
   }
  }
}
