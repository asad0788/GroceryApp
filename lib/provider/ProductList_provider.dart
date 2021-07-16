import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:groccery_stores/Models/ProductList.dart';

import 'package:http/http.dart' as http;

class ProductListProvider with ChangeNotifier {
  String? authTokens;
  List<Productist> _items = [
    Productist(
        id: '1',
        name: 'Apple',
        category: ['Fruits'],
        imageUrl:
            'https://images.unsplash.com/photo-1584306670957-acf935f5033c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
        price: 1.0,
        isRecommended: false,
        isPopular: false),
    Productist(
        id: '2',
        name: 'Grapes',
        category: ['Fruits'],
        imageUrl:
            'https://images.unsplash.com/photo-1599819177626-b50f9dd21c9b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=667&q=80',
        price: 1.0,
        isRecommended: false,
        isPopular: true),
    Productist(
        id: '3',
        name: 'Water Melon',
        category: ['Fruits'],
        imageUrl:
            'https://images.unsplash.com/photo-1526841535633-ef3be0b21fd2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
        price: 1.0,
        isRecommended: true,
        isPopular: false),
    Productist(
        id: '4',
        name: 'Banana',
        category: ['Fruits'],
        imageUrl:
            'https://cdn1.sph.harvard.edu/wp-content/uploads/sites/30/2018/08/bananas-1354785_1920-1024x683.jpg',
        price: 1.5,
        isRecommended: true,
        isPopular: false),
    Productist(
        id: '5',
        name: 'Onion',
        category: ['VegeTables'],
        imageUrl:
            'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/the-health-benefits-of-onions-main-image-700-350-8425535.jpg',
        price: 0.5,
        isRecommended: false,
        isPopular: false),
    Productist(
        id: '6',
        name: 'Carrot',
        category: ['VegeTables'],
        imageUrl:
            'https://images.unsplash.com/photo-1445282768818-728615cc910a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80',
        price: 0.5,
        isRecommended: false,
        isPopular: true),
    Productist(
        id: '7',
        name: 'lady Finger',
        category: ['VegeTables'],
        imageUrl:
            'https://images.unsplash.com/photo-1425543103986-22abb7d7e8d2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
        price: 0.5,
        isRecommended: false,
        isPopular: false),
    Productist(
        id: '8',
        name: 'Patato',
        category: ['VegeTables'],
        imageUrl:
            'https://images.unsplash.com/photo-1558818498-28c1e002b655?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
        price: 0.5,
        isRecommended: false,
        isPopular: false),
    Productist(
        id: '9',
        name: 'Biscuits',
        category: ['Bakery'],
        imageUrl:
            'https://images.unsplash.com/photo-1558961363-fa8fdf82db35?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=401&q=80',
        price: 1.0,
        isRecommended: false,
        isPopular: false),
    Productist(
        id: '10',
        name: 'Cake',
        category: ['Bakery'],
        imageUrl:
            'https://images.unsplash.com/photo-1578985545062-69928b1d9587?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=680&q=80',
        price: 2.5,
        isRecommended: false,
        isPopular: false),
    Productist(
        id: '11',
        name: 'Tomato Ketchup',
        category: ['Bakery'],
        imageUrl:
            'https://images.unsplash.com/photo-1624462048568-72794ee6d6f8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=375&q=80',
        price: 0.5,
        isRecommended: false,
        isPopular: true),
    Productist(
        id: '12',
        name: 'Samosa',
        category: ['Bakery'],
        imageUrl:
            'https://images.unsplash.com/photo-1601050690597-df0568f70950?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
        price: 0.2,
        isRecommended: true,
        isPopular: false),
    Productist(
        id: '13',
        name: 'Burger',
        category: ['Bakery'],
        imageUrl:
            'https://images.unsplash.com/photo-1586190848861-99aa4a171e90?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=80',
        price: 0.6,
        isRecommended: false,
        isPopular: false),
    Productist(
        id: '14',
        name: 'Lays',
        category: ['Bakery'],
        imageUrl:
            'https://images.unsplash.com/photo-1614242239788-3282f136fe10?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=324&q=80',
        price: 0.6,
        isRecommended: false,
        isPopular: false),
    Productist(
        id: '15',
        name: 'Toffee',
        category: ['Tuckshops'],
        imageUrl:
            'https://images.unsplash.com/photo-1610112908715-bfb038058815?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=375&q=80',
        price: 0.6,
        isRecommended: false,
        isPopular: false),
    Productist(
        id: '16',
        name: 'Cold Drinks',
        category: ['Tuckshops'],
        imageUrl:
            'https://images.unsplash.com/photo-1525629732193-7a6416802b21?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
        price: 0.6,
        isRecommended: false,
        isPopular: false),
    Productist(
        id: '17',
        name: 'Choclates',
        category: ['Tuckshops'],
        imageUrl:
            'https://images.unsplash.com/photo-1610450949065-1f2841536c88?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
        price: 0.6,
        isRecommended: true,
        isPopular: true),
    Productist(
        id: '14',
        name: 'Lays',
        category: ['Tuckshops'],
        imageUrl:
            'https://images.unsplash.com/photo-1614242239788-3282f136fe10?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=324&q=80',
        price: 0.6,
        isRecommended: false,
        isPopular: false),
  ];
  // final String authToken;

  // ProductListProvider( this._items);
  // ProductListProvider.a(this._items, this.authTokens);

  void update(String? authToken, List<Productist> lists) {
    authTokens = authToken;

    this._items = lists;
  }

  List<Productist> get item {
    return [..._items];
  }

  Productist findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void addProduct(Productist product) {
    final apiurl =
        "https://grocery-app-a56c3-default-rtdb.firebaseio.com/products.json?auth=$authTokens";
    http
        .post(Uri.parse(apiurl),
            body: json.encode({
              'id': product.id,
              'tittle': product.name,
              'price': product.price,
              'imageurl': product.imageUrl,
              'category': product.category.toString(),
              'ispapular': product.isPopular,
              'isrecommended': product.isRecommended
            }))
        .then((response) {
      print(json.decode(response.body));
      final newProduct = Productist(
          name: product.name,
          id: json.decode(response.body)['name'],
          category: product.category,
          imageUrl: product.imageUrl,
          price: product.price,
          isRecommended: product.isRecommended,
          isPopular: product.isPopular);
      _items.add(newProduct);
      notifyListeners();
    });
  }

  void updateroduct(String id, Productist newProduct) {
    final prodIndex = _items.indexWhere((element) => element.id == id);
    if (prodIndex >= 0) {
      final apiurl =
          "https://grocery-app-a56c3-default-rtdb.firebaseio.com/products/$id.json?auth=$authTokens";
      http.patch(Uri.parse(apiurl),
          body: json.encode({
            'id': newProduct.id,
            'tittle': newProduct.name,
            'price': newProduct.price,
            'imageurl': newProduct.imageUrl,
            'category': newProduct.category,
            'ispapular': newProduct.isPopular,
            'isrecommended': newProduct.isRecommended
          }));
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }

  Future<void> fetchAndSetProducts() async {
    final url =
        'https://grocery-app-a56c3-default-rtdb.firebaseio.com/products.json?auth=$authTokens';
    try {
      final response = await http.get(Uri.parse(url));
      print(json.decode(response.body));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Productist> loadedProducts = [];
      extractedData.forEach((prodId, prodData) {
        loadedProducts.add(
          Productist(
              name: prodData['tittle'],
              id: prodId,
              category: prodData['category'],
              imageUrl: prodData['imageurl'],
              price: prodData['price'],
              isRecommended: prodData['isrecommended'],
              isPopular: prodData['ispapular']),
        );
      });

      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  void deleteProduct(String id) {
    final url =
        'https://grocery-app-a56c3-default-rtdb.firebaseio.com/products/$id.json?auth=$authTokens';
    http.delete(Uri.parse(url));
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
