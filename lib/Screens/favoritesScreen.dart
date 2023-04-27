import 'package:binge_guide/utilities/movie_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/favorite.dart';
import 'MainPage.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesData = Provider.of<favoriteProvider>(context);
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColorLight,
        padding: EdgeInsets.only(top: 20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context,
                          MaterialPageRoute(builder: ((context) {
                        return MainPage();
                      })));
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    )),
                const SizedBox(
                  width: 60,
                ),
                const Text(
                  'Favorites',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                    fontSize: 40,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.853,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: moviesData.movies.length,
                itemBuilder: (ctx, i) => Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    MovItem(moviesData.movies[i]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
