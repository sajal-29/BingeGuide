import 'package:flutter/material.dart';
import '../provider/favorite.dart';

class MovItem extends StatelessWidget {
  final movieItem item;

  MovItem(this.item);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.7),
            offset: const Offset(
              1.0,
              1.0,
            ),
            blurRadius: 10.0,
            spreadRadius: 1.0,
          ), //BoxShadow
          BoxShadow(
            color: Colors.white,
            offset: const Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(children: [
        Container(
          height: 220,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            image: DecorationImage(
                image: NetworkImage(item.imageUrl), fit: BoxFit.fill),
          ),
        ),
        Container(
          height: 130,
          padding: EdgeInsets.only(left: 5, top: 5),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Color(0xFFFFABAB).withOpacity(0.7),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rating : ' + item.rating.toString(),
                    style: TextStyle(
                        color: Color(0xFFD27685),
                        fontFamily: 'Montserrat',
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 85,
                      maxWidth: 200,
                      minHeight: 10,
                      minWidth: 10,
                    ),
                    child: Text(
                      'Title : ' + item.name,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}
