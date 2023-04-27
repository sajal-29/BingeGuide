import 'package:flutter/material.dart';

class Elevatedbutton extends StatelessWidget {
  double? height, width;
  String title;
  Function onpress;
  @override
  Elevatedbutton(
      {required this.title,
      required this.width,
      required this.height,
      required this.onpress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.transparent),
        shadowColor: MaterialStatePropertyAll(Colors.transparent),
      ),
      onPressed: () {
        onpress();
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
              fontWeight: FontWeight.w600),
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
