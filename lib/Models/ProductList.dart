import 'package:flutter/cupertino.dart';

class Productist with ChangeNotifier {
  final String? id;
  final String name;
  final List<String> category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  Productist(
      {required this.name,
      required this.id,
      required this.category,
      required this.imageUrl,
      required this.price,
      required this.isRecommended,
      required this.isPopular});
}
