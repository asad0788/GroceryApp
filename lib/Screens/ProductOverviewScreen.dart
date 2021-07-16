import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groccery_stores/Models/ProductList.dart';
import 'package:groccery_stores/provider/Cart.dart';
import 'package:groccery_stores/provider/ProductList_provider.dart';
import 'package:groccery_stores/widgets/App_Drawer.dart';
import 'package:groccery_stores/Screens/CartScreen.dart';
import 'package:groccery_stores/widgets/badge.dart';

import '../widgets/ProductCarousel.dart';
import '../widgets/SecondTittle.dart';

import 'package:groccery_stores/provider/banner_Provider.dart';
import 'package:groccery_stores/widgets/Build_Catagory.dart';
import 'package:provider/provider.dart';

class ProductOverviewScreen extends StatefulWidget {
  ProductOverviewScreen({Key? key}) : super(key: key);

  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _isInit = true;
  var _isloading = false;
  void initState() {
    // Provider.of<Products>(context).fetchAndSetProducts(); // WON'T WORK!
    // Future.delayed(Duration.zero).then((_) {
    //   Provider.of<Products>(context).fetchAndSetProducts();
    // });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isloading = true;
      });
      Provider.of<ProductListProvider>(
        context,
      ).fetchAndSetProducts().then((_) {
        setState(() {
          _isloading = false;
        });
      });
      super.didChangeDependencies();
    }
    _isInit = false;
  }
  // @override
  // void didChangeDependencies() {
  //   if (_isInit) {
  //     // setState(() {
  //     //   _isLoading = true;
  //     // });
  //     Provider.of<ProductListProvider>(context).fetchAndSetProducts();
  //     //.then((_) {
  //     // setState(() {
  //     //   _isLoading = false;
  //     // });
  //     // });
  //   }
  //   _isInit = false;
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    final List<Productist> loadedProduct =
        Provider.of<ProductListProvider>(context).item;
    final productData = Provider.of<Products>(context).item;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Grocery App',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(builder: (context) {
          return IconButton(
            color: Colors.black,
            icon: Icon(FontAwesomeIcons.gripLines),
            onPressed: () => Scaffold.of(context).openDrawer(),
          );
        }),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: Colors.black,
          ),
          Consumer<Cart>(
            builder: (_, cartdata, ch) => Badge(
              child: ch!,
              value: cartdata.itemCount.toString(),
              // color: Colors.red,
            ),
            child: IconButton(
                color: Colors.black,
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
                icon: Icon(FontAwesomeIcons.shoppingBasket)),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: _isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Column(children: [
                  CarouselSlider(
                    items: productData.map((e) {
                      return Builder(builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(color: Colors.amber),
                            child: Image.asset(
                              e.assetPath,
                              fit: BoxFit.fill,
                            ));
                      });
                    }).toList(),
                    options: CarouselOptions(
                      height: 200,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      autoPlayInterval: Duration(seconds: 2),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                    ),
                  ),
                  BuildCatagory(),
                  SecondTittle(
                    tittle: 'Top Product',
                  ),
                  ProductCarousel(
                    loadedproducts: loadedProduct
                        .where((element) => element.isPopular)
                        .toList(),
                  ),
                  SecondTittle(
                    tittle: 'Recommended',
                  ),
                  ProductCarousel(
                      loadedproducts: loadedProduct
                          .where((element) => element.isRecommended)
                          .toList()),
                ]),
              ),
            ),
    );
  }
}
