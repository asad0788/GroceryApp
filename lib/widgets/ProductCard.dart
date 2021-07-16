import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groccery_stores/provider/Cart.dart';

import 'package:groccery_stores/Screens/ProductDetailedScreen.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {Key? key,
      required this.widthfactor,
      required this.id,
      required this.productname,
      required this.productPrice,
      required this.imageurl})
      : super(key: key);
  final String id;
  final String productname;
  final double productPrice;
  final String imageurl;
  final double widthfactor;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Stack(children: [
      Container(
        width: MediaQuery.of(context).size.width / widthfactor,
        height: 175,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(ProductDeatiledScreen.routeName, arguments: id);
          },
          child: Image.network(
            imageurl,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Positioned(
        top: 60,
        child: Container(
          width: MediaQuery.of(context).size.width / 2.5,
          height: 80,
          decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
        ),
      ),
      Positioned(
          top: 70,
          left: 5,
          child: Container(
            width: MediaQuery.of(context).size.width / 2.5 - 10,
            height: 60,
            decoration: BoxDecoration(color: Colors.black),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productname,
                          style: GoogleFonts.varelaRound(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '\$ $productPrice',
                          style: GoogleFonts.varelaRound(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).clearSnackBars();
                          cart.addItem(id, productname, productPrice, imageurl);
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                                  duration: Duration(seconds: 3),
                                  content: Text(
                                    'Item added to the cart',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )));
                        },
                        icon: Icon(
                          Icons.add_circle,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
            ),
          )),
    ]);
  }
}
