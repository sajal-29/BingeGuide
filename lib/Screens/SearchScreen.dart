import 'dart:convert';

import 'package:binge_guide/Screens/MainPage.dart';
import 'package:binge_guide/utilities/MovieHolder.dart';
import 'package:binge_guide/utilities/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Searchscreen extends StatefulWidget {
  const Searchscreen({super.key});

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  List<dynamic> _movies = [];
  String url = '';
  var data;
  String output = '';
  double? num;
  String Url = '';
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 50),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      iconSize: 40,
                      padding: EdgeInsets.zero,
                      highlightColor: Color(0xFFFFA31A).withOpacity(0.4),
                      icon: Icon(Icons.arrow_back),
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
                const SizedBox(height: 60),
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Color(0xFFFFA31A), width: 5),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextField(
                    onChanged: (value) {
                      url = 'http://172.31.219.208:5000/api?movie=' +
                          value.toString();
                    },
                    textInputAction: TextInputAction.search,
                    style: TextStyle(color: Color(0xFFFFA31A)),
                    cursorColor: Color(0xFFFFA31A),
                    cursorHeight: 25,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        prefixIconColor: Color(0xFFFFA31A),
                        hintText: 'Search',
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Color(0xFFFFA31A))),
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
                  height: 20,
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemCount: _movies.length,
                      itemBuilder: (context, i) {
                        print(i);
                        return Column(
                          children: [
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
