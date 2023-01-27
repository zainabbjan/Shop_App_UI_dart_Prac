import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:udemy_shop_app/providers/product.dart';
import 'package:udemy_shop_app/providers/products_provider.dart';
import 'package:udemy_shop_app/screens/cart_screen.dart';
import 'package:udemy_shop_app/widgets/app_drawer.dart';
import 'package:udemy_shop_app/widgets/badge.dart';
import 'package:udemy_shop_app/widgets/product_item.dart';
import 'package:udemy_shop_app/widgets/products_grid.dart';

import '../providers/cart.dart';

enum FilterOptions {
  Favourites,
  All,
}

class ProductsOverViewScreen extends StatefulWidget {
  @override
  State<ProductsOverViewScreen> createState() => _ProductsOverViewScreenState();
}

class _ProductsOverViewScreenState extends State<ProductsOverViewScreen> {
  var _showOnlyFavourites = false;
  @override
  Widget build(BuildContext context) {
    // final productsContainer = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: [
          PopupMenuButton(
              onSelected: ((FilterOptions svalue) {
                setState(() {
                  if (svalue == FilterOptions.Favourites) {
                    // productsContainer.showFavouriesOnly();

                    _showOnlyFavourites = true;
                  } else {
                    // productsContainer.showAll();
                    _showOnlyFavourites = false;
                  }
                });
              }),
              icon: Icon(Icons.more_vert),
              itemBuilder: ((_) => [
                    PopupMenuItem(
                      child: Text('only favourites'),
                      value: FilterOptions.Favourites,
                    ),
                    PopupMenuItem(
                      child: Text('Show all'),
                      value: FilterOptions.All,
                    ),
                  ])),
          Consumer<Cart>(
            builder: (context, c, child) => Badge(
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routee);
                },
              ),
              value: c.itemCoun.toString(),
            ),
          )
        ],
      ),
      drawer:  AppDrawer(),
      body: productsGrid(_showOnlyFavourites),
    );
  }
}
