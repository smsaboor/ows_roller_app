import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_package1/components.dart';
import 'package:ows_roller_app/model/base/dio_create_user.dart';
import 'package:ows_roller_app/view/app_config/local/components.dart';
import 'package:ows_roller_app/view/login/referal_code.dart';
import 'package:ows_roller_app/view_model/local_view_model.dart';
import 'package:ows_roller_app/model/model/model_user.dart';
import 'package:provider/provider.dart';
import 'package:ows_roller_app/view/home/home_page.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:ows_roller_app/model/model/model_login_response.dart';

class MainOtpVerification extends StatefulWidget {
  const MainOtpVerification(
      {Key? key,
      required this.otp,
      required this.userStatus,
      required this.number})
      : super(key: key);
  final otp, number;
  final userStatus;

  @override
  State<MainOtpVerification> createState() => _MainOtpVerificationState();
}

class _MainOtpVerificationState extends State<MainOtpVerification>
  with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  int levelClock = 1 * 60;
  String _code="";
  String signature = "MpbWz8nU4Xu";


  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _pinController = TextEditingController();

  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  late FocusNode text1, text2, text3, text4;
  bool isVerify = false;


  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(seconds: levelClock));
    _animationController!.forward();
    _listenSmsCode();
    text1 = FocusNode();
    text2 = FocusNode();
    text3 = FocusNode();
    text4 = FocusNode();
  }
  _listenSmsCode() async {
    await SmsAutoFill().listenForCode();
  }

  @override
  Future<void> dispose() async{
    SmsAutoFill().unregisterListener();
    _animationController!.dispose();
    text1.dispose();
    text2.dispose();
    text3.dispose();
    text4.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify Otp'),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 56,
            width: appWidth(context)*.4,
            child: ElevatedButton(
              onPressed: () async {
               DioCreateUser createUser = DioCreateUser();
                LoginResponse data = await createUser.createUser(number: widget.number);
                if (data.response == 'null') {
                  showToast(msg: 'oops! please try again.');
                } else {
                  Navigator.pop(context);
                  navigateTo(context, MainOtpVerification(otp: data.otp, userStatus: data.response, number: widget.number));
                  // DialogOtpVerification.show(context, data.otp,mobileController.text,data.response);
                }
              },
              child: const Text("Resend"),
            ),
          ),
          SizedBox(
            height: 56,
            width: appWidth(context)*.4,
            child: ElevatedButton(
              onPressed: () {
                _verifyOtp();
               print('widget.otp:: ${widget.otp}  ::: ${_pinController.text}');
              },
              child: const Text("Confirm"),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Verification"),
                  Text(
                    "We sent you a SMS Code",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "On number: ${widget.number}",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            Center(
              child: PinFieldAutoFill(
                controller: _pinController,
                codeLength: 4,
                autoFocus: true,
                decoration: UnderlineDecoration(
                  lineHeight: 2,
                  lineStrokeCap: StrokeCap.square,
                  bgColorBuilder: PinListenColorBuilder(
                      Colors.green.shade200, Colors.grey.shade200),
                  colorBuilder: const FixedColorBuilder(Colors.transparent),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Resend code after: "),
                Countdown(
                  animation: StepTween(
                    begin: levelClock, // THIS IS A USER ENTERED NUMBER
                    end: 0,
                  ).animate(_animationController!),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxBuilder(BuildContext context) {
    return Form(
        key: formKey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _box(context, _controller1, false, text1, text2),
            SizedBox(
              width: 15,
            ),
            _box(context, _controller2, false, text2, text3),
            SizedBox(
              width: 15,
            ),
            _box(context, _controller3, false, text3, text4),
            SizedBox(
              width: 15,
            ),
            _box(context, _controller4, false, text4, text1),
          ],
        ));
  }

  _verifyOtp() async {
    if (_pinController.text.length==4) {
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
                        Text('otp verifying..'),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ));
      String otp = _pinController.text;
      DioCreateUser createUser = DioCreateUser();
      if (widget.otp.toString() == otp.toString()) {
        LoginResponse loginResponse = await createUser.verifyOtp(number: widget.number, status: '1');
        if (loginResponse.response == 'null') {
          showToast(msg: 'oops! please try again.');
          Navigator.pop(context);
        } else {
          print('oops!widget.userStatus=${widget.userStatus}.');
          if (widget.userStatus == '1') {
            var sharedPreferencesVM = Provider.of<SharedPreferencesVM>(context, listen: false);
            sharedPreferencesVM.setLoginStatus(true);
            sharedPreferencesVM.setUserDetails(AppUser(
                name: loginResponse.id.toString(),
                email: '',
                mobile: loginResponse.mobile.toString(),
                image: 'assets/avtar/a1.jpg',
              userType: 'mobile'
            ));
            navigateAndFinsh(context, MyHomePage());
          } else {
            navigateAndFinsh(context, ReferralCode(mobile: widget.number));
          }
        }
      } else {
        Navigator.pop(context);
        setState(() {
          isVerify = false;
        });
        showToast(msg: 'Wrong otp!');
      }
    }
  }

  Widget _box(BuildContext context, TextEditingController customController,
      bool focus, FocusNode text, FocusNode changeFocus) {
    return Container(
      alignment: Alignment.center,
      height: 60,
      width: 55,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.yellowAccent, width: 1)),
      child: Center(
        child: TextField(
          autofocus: focus,
          focusNode: text,
          onChanged: (value) {
            if (value.isNotEmpty) {
              FocusScope.of(context).requestFocus(changeFocus);
            }
          },
          cursorHeight: 30,
          cursorColor: Colors.white,
          controller: customController,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 22),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: const InputDecoration(
              border: InputBorder.none,
              counterText: '',
              contentPadding: EdgeInsets.all(5)),
        ),
      ),
    );
  }
}


class Countdown extends AnimatedWidget {
  Countdown({Key? key, required this.animation})
      : super(key: key, listenable: animation);
  Animation<int> animation;
  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);
    String timerText =
        '${clockTimer.inMinutes.remainder(1).toString()}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';
    return Text(
      timerText,
      style: TextStyle(
        fontSize: 18,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}

