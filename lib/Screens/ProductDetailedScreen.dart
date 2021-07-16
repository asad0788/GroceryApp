import 'package:flutter/material.dart';
import 'package:groccery_stores/provider/Cart.dart';
import 'package:groccery_stores/provider/ProductList_provider.dart';
import 'package:provider/provider.dart';

class ProductDeatiledScreen extends StatelessWidget {
  static const routeName = '/product-Detailed-Screen';
  const ProductDeatiledScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProduct = Provider.of<ProductListProvider>(context)
        .item
        .firstWhere((prod) => prod.id == productId);
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.name),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.share,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () {
                  cart.addItem(loadedProduct.id.toString(), loadedProduct.name,
                      loadedProduct.price, loadedProduct.imageUrl);
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('item added to the cart')));
                },
                child: Text(
                  'Add to Cart',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: Image.network(
              loadedProduct.imageUrl,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28),
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  width: MediaQuery.of(context).size.width,
                  height: 68,
                  color: Colors.black.withAlpha(50),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width - 10,
                  height: 50,
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        loadedProduct.name,
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        '\$ ${loadedProduct.price}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                'Product Information',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              children: [
                ListTile(
                  title: Text('this is very intrecting product'),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: ExpansionTile(
              initiallyExpanded: false,
              title: Text(
                'Delivery Information',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              children: [
                ListTile(
                  title: Text('this is very intrecting product'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
