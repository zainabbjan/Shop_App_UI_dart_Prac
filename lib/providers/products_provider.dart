import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:udemy_shop_app/providers/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
        id: 'p1',
        title: 'Red Shirt',
        description: 'It\'s very good',
        price: 20.0,
        imageUrl: 'asset/white.jpeg'),
    Product(
        id: 'p2',
        title: ' White Sirt',
        description: 'It\'s very good',
        price: 20.0,
        imageUrl: 'asset/white.jpeg'),
    Product(
        id: 'p3',
        title: 'Red Shirt',
        description: 'It\'s very good',
        price: 20.0,
        imageUrl: 'asset/white.jpeg'),
    Product(
        id: 'p4',
        title: 'Red Shirt',
        description: 'It\'s very good',
        price: 20.0,
        imageUrl: 'asset/white.jpeg'),
    Product(
        id: 'p5',
        title: 'Red Shirt',
        description: 'It\'s very good',
        price: 20.0,
        imageUrl: 'asset/white.jpeg'),
  ];
  List<Product> get favorieItem {
    return _items.where((element) => element.isFavourite).toList();
  }

  // var _showFavouritesOnly = false;

  List<Product> get items {
    // if (_showFavouritesOnly) {
    //   return _items.where((element) => element.isFavourite).toList();
    // }
    return [..._items];
  }

  // void showFavouriesOnly() {
  //   _showFavouritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavouritesOnly = false;
  //   notifyListeners();
  // }

  Product findbyId(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  void addProduct() {
    notifyListeners();
  }
}
