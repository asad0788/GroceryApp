import 'package:flutter/material.dart';

import 'package:groccery_stores/Models/Productclass.dart';

class Products with ChangeNotifier {
  List<ProductClass> _item = [
    ProductClass(
      id: 1,
      tittle: 'Banner',
      category: 'vegetable',
      assetPath: 'assets/images/ban3.jpg',
      description: 'this is loaded product',
    ),
    ProductClass(
      id: 2,
      tittle: 'Vege',
      category: 'fruits',
      assetPath: 'assets/images/ban2.jpg',
      description: 'this is loaded product',
    ),
    ProductClass(
      id: 3,
      tittle: 'Vege',
      category: 'Bakery',
      assetPath: 'assets/images/ban1.jpg',
      description: 'this is loaded product',
    )
  ];

  List<ProductClass> get item {
    return [..._item];
  }
}
