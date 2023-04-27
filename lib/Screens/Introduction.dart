import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import './MainPage.dart';

class IntroPage extends StatefulWidget {
  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 30),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Theme.of(context).accentColor.withOpacity(0.7)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  IconButton(
                    iconSize: 40,
                    padding: EdgeInsets.zero,
                    highlightColor: Color(0xFFFFABAB).withOpacity(0.4),
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context, MaterialPageRoute(
                        builder: (context) {
                          return MainPage();
                        },
                      ));
                    },
                  ),
                  SizedBox(
                    width: 40,
                  ),
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
                        color: Color(0xFFFFABAB),
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
                height: 35,
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: GridView.count(
                      childAspectRatio: 0.7,
                      crossAxisCount: 2,
                      children: [
                        PhotoContainer(
                          name: "Sajal",
                          rollNo: "102116080",
                          photo: 'assets/sajal.jpg',
                        ),
                        PhotoContainer(
                          name: "Sanchi",
                          rollNo: "102116093",
                          photo: 'assets/sanchi.jpg',
                        ),
                        PhotoContainer(
                          name: "Aakash",
                          rollNo: "102116087",
                          photo: 'assets/aakash_photo.png',
                        ),
                        Container(
                          // color: Colors.deepOrange,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 140,
                                width: 170,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage('assets/madhurg.jpg'),
                                      fit: BoxFit.cover),
                                  border: Border.all(
                                    color: Color(0xFF9E4784),
                                    width: 3,
                                  ),
                                ),
                              ),
                              Text(
                                'Madhur',
                                style: TextStyle(
                                  color: Color(0xFF9E4784),
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                  fontSize: 25,
                                ),
                              ),
                              Text(
                                '102116080',
                                style: TextStyle(
                                  color: Color(0xFF9E4784),
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Alkatra',
                                  fontSize: 20,
                                ),
                              )
                            ],
                          ),
                        )
                      ]))
            ],
          ),
        ),
      ),
    );
  }
}

class PhotoContainer extends StatelessWidget {
  String photo, name, rollNo;
  PhotoContainer(
      {required this.photo, required this.name, required this.rollNo});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.deepOrange,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 140,
            width: 170,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image:
                  DecorationImage(image: AssetImage(photo), fit: BoxFit.cover),
              border: Border.all(
                color: Color(0xFF9E4784),
                width: 3,
              ),
            ),
          ),
          Text(
            name,
            style: TextStyle(
              color: Color(0xFF9E4784),
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
              fontSize: 25,
            ),
          ),
          Text(
            rollNo,
            style: TextStyle(
              color: Color(0xFF9E4784),
              fontWeight: FontWeight.bold,
              fontFamily: 'Alkatra',
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}
