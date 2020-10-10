import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });

  void toggleFavourite() {
    isFavorite = !isFavorite;
    // its kind of like setstate method, its letting all the childrens listening to this provider class, know about the change
    notifyListeners();
  }
}
