import 'package:flutter/cupertino.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:ows_roller_app/view_model/roller_view_model.dart';
import 'package:ows_roller_app/view_model/setting_view_model.dart';
import 'package:provider/provider.dart';
import 'package:just_audio/just_audio.dart' as ja;
import 'package:just_audio_cache/just_audio_cache.dart' as ac;

class CustomAudio {
  static RollerViewModel rollerViewModel = RollerViewModel();
  static String audioSample1 = "assets/audio/card-shuffle.mp3";
  static String audioSample2 = "assets/audio/countdown.wav";
  static String audioSample3 = "assets/audio/fail.mp3";
  static String audioSample4 = "assets/audio/pop.mp3";
  static String audioSample5 = "assets/audio/slot.mp3";
  static String audioSample6 = "assets/audio/slot-machine.mp3";
  static String audioSample7 = "assets/audio/stop.mp3";
  static String audioSample8 = "assets/audio/sword.mp3";
  static String audioSample9 = "assets/audio/tree.mp3";
  static String audioSample10 = "assets/audio/tring.mp3";
  static String audioSample11 = "assets/audio/whipe.mp3";
  static String audioSample12 = "assets/audio/wuv.mp3";
  static String audioSampleRoller = "assets/audio/wave1.wav";
  static AudioCache? musicCache;
  static AudioPlayer? instance;

  //------------------------------------------------------------------------
  static AudioPlayer playerCache = AudioPlayer(); //add this
  static AudioCache cache = new AudioCache();
  static late List<Uri> listUri; //and this
  static final sources2 = [
    'audio/card-shuffle.mp3',
    'audio/pop.mp3',
    'audio/wave1.wav'
  ];

  static openingActions() async {
    //add this
    listUri = await cache.loadAll(sources2); //add this
  } //ad

  static void getLoop() async {
    playerCache.play(AssetSource('audio/wave1.wav'));
    // playerCache.stop();
  }

//--------------------------------------------------------------------
  static late final ja.AudioPlayer player;
  static final sources = [
    'assets/audio/card-shuffle.mp3',
    'assets/audio/pop.mp3',
    'assets/audio/wave1.wav"'
  ];
  static PlayerState? _state;

  static void initState() {
    player = ja.AudioPlayer();
    //_player.dynamicSet(url: url);
    player.dynamicSetAll(sources);
    player.playerStateStream.listen((state) {
      _state = state as PlayerState?;
      print(state);
    });
  }

  // Widget _audioStateWidget() {
  //   // if (_state == null) return _playButton;
  //   //
  //   // if (_state!.playing) {
  //   //   return _pauseButton;
  //   // } else {
  //   //   return _playButton;
  //   // }
  // }

  void _playAudio() async {
    player.play();
  }

  void _stopAudio() async {
    player.pause();
  }

//----------------------------------------------------------
  static setPlayersAssets() async {}

//Making sound looping.

  static void playBackgroundMusic() {
    // bgAudio.play(
    //   AssetSource('audio/background.mp3'),
    // );
  }

  static playAssetOnTap(BuildContext context) async {
    try {
      if (Provider.of<SettingViewModel>(context, listen: false)
          .getSoundOnOff!) {
        AudioPlayer player111 = AudioPlayer(playerId: '101');
        await player111.play(AssetSource("audio/c15.wav"),
            position: Duration(milliseconds: 50));
        // await player111.play(AssetSource("audio/c12.wav"));
        // await player111.play(AssetSource("audio/c7.wav"),position: Duration(milliseconds: 100));
        // await player111.play(AssetSource("audio/c6.wav"),position: Duration(milliseconds: 100));
        // await player111.play(AssetSource("audio/c4.wav"),position: Duration(milliseconds: 100));
      }
    } catch (e) {
      print('playAssetOnTap:$e');
    }
  }

  static playAssetOnSubTap(BuildContext context) async {
    try {
      if (Provider.of<SettingViewModel>(context, listen: false)
          .getSoundOnOff!) {
        AudioPlayer player111 = AudioPlayer(playerId: '102');
        await player111.play(AssetSource("audio/c4.wav"),
            position: Duration(milliseconds: 100));
      }
    } catch (e) {
      print('playAssetOnSubTap:$e');
    }
  }

  static playAssetPop(BuildContext context) async {
    try {
      if (Provider.of<SettingViewModel>(context, listen: false)
          .getSoundOnOff!) {
        AudioPlayer player111 = AudioPlayer(playerId: '103');
        await player111.play(AssetSource("audio/pop.mp3"),
            position: Duration(milliseconds: 0));
      }
    } catch (e) {
      print('playAssetPop:$e');
    }
  }

  static playAssetPush(BuildContext context) async {
    print('playAssetPush:playAssetPush');
    try {
      print('playAssetPush:playAssetPush2');
      if (Provider.of<SettingViewModel>(context, listen: false)
          .getSoundOnOff!) {
        print('playAssetPush:playAssetPush3');
        AudioPlayer player111 = AudioPlayer(playerId: '104');
        // await player111.play(AssetSource("audio/c13.wav"),position: Duration(milliseconds: 100));
        // await player111.play(AssetSource("audio/c12.wav"));
        // await player111.play(AssetSource("audio/c7.wav"),position: Duration(milliseconds: 100));
        // await player111.play(AssetSource("audio/c6.wav"));
        print('playAssetPush:playAssetPush4');
        await player111.play(AssetSource("audio/c17.mp3"));
        print('playAssetPush:playAssetPush54');
      }
    } catch (e) {
      print('playAssetPush:$e');
    }
  }

  static playAssetOpenDialog(BuildContext context) async {
    print('playAssetOpenDialog:playAssetOpenDialog');
    try {
      if (Provider.of<SettingViewModel>(context, listen: false)
          .getSoundOnOff!) {
        print('playAssetOpenDialog:playAssetOpenDialog2');
        AudioPlayer player111 = AudioPlayer(playerId: '105');
        print('playAssetOpenDialog:playAssetOpenDialog23');
        await player111.play(AssetSource("audio/c13.wav"),
            position: Duration(milliseconds: 100));
        print('playAssetOpenDialog:playAssetOpenDialog24');
      }
    } catch (e) {
      print('playAssetPush:$e');
    }
  }

  static late ja.AudioPlayer? _player1;


  static playAssetRoller(BuildContext context) async {
    _player1 = ja.AudioPlayer();
    final duration2 = await _player1!.setAsset('assets/audio/wave1.wav');
    await _player1!.setClip(
        start: Duration(milliseconds: 0), end: Duration(milliseconds: 20));
    await _player1!.setLoopMode(ja.LoopMode.all);
    // startPlayerOne(context);
  }
  static startPlayerOne2(context)async{
    await _player1!.play();
  }
  static stopAssetRoller(BuildContext context) async {
    _player1!.pause();
  }

  static startPlayerOne(BuildContext context) async {
    if (Provider.of<SettingViewModel>(context, listen: false).getSoundOnOff! &&
        Provider.of<SettingViewModel>(context, listen: false)
            .flagIsRollerMoving) {
      try {
        _player1!.play();
      } catch (e) {
        print('exception startPlayerOne: $e}');
      }
    }
  }

  static playAssetRollerResult() async {
    // if (player == null) {
    //   player = AudioPlayer();
    //   final duration2 = await player!.setAsset(audioSampleRoller);
    //   await player!.setClip(
    //       start: Duration(milliseconds: 0), end: Duration(milliseconds: 20));
    //   await player!.setLoopMode(LoopMode.all);
    //   player!.play();
    // } else {
    //   await player!.clearCache();
    // }
  }

  static playAssetFail() async {}

  static playAssetWithName(BuildContext context, asset) async {
    try {
      if (Provider.of<SettingViewModel>(context, listen: false)
          .getSoundOnOff!) {
        AudioPlayer player111 = AudioPlayer(playerId: '106');
        await player111.play(AssetSource(asset));
        print('play sound4');
      }
    } catch (e) {
      print('playAssetWithName:$e');
      // }
    }
  }
}
