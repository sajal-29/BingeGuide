import 'package:binge_guide/Screens/MainPage.dart';
import 'package:binge_guide/Screens/SearchMovie.dart';
import 'package:binge_guide/Screens/login_register.dart';
import 'package:binge_guide/provider/favorite.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import './widget_tree.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => favoriteProvider()))
      ],
      child: MaterialApp(
        theme: ThemeData(
            primaryColorLight: Color(0xFF37306B),
            primaryColorDark: Color(0xFF66347F),
            buttonColor: Color(0xFF9E4784),
            accentColor: Color(0xFFD27685)),
        title: "BingeGuide",
        debugShowCheckedModeBanner: false,
        home: WidgetTree(),
      ),
    );
  }
}
