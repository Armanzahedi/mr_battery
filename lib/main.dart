import 'package:flutter/material.dart';
import 'package:mr_battery/services/utils/my_theme.dart';
import 'package:mr_battery/widgets/navigation_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mr Battery',
      theme: MyTheme.myThemeData,
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: NavigationBar(),
      ),
    );
  }
}
