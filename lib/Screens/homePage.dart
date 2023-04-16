import 'package:binge_guide/Screens/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 60),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Binge',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    fontFamily: 'Montserrat',
                  ),
                ),
                Container(
                  height: 45,
                  width: 110,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Color(0xFFFFA31A),
                      borderRadius: BorderRadius.circular(5)),
                  child: const Text(
                    'Guide',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Welcome!',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            Container(
              height: 300,
              width: 3000,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/logo.png'), fit: BoxFit.cover)),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(height: 30),
            Elevatedbutton(
              height: 60,
              width: 200,
              title: 'Login',
            ),
            const SizedBox(
              height: 20,
            ),
            Elevatedbutton(
              height: 60,
              width: 200,
              title: 'SignUp',
            )
          ]),
        ),
      ),
    );
  }
}

class Elevatedbutton extends StatelessWidget {
  double? height, width;
  String title;
  @override
  Elevatedbutton({
    required this.title,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.transparent),
        shadowColor: MaterialStatePropertyAll(Colors.transparent),
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainPage()));
      },
      child: Container(
        height: height,
        width: width,
        child: Text(
          title,
          style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Color(0xFFFFA31A),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
