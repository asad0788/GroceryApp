import 'package:flutter/material.dart';
import 'package:groccery_stores/Screens/ProductOverviewScreen.dart';
import 'package:groccery_stores/Screens/auth_screen.dart';
import 'package:groccery_stores/Screens/AdminOrderScreen.dart';
import 'package:groccery_stores/Screens/EditProductScreen.dart';

import 'package:groccery_stores/provider/Cart.dart';
import 'package:groccery_stores/provider/Orders.dart';
import 'package:groccery_stores/provider/ProductList_provider.dart';
import 'package:groccery_stores/provider/auth.dart';
import 'package:groccery_stores/provider/banner_Provider.dart';
import 'package:groccery_stores/widgets/App_Drawer.dart';
import 'package:groccery_stores/Screens/CartScreen.dart';
import 'package:groccery_stores/widgets/CategoryProduct.dart';
import 'package:groccery_stores/Screens/OrderScreen.dart';

import 'package:groccery_stores/Screens/ProductDetailedScreen.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final List<Widget> _pages = [
  //   ProductOverviewScreen(),
  //   CartScreen(),
  // ];
  // int currentIndex = 0;
  // selectPage(int index) {
  //   setState(() {
  //     currentIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // final userList = Provider.of<ProductListProvider>(context).item;
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: Auth()),

          ChangeNotifierProxyProvider<Auth, ProductListProvider>(
            create: (_) => ProductListProvider(),
            update: (_, auth, data) => data!..update(auth.token, data.item),
          ),
          // ChangeNotifierProvider(
          //   create: (ctx) => ProductListProvider(),
          // ),
          ChangeNotifierProvider(
            create: (ctx) => Products(),
          ),
          ChangeNotifierProvider(create: (ctx) => Cart()),
          ChangeNotifierProvider(create: (ctx) => Orders()),
        ],
        child: Consumer<Auth>(
          builder: (context, auth, _) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Grocery Store',
            theme: ThemeData(
                accentColor: Colors.deepOrange, primarySwatch: Colors.purple),
            home: auth.isAuth ? ProductOverviewScreen() : AuthScreen(),
            // home: Scaffold(
            // appBar: AppBar(
            //   title: Text('Grocery Store'),
            // ),
            // body: _pages[currentIndex],
            // bottomNavigationBar: BottomNavigationBar(
            //   onTap: selectPage,
            //   items: [
            //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            //     BottomNavigationBarItem(
            //         icon: Icon(Icons.shopping_bag), label: 'Cart'),
            //   ],
            // ),

            // home: ProductOverviewScreen(),
            routes: {
              ProductDeatiledScreen.routeName: (ctx) => ProductDeatiledScreen(),
              AppDrawer.routName: (ctx) => AppDrawer(),
              CartScreen.routeName: (ctx) => CartScreen(),
              OrderScreen.routName: (ctx) => OrderScreen(),
              CategoryProduct.routename: (ctx) => CategoryProduct(),
              AdminEditProduct.routeName: (ctx) => AdminEditProduct(),
              EditProductScreen.routeName: (ctx) => EditProductScreen(),
            },
          ),
        ));
  }
}
