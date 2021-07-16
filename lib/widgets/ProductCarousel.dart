import 'package:flutter/material.dart';
import 'package:groccery_stores/Models/ProductList.dart';

import 'ProductCard.dart';

class ProductCarousel extends StatelessWidget {
  const ProductCarousel({
    Key? key,
    required this.loadedproducts,
  }) : super(key: key);
  final List<Productist> loadedproducts;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
              padding: EdgeInsets.only(right: 5),
              child: ProductCard(
                id: loadedproducts[index].id.toString(),
                imageurl: loadedproducts[index].imageUrl,
                productPrice: loadedproducts[index].price,
                productname: loadedproducts[index].name,
                widthfactor: 2.5,
              ));
        },
        itemCount: loadedproducts.length,
      ),
    );
  }
}
