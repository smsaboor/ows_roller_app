import 'package:flutter/material.dart';
import 'package:ows_roller_app/model/audio_player/custom_audio.dart';
import 'widgets/top_add_cash.dart';
import 'widgets/bottom_add_cash.dart';

class MainAddCash extends StatefulWidget {
  const MainAddCash({Key? key}) : super(key: key);
  @override
  State<MainAddCash> createState() => _MainAddCashState();
}

class _MainAddCashState extends State<MainAddCash> {

  @override
  void initState() {
    // TODO: implement initState
    CustomAudio.playAssetPush(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Cash'),centerTitle: true,),
      body: Column(
        children: [
          TopAddCash(),
          SizedBox(height: 5,),
          BottomAddCash()],
      ),
    );
  }
}
