import 'package:flutter/material.dart';
import 'package:groccery_stores/provider/Cart.dart';
import 'package:provider/provider.dart';

class Cartitem extends StatelessWidget {
  final String id;
  final String productId;
  final String tittle;
  final double price;
  final int quaninty;
  final String imageurl;
  Cartitem(this.id, this.productId, this.price, this.quaninty, this.tittle,
      this.imageurl);
  @override
  Widget build(BuildContext context) {
    return Dismissible(
        onDismissed: (direction) {
          Provider.of<Cart>(context, listen: false).removeItem(productId);
        },
        confirmDismiss: (direction) {
          return showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                    title: Text('Are you Sure'),
                    content: Text('Do you want to remove the item'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(ctx).pop(false);
                          },
                          child: Text('No')),
                      TextButton(
                          onPressed: () {
                            Navigator.of(ctx).pop(true);
                          },
                          child: Text('Yes')),
                    ],
                  ));
        },
        key: ValueKey(id),
        direction: DismissDirection.endToStart,
        background: Column(
          children: [
            Container(
              color: Theme.of(context).errorColor,
              child: Icon(
                Icons.delete,
                color: Colors.white,
                size: 110,
              ),
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 25),
            ),
          ],
        ),
        child: Card(
          margin: EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    // color: Colors.red[100],
                    image: DecorationImage(
                        image: NetworkImage(
                          imageurl,
                        ),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tittle,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('\$ $price',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${quaninty.toString()} \X',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
                ),
              )
            ],
          ),
        ));
  }
}
