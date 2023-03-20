import 'package:flutter/material.dart';
import 'package:ows_roller_app/view/theme/resources/themes/theme_view_model.dart';
import 'package:provider/provider.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final themeViewModel = context.watch<ThemeViewModel>();
    return Scaffold(
      appBar: AppBar(backgroundColor: themeViewModel.colors.colorScheme.primary,
      title: Text(title),centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Center(
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset("assets/gif/uc.gif"),
                ))
          ],
        ),
      ),
    );
  }
}
