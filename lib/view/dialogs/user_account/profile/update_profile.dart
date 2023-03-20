import 'package:flutter/material.dart';
import 'package:ows_roller_app/view/app_config/local/components.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:ows_roller_app/view_model/local_view_model.dart';
import 'package:ows_roller_app/model/model/model_user.dart';
import 'package:provider/provider.dart';

class UpdateProfile extends StatefulWidget {
  UpdateProfile({Key? key}) : super(key: key);
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
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  bool flagUserData = true;
  late final SharedPreferencesVM sharedPreferencesVM;
  AppUser? appUser;

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
    sharedPreferencesVM =
        Provider.of<SharedPreferencesVM>(context, listen: false);
    getUserDetails(context);
  }

  @override
  Widget build(BuildContext context) {
    double textFieldHeight = appHeight(context) * .04;
    final textFieldWidth = appWidth(context) * .75;
    return flagUserData
        ? SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(),
          )
        : Column(
            children: [
              Container(
                height: appHeight(context) * .28,
                child: Column(
                  children: [
                    SizedBox(
                      height: textFieldHeight,
                      width: textFieldWidth,
                      child: new TextFormField(
                        enabled: false,
                        textAlignVertical: TextAlignVertical.center,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 20.0, color: Colors.red),
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          contentPadding: EdgeInsets.all(8),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.grey,
                            size: 26,
                          ),
                          isDense: true,
                          filled: true,
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: new BorderSide(
                                color: Colors.orange,
                              )),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                          ),
                          labelText: appUser!.userType == "mobile"
                              ? appUser!.name
                              : 'BB#Guest',
                          // disabledBorder: InputBorder.none,
                          labelStyle:
                              TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: appHeight(context) * .01,
                    ),
                    SizedBox(
                      height: textFieldHeight,
                      width: textFieldWidth,
                      child: new TextFormField(
                        enabled: appUser!.userType == "mobile" ? false : true,
                        textAlignVertical: TextAlignVertical.center,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16.0, color: Colors.red),
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          contentPadding: EdgeInsets.all(8),
                          prefixIcon: Icon(
                            Icons.numbers,
                            color: Colors.grey,
                            size: 26,
                          ),
                          isDense: true,
                          filled: true,
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: new BorderSide(
                                color: Colors.orange,
                              )),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                          ),
                          labelText: appUser!.userType == "mobile"
                              ? appUser!.email
                              : 'Enter Referral ID',
                          // disabledBorder: InputBorder.none,
                          labelStyle:
                              TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: appHeight(context) * .01,
                    ),
                    SizedBox(
                      height: textFieldHeight,
                      width: textFieldWidth,
                      child: new TextFormField(
                        enabled: appUser!.userType == "mobile" ? false : true,
                        textAlignVertical: TextAlignVertical.center,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16.0, color: Colors.red),
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          contentPadding: EdgeInsets.all(8),
                          prefixIcon: Icon(
                            Icons.phone_android_outlined,
                            size: 26,
                            color: Colors.grey,
                          ),
                          isDense: true,
                          filled: true,
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: new BorderSide(
                                color: Colors.orange,
                              )),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                          ),
                          labelText: appUser!.userType == "mobile"
                              ? appUser!.mobile
                              : 'Enter Mobile Number',
                          // disabledBorder: InputBorder.none,
                          labelStyle:
                              TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, left: 34, right: 28, bottom: 20),
                      child: Text(
                          'Carefully fill above details (If found incorrect no withdrawal will be processed)'),
                    ),
                    Container(
                      color: Colors.black45,
                      height: .5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GlowText(
                        glowColor: Colors.black,
                        'Choose Profile Picture',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: appHeight(context) * .01,
              ),
              Container(
                height: appHeight(context) * .2,
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  children: List.generate(
                    UpdateProfile.assetList.length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            setUserDetails(context,
                                'assets/avtar/${UpdateProfile.assetList[index]}${UpdateProfile.assetList[index] == 'a7' || UpdateProfile.assetList[index] == 'a9' ? '.png' : '.jpg'}');
                          },
                          child: Stack(
                            children: [
                              Container(
                                height: appHeight(context) * .1,
                                width: appHeight(context) * .1,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/avtar/${UpdateProfile.assetList[index]}${UpdateProfile.assetList[index] == 'a7' || UpdateProfile.assetList[index] == 'a9' ? '.png' : '.jpg'}')),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                ),
                              ),
                              appUser!.image ==
                                      'assets/avtar/${UpdateProfile.assetList[index]}${UpdateProfile.assetList[index] == 'a7' || UpdateProfile.assetList[index] == 'a9' ? '.png' : '.jpg'}'
                                  ? Positioned(
                                      top: appHeight(context) * .05,
                                      left: appHeight(context) * .04,
                                      child: Image.asset(
                                        'assets/avtar/select1.png',
                                        scale: 15,
                                      ))
                                  : Container()
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: appHeight(context) * .01,
              ),
            ],
          );
  }
}
