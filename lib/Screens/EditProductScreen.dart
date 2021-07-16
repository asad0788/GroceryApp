import 'package:flutter/material.dart';

import 'package:groccery_stores/Models/ProductList.dart';
import 'package:groccery_stores/provider/ProductList_provider.dart';
import 'package:provider/provider.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/EditProductScreen';
  const EditProductScreen({Key? key}) : super(key: key);

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  String? valueChoose;
  bool category = false;
  bool isPapular = false;
  List listItem = ["Fruits", "VegeTables", "Bakery", "Tuckshops"];
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  var isInit = true;
  var _isInItValue = {
    'name': '',
    'id': '',
    'category': '',
    'imageUrl': '',
    'price': '',
    'isRecommended': '',
    'isPopular': '',
  };

  void _saveForm() {
    _formKey.currentState!.save();
    if (editProduct.id != null) {
      Provider.of<ProductListProvider>(context, listen: false)
          .updateroduct(editProduct.id.toString(), editProduct);
      Navigator.of(context).pop();
    } else {
      Provider.of<ProductListProvider>(context, listen: false)
          .addProduct(editProduct);
      Navigator.of(context).pop();
    }

    print(editProduct.id);
    print(editProduct.name);
    print(editProduct.imageUrl);
    print(editProduct.category);
    print(editProduct.price);
    print(editProduct.isPopular);
    print(editProduct.isRecommended);
    isLoading = false;
  }

  @override
  void didChangeDependencies() {
    if (isInit) {
      final productid = ModalRoute.of(context)!.settings.arguments as String?;
      if (productid != null) {
        final _editProduct =
            Provider.of<ProductListProvider>(context, listen: false)
                .findById(productid);
        _isInItValue = {
          'id': _editProduct.id.toString(),
          'name': _editProduct.name,
          'category': _editProduct.category.toString(),
          'imageUrl': _editProduct.imageUrl,
          'price': _editProduct.price.toString(),
          'isRecommended': _editProduct.isRecommended.toString(),
          'isPopular': _editProduct.isPopular.toString(),
        };
      }
    }
    isInit = false;
    super.didChangeDependencies();
  }

  var editProduct = Productist(
      name: '',
      id: null,
      category: [],
      imageUrl: '',
      price: 0,
      isRecommended: false,
      isPopular: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    // TextFormField(
                    //   initialValue: _isInItValue['id'],
                    //   onSaved: (value) {
                    //     editProduct = Productist(
                    //         name: editProduct.name,
                    //         id: null,
                    //         category: editProduct.category,
                    //         imageUrl: editProduct.imageUrl,
                    //         price: editProduct.price,
                    //         isRecommended: editProduct.isRecommended,
                    //         isPopular: editProduct.isPopular);
                    //   },
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return 'User id Cannot be empty';
                    //     }
                    //     return null;
                    //   },
                    //   decoration: InputDecoration(
                    //     labelText: 'id',
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(20),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 10),
                    TextFormField(
                        initialValue: _isInItValue['name'],
                        onSaved: (value) {
                          editProduct = Productist(
                              name: value.toString(),
                              id: null,
                              category: editProduct.category,
                              imageUrl: editProduct.imageUrl,
                              price: editProduct.price,
                              isRecommended: editProduct.isRecommended,
                              isPopular: editProduct.isPopular);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'User Name Cannot be empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        textInputAction: TextInputAction.next),
                    SizedBox(height: 10),
                    TextFormField(
                        initialValue: _isInItValue['price'],
                        onSaved: (value) {
                          editProduct = Productist(
                              name: editProduct.name,
                              id: null,
                              category: editProduct.category,
                              imageUrl: editProduct.imageUrl,
                              price: double.parse(value.toString()),
                              isRecommended: editProduct.isRecommended,
                              isPopular: editProduct.isPopular);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Price Cannot be empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Price',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        textInputAction: TextInputAction.next),
                    SizedBox(height: 10),

                    // TextFormField(
                    //     decoration: InputDecoration(
                    //       labelText: 'Category',
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(20),
                    //       ),
                    //     ),
                    //     textInputAction: TextInputAction.next),

                    TextFormField(
                      initialValue: _isInItValue['imageUrl'],
                      onSaved: (value) {
                        editProduct = Productist(
                            name: editProduct.name,
                            id: null,
                            category: editProduct.category,
                            imageUrl: value.toString(),
                            price: editProduct.price,
                            isRecommended: editProduct.isRecommended,
                            isPopular: editProduct.isPopular);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Image Url Cannot be empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Image Url',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0, right: 2),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(20)),
                        child: DropdownButton(
                          hint: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Choose Category'),
                          ),
                          isExpanded: true,
                          underline: SizedBox(),
                          items: listItem.map((valueItem) {
                            return DropdownMenuItem(
                                value: valueItem,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    valueItem,
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ));
                          }).toList(),
                          value: valueChoose,
                          onChanged: (newValue) {
                            setState(() {
                              valueChoose = newValue.toString();
                              editProduct = Productist(
                                  name: editProduct.name,
                                  id: null,
                                  category: ['$valueChoose'],
                                  imageUrl: editProduct.imageUrl,
                                  price: editProduct.price,
                                  isRecommended: editProduct.isRecommended,
                                  isPopular: editProduct.isPopular);
                            });
                          },
                        ),
                      ),
                    ),

                    SizedBox(height: 10),

                    SwitchListTile(
                        title: Text('Product is Recommended'),
                        value: editProduct.isRecommended,
                        onChanged: (value) {
                          setState(() {
                            editProduct = Productist(
                                name: editProduct.name,
                                id: null,
                                category: editProduct.category,
                                imageUrl: editProduct.imageUrl,
                                price: editProduct.price,
                                isRecommended: value,
                                isPopular: editProduct.isPopular);
                          });
                        }),
                    SizedBox(height: 10),
                    SwitchListTile(
                        title: Text('Product is Papular'),
                        value: editProduct.isPopular,
                        onChanged: (value) {
                          setState(() {
                            editProduct = Productist(
                                name: editProduct.name,
                                id: null,
                                category: editProduct.category,
                                imageUrl: editProduct.imageUrl,
                                price: editProduct.price,
                                isRecommended: editProduct.isRecommended,
                                isPopular: value);
                          });
                        }),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: ElevatedButton(
                        onPressed: () {
                          _saveForm();
                        },
                        child: Text('Submit'),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
