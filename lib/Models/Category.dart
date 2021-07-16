class Category {
  final String id;
  final String name;
  final String image;

  Category({required this.id, required this.name, required this.image});

  static List<Category> categoryList = [
    Category(id: 'Fruits', name: 'Fruits', image: 'assets/images/fruits.jpg'),
    Category(
        id: 'VegeTables',
        name: 'Vegetables',
        image: 'assets/images/vegetable.jpg'),
    Category(
        id: 'Bakery', name: 'Bakery Store', image: 'assets/images/bakery.jpg'),
    Category(
        id: 'Tuckshops',
        name: 'Tuck Shop',
        image: 'assets/images/tuckshop.jpg'),
  ];
}
