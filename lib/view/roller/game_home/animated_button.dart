import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import '../widget/config.dart';

class GameAnimatedButton extends StatefulWidget {
  const GameAnimatedButton({Key? key}) : super(key: key);
  @override
  State<GameAnimatedButton> createState() => _GameAnimatedButtonState();
}

class _GameAnimatedButtonState extends State<GameAnimatedButton> {
  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      animatedOn: AnimatedOn.onTap,
      onPress: () {
      },
      onChanges: (change) {},
      height: NumberConfig.boxWidth(context),
      width: NumberConfig.boxWidth(context),
      text: '0',
      isReverse: true,
      selectedTextColor: Colors.black,
      transitionType: TransitionType.LEFT_TOP_ROUNDER,
      textStyle: NumberConfig.submitTextStyle,
      backgroundColor: Colors.black,
      selectedBackgroundColor: Colors.lightGreen,
      borderColor: Colors.white,
      borderWidth: 1,
    );
  }
}
