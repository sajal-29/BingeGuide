import 'package:binge_guide/Screens/Introduction.dart';
import 'package:binge_guide/Screens/SearchScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        foregroundColor: Colors.white,
        toolbarHeight: 50,
        shadowColor: Colors.transparent,
        elevation: 0,
        backgroundColor: Colors.transparent,
        // centerTitle: true,
      ),
      drawer: Drawer(
        shape: Border(right: BorderSide(width: 1, color: Color(0xFFFFA31A))),
        key: _globalKey,
        backgroundColor: Colors.black,
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Container(
              // padding: EdgeInsets.all(10),
              // width: 10,
              height: 100,
              child: Text(
                'Hi There! Welcome to BingeGuide :)',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFFFFA31A),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat'),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.favorite, color: Colors.red),
              title: Text(
                'Favourites',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xFFFFA31A)),
              ),
            ),
            const ListTile(
              leading: Icon(
                Icons.lightbulb,
                color: Colors.yellow,
              ),
              title: Text(
                'History',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xFFFFA31A)),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Color(0xFFFFA31A)),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return IntroPage();
                })));
              },
              child: Text(
                'About_Us',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            )
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        // color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/background.png'),
          fit: BoxFit.fill,
        )),
        child: SingleChildScrollView(
          // padding: const EdgeInsets.only(top: 50),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Binge',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
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
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Discover your next favorite movie or web series with Bingeguide! From action-packed thrillers to heartwarming romances, Bingeguide has got you covered!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Alkatra',
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(217, 255, 255, 255),
                        wordSpacing: 1.5,
                        letterSpacing: 0),
                  ),
                ),
                SizedBox(height: 60),
                ElevatedButton(
                    style: ButtonStyle(
                        shadowColor:
                            MaterialStatePropertyAll(Colors.transparent),
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.transparent)),
                    onPressed: () {
                      _bottomSheet(context);
                    },
                    child: Container(
                        height: 60,
                        width: 200,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(40),
                          color: Color(0xFFFFA31A),
                        ),
                        child: const Text(
                          'Search',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ))),
                SizedBox(
                  height: 250,
                ),
              ]),
        ),
      ),
    );
  }

  _bottomSheet(context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(35),
                border: Border.all(color: Color(0xFFFFA31A), width: 4)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const SizedBox(height: 200),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.transparent)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Searchscreen(),
                          ));
                    },
                    child: Container(
                        height: 60,
                        width: 200,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(40),
                          color: Color(0xFFFFA31A),
                        ),
                        child: const Text(
                          'Movies',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ))),
                const SizedBox(height: 20),
                ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStatePropertyAll(0),
                        shadowColor:
                            MaterialStatePropertyAll(Colors.transparent),
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.transparent)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Searchscreen(),
                          ));
                    },
                    child: Container(
                        height: 60,
                        width: 200,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(40),
                          color: Color(0xFFFFA31A),
                        ),
                        child: const Text(
                          'Web-Series',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        )))
              ],
            ),
          );
        });
  }
}
