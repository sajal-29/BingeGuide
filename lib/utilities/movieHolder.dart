import 'package:flutter/material.dart';

class movieHolder extends StatelessWidget {
  String title;
  double? rating;
  String image;
  movieHolder({required this.title, required this.rating, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: Color(0xFFFFA31A),
        border: Border.all(color: Color(0xFFFFA31A), width: 5),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(children: [
        Container(
          height: 250,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFFFA31A), width: 2.5),
              image:
                  DecorationImage(image: NetworkImage(image), fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(25)),
        ),
        Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          height: 85,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25), color: Colors.black),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStatePropertyAll(0),
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.transparent)),
                  onPressed: () {},
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 30,
                  )),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 75,
                  maxWidth: 175,
                  minHeight: 10,
                  minWidth: 10,
                ),
                child: Text(
                  title,
                  style: TextStyle(
                      color: Color(0xFFFFA31A),
                      fontFamily: 'Alkatra',
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                rating.toString(),
                style: TextStyle(
                    color: Color(0xFFFFA31A),
                    fontFamily: 'Alkatra',
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
