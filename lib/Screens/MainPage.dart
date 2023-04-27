import 'package:binge_guide/Screens/Introduction.dart';
import 'package:binge_guide/Screens/SearchMovie.dart';
import 'package:binge_guide/Screens/SearchSeries.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../auth.dart';
import 'favoritesScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainPage extends StatelessWidget {
  final User? user = Auth().currentuser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return const Text('Firebase Auth');
  }

  Widget _userId() {
    return Text(user?.email ?? 'User email');
  }

  Widget _signOutButton() {
    return ElevatedButton(onPressed: signOut, child: Text('Sign Out'));
  }

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      // extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        foregroundColor: Theme.of(context).primaryColorDark,
        toolbarHeight: 60,
        shadowColor: Colors.transparent,
        elevation: 0,
        backgroundColor: Colors.transparent,
        // centerTitle: true,
      ),
      drawer: Drawer(
        shape: Border(right: BorderSide(width: 1, color: Color(0xFFD27685))),
        key: _globalKey,
        backgroundColor: Theme.of(context).primaryColorDark,
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
                    color: Theme.of(context).accentColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.favorite, color: Color(0xFF9E4784)),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return FavScreen();
                })));
              },
              title: Text(
                'Favourites',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xFFD27685)),
              ),
            ),
            SizedBox(
              height: 500,
            ),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color(0xFFFFABAB)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
                onPressed: () {
                  signOut();
                },
                child: Text(
                  'Sign Out',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Color(0xFFFFABAB)),
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
      body: SingleChildScrollView(
        child: Container(
          // padding: EdgeInsets.only(top: 10),
          // color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Theme.of(context).buttonColor,
            Theme.of(context).accentColor,
            Theme.of(context).primaryColorDark,
            Theme.of(context).primaryColorLight,
            Theme.of(context).primaryColor
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter)
              // image: DecorationImage(
              //   image: AssetImage('assets/background.png'),
              //   fit: BoxFit.fill,
              //   // opacity: 1,
              // ),
              ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          color: Theme.of(context).accentColor,
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
                        color: Color(0xFF9E4784),
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
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFFD27685),
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
                color: Theme.of(context).primaryColorLight.withOpacity(0.85),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(35),
                border: Border.all(color: Color(0xFF66347F), width: 2)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const SizedBox(height: 200),
                ElevatedButton(
                    style: ButtonStyle(
                        shadowColor:
                            MaterialStatePropertyAll(Colors.transparent),
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.transparent)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Movies(),
                          ));
                    },
                    child: Container(
                        height: 60,
                        width: 200,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).accentColor,
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
                            builder: (context) => Series(),
                          ));
                    },
                    child: Container(
                        height: 60,
                        width: 200,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).accentColor,
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
