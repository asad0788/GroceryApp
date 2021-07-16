import 'package:flutter/material.dart';

import 'package:groccery_stores/provider/ProductList_provider.dart';
import 'package:groccery_stores/widgets/ProductCard.dart';
import 'package:provider/provider.dart';

class CategoryProduct extends StatelessWidget {
  static const routename = '/categoryProduct';
  const CategoryProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryid = routArgs['id'];
    final categoryTitle = routArgs['title'].toString();
    final catageoryList = Provider.of<ProductListProvider>(context).item;
    final categoryProducts = catageoryList.where((element) {
      return element.category.contains(categoryid);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemBuilder: (ctx, i) => ProductCard(
            id: categoryProducts[i].id.toString(),
            productname: categoryProducts[i].name,
            productPrice: categoryProducts[i].price,
            imageurl: categoryProducts[i].imageUrl,
            widthfactor: 1.5,
          ),
          itemCount: categoryProducts.length,
        ),
      ),
    );
  }
}
