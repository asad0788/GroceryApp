import 'package:flutter/material.dart';
import 'package:groccery_stores/Screens/AdminOrderScreen.dart';
import 'package:groccery_stores/Screens/OrderScreen.dart';
import 'package:groccery_stores/provider/auth.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  static const routName = '/App-Drawer';
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 39),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/drawer.jpg'),
                  fit: BoxFit.cover),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/Asad.png'),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Muhammad Asad',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  'asadsaim778@gmail.com',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
          // AppBar(

          //   title: Text('Hi Friends there'),
          //   automaticallyImplyLeading: false,
          // ),
          Divider(),
          ListTile(
              leading: Icon(
                Icons.shop,
                color: Colors.black,
              ),
              title: Text('Main Screen'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              }),
          Divider(),
          ListTile(
              leading: Icon(
                Icons.payment,
                color: Colors.black,
              ),
              title: Text('Shop Screen'),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(OrderScreen.routName);
              }),
          Divider(),
          ListTile(
              leading: Icon(
                Icons.edit,
                color: Colors.black,
              ),
              title: Text('Manage Orders '),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(AdminEditProduct.routeName);
              }),
          Divider(),
          ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.black,
              ),
              title: Text('Logout '),
              onTap: () {
                Navigator.of(context).pop();
                Provider.of<Auth>(context, listen: false).logOut();
              }),
        ],
      ),
    );
  }
}
