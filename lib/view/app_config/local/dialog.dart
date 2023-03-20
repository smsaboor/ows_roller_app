import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<T?> _showAlert<T>({BuildContext? context, Widget? child}) => showDialog<T>(
  context: context!,
  barrierDismissible: false,
  builder: (BuildContext context) => child!,
);


Future<bool?> showAlert(BuildContext context,
    {String? title,
      String negativeText = "Cancel",
      String positiveText = "Confirm",
      bool onlyPositive = false}) =>
    _showAlert<bool>(
      context: context,
      child: CupertinoAlertDialog(
        title: Text(title!),
        actions: _buildAlertActions(
            context, onlyPositive, negativeText, positiveText),
      ),
    );

List<Widget> _buildAlertActions(BuildContext context, bool onlyPositive,
    String negativeText, String positiveText) {
  if (onlyPositive) {
    return [
      CupertinoDialogAction(
        isDefaultAction: true,
        onPressed: () {
          Navigator.pop(context, true);
        },
        child: Text(
          positiveText,
          style: const TextStyle(fontSize: 18.0),
        ),
      ),
    ];
  } else {
    return [
      CupertinoDialogAction(
        isDestructiveAction: true,
        onPressed: () {
          Navigator.pop(context, false);
        },
        child: Text(
          negativeText,
          style: const TextStyle(color: Color(0xFF71747E), fontSize: 18.0),
        ),
      ),
      CupertinoDialogAction(
        isDefaultAction: true,
        onPressed: () {
          Navigator.pop(context, true);
        },
        child: Text(
          positiveText,
          style: const TextStyle(fontSize: 18.0),
        ),
      ),
    ];
  }
}


Future _showLoadingDialog(BuildContext c, LoadingDialog loading,
    {bool cancelable = true}) =>
    showDialog(
        context: c,
        barrierDismissible: cancelable,
        builder: (BuildContext c) => loading);

/// 加载框
class LoadingDialog extends CupertinoAlertDialog {
  BuildContext? parentContext;
  BuildContext? currentContext;
  bool? showing;
  show(BuildContext context) {
    parentContext = context;
    showing = true;
    _showLoadingDialog(context, this).then((_){
      showing=false;
    });
  }

  // hide() {
  //   if(showing!) {
  //     Navigator.removeRoute(parentContext!, ModalRoute.of(currentContext!));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    currentContext= context;
    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Center(
            child: Container(
              width: 120,
              height: 120,
              child: CupertinoPopupSurface(
                child: Semantics(
                  namesRoute: true,
                  scopesRoute: true,
                  explicitChildNodes: true,
                  child: const Center(
                    child: CupertinoActivityIndicator(),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}