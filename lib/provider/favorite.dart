import 'package:flutter/material.dart';

class movieItem {
  final String name;
  var rating;
  final String imageUrl;
  movieItem({required this.name, required this.rating, required this.imageUrl});
}

class favoriteProvider extends ChangeNotifier {
  List<movieItem> _movie = [];
  List<movieItem> get movies {
    return [..._movie];
  }

  void addMovie(String title, var rating, String image) {
    _movie.insert(0, movieItem(name: title, rating: rating, imageUrl: image));
    notifyListeners();
  }
}
