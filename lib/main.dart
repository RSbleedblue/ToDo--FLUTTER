import 'package:assignment7todo/pages/landingPage.dart';
import 'package:assignment7todo/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async{
  await Hive.initFlutter();
  var box = await Hive.openBox("myBox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkThemeMode,
      home: LandingPage(),
    );
  }
}

