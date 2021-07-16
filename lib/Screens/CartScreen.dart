import 'package:flutter/material.dart';
import 'package:groccery_stores/provider/Cart.dart' show Cart;
import 'package:groccery_stores/provider/Orders.dart';

import 'package:groccery_stores/widgets/CartItem.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = 'cartScreen';
  @override
  Widget build(BuildContext context) {
    void showModalSheet(BuildContext ctx) {
      showModalBottomSheet(
          context: ctx,
          builder: (_) {
            return Container(
                height: 900,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                          height: 200,
                          child: Image.asset('assets/images/chekout.png')),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Congratulation!',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'for Your Order',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text(
                        'Your Order is now Being processed.We will let you know once the order is picked from the outlet',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed('/');
                          },
                          child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.pink[300],
                                  borderRadius: BorderRadius.circular(40)),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  'Back To Home',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ));
          });
    }

    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.pink[300]),
            child: Text(
              'Proceed To Checkout',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            onPressed: () {
              Provider.of<Orders>(context, listen: false)
                  .addOrder(cart.item.values.toList(), cart.totalAmount);
              cart.clear();

              showModalSheet(context);
            },
          ),
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'Shopping Cart',
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.pink),
          ),
        ),
        // Card(
        //   child: Padding(
        //     padding: EdgeInsets.all(1),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         Text(
        //           'Total',
        //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        //         ),
        //         SizedBox(
        //           width: 2,
        //         ),
        //         Spacer(),
        //         Chip(
        //           label: Text(
        //             '\$${cart.totalAmount}',
        //             style:
        //                 TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        //           ),
        //         ),
        //         TextButton(
        //             onPressed: () {
        //               Provider.of<Orders>(context, listen: false).addOrder(
        //                   cart.item.values.toList(), cart.totalAmount);
        //               cart.clear();
        //             },
        //             child: Text(
        //               'Order Now',
        //               style: TextStyle(
        //                 fontSize: 20,
        //                 fontWeight: FontWeight.bold,
        //                 color: Colors.purple,
        //               ),
        //             ))
        //       ],
        //     ),
        //   ),
        // ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, i) => Cartitem(
              cart.item.values.toList()[i].id,
              cart.item.keys.toList()[i],
              cart.item.values.toList()[i].price,
              cart.item.values.toList()[i].quaninty,
              cart.item.values.toList()[i].tittle,
              cart.item.values.toList()[i].imagesUrl,
            ),
            itemCount: cart.item.length,
          ),
        ),
        Card(
          child: Container(
            height: 20,
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      '\$${cart.totalAmount}',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
