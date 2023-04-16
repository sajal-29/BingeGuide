import 'package:binge_guide/Screens/MainPage.dart';
import 'package:binge_guide/Screens/SearchScreen.dart';
import 'package:binge_guide/Screens/homePage.dart';
import 'package:binge_guide/utilities/MovieHolder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "BingeGuide",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
