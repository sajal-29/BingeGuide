import 'dart:convert';
import 'dart:math';
import 'dart:ui';

import 'package:binge_guide/Screens/MainPage.dart';
import 'package:binge_guide/provider/favorite.dart';
import 'package:binge_guide/utilities/MovieHolder.dart';
import 'package:binge_guide/utilities/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:binge_guide/provider/favorite.dart';

class Movies extends StatefulWidget {
  const Movies({super.key});

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  List<dynamic> _movies = [];
  String url = '';
  var data;
  String output = '';
  double? num;
  String Url = '';
  @override
  Widget build(BuildContext context) {
    final holder = movieHolder(title: '', rating: 0, image: '');
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFF1F6F9),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25)),
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).primaryColorDark,
                          Theme.of(context).primaryColorLight,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: ((context) {
                                return MainPage();
                              })));
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            )),
                        const SizedBox(
                          width: 50,
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
                              color: Theme.of(context).buttonColor,
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
                    const SizedBox(height: 60),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(
                              color: Theme.of(context).accentColor, width: 5),
                          borderRadius: BorderRadius.circular(20)),
                      child: TextField(
                        onChanged: (value) {
                          url = 'http://172.31.221.15:5000/api-movies?movies=' +
                              value.toString();
                        },
                        textInputAction: TextInputAction.search,
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: Color(0xFFFEF2F4)),
                        cursorColor: Colors.white,
                        cursorHeight: 25,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            prefixIconColor: Color(0xFFFEF2F4),
                            hintText: 'Search',
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Color(0xFFE5E5CB))),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            elevation: MaterialStatePropertyAll(0.0),
                            shadowColor:
                                MaterialStatePropertyAll(Colors.transparent),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.transparent)),
                        onPressed: () async {
                          var result = await fetchdata(url);
                          Map decoded = json.decode(result);
                          // debugPrint(decoded.toString());
                          List<dynamic> movies = decoded['ans'];
                          // debugPrint(movies.toString());
                          setState(() {
                            _movies = movies;
                          });
                        },
                        child: Container(
                            height: 60,
                            width: 200,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(20),
                              color: Theme.of(context).buttonColor,
                            ),
                            child: const Text(
                              'Search',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ))),
                  ]),
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.647,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemCount: _movies.length,
                      itemBuilder: (context, i) {
                        print(i);
                        return Column(
                          children: [
                            SizedBox(
                              height: 2,
                            ),
                            movieHolder(
                                title: _movies[i][0],
                                rating: _movies[i][1],
                                image: _movies[i][2]),
                            SizedBox(
                              height: 15,
                            )
                          ],
                        );
                      },
                    )),
              ]),
        ),
      ),
    );
  }
}
