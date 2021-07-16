import 'package:flutter/material.dart';
import 'package:groccery_stores/widgets/App_Drawer.dart';
import 'package:provider/provider.dart';

import '../provider/Orders.dart' show Orders;
import '../widgets/Order_Item.dart';

class OrderScreen extends StatelessWidget {
  static const routName = '/OrderScreen';
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Screen'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orderData.order.length,
        itemBuilder: (ctx, i) => OrderItems(orderData.order[i]),
      ),
    );
  }
}
