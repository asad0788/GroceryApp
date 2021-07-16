import 'package:flutter/material.dart';
import 'package:groccery_stores/provider/Orders.dart';
import 'package:intl/intl.dart';

class OrderItems extends StatefulWidget {
  final OrderItem order;
  OrderItems(this.order);

  @override
  _OrderItemsState createState() => _OrderItemsState();
}

class _OrderItemsState extends State<OrderItems> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ExpansionTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Total Amounts of Product',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '${widget.order.amount.toString()}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Time',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (ctx, i) => ListTile(
                    title: Text(widget.order.product[i].tittle),
                    leading: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.network(
                        widget.order.product[i].imagesUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    trailing: Text(
                        ' ${widget.order.product[i].quaninty}x \$ ${widget.order.product[i].price}'),
                  ),
                  itemCount: widget.order.product.length,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
// ListView.builder(
//   itemCount: widget.order.product.length,
//   itemBuilder: (ctx, i) => Container(
//         child: ExpansionTile(
//           title: Text(widget.order.amount.toString()),
//           subtitle: Text(widget.order.amount.toString()),
//           children: [
//             ListTile(
//               title: Text(widget.order.product[i].tittle),
//               leading: Image.asset(widget.order.product[i].imagesUrl),
//             ),
//           ],
//         ),
//   ),
// ),
