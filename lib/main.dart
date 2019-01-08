import 'package:flutter/material.dart';
import 'package:flutter_oazatv/screens/home_screen.dart';
import 'package:flutter_oazatv/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Oáza.tv',
      theme: appTheme,
      home: HomeScreen()
    );
  }
}
