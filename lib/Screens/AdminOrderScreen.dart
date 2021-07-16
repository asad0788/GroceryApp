import 'package:flutter/material.dart';
import 'package:groccery_stores/Screens/EditProductScreen.dart';

import 'package:groccery_stores/provider/ProductList_provider.dart';
import 'package:groccery_stores/widgets/App_Drawer.dart';
import 'package:provider/provider.dart';

class AdminEditProduct extends StatelessWidget {
  static const routeName = '/AdminEditProduct';
  const AdminEditProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderItem = Provider.of<ProductListProvider>(context).item;
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Products'),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (ctx, i) => Column(
            children: [
              ListTile(
                title: Text(orderItem[i].name),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(orderItem[i].imageUrl),
                ),
                trailing: Container(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                              EditProductScreen.routeName,
                              arguments: orderItem[i].id);
                        },
                        icon: Icon(
                          Icons.edit,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Provider.of<ProductListProvider>(context,
                                  listen: false)
                              .deleteProduct(orderItem[i].id.toString());
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Theme.of(context).errorColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(),
            ],
          ),
          itemCount: orderItem.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(EditProductScreen.routeName);
        },
      ),
    );
  }
}
