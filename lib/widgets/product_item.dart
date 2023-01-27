import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:udemy_shop_app/providers/cart.dart';
import 'package:udemy_shop_app/providers/product.dart';
import 'package:udemy_shop_app/providers/products_provider.dart';
import 'package:udemy_shop_app/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;
  // ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: (() {
            Navigator.pushNamed(context, ProductDetailScreen.routeName,
                arguments: product.id);
          }),
          child: Image.asset(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        //header as well we can add
        footer: GridTileBar(
          leading: Consumer<Product>(
            builder: (context, value, child) => IconButton(
                onPressed: (() {
                  value.toggleFavouritestatus();
                }),
                color: Theme.of(context).accentColor,
                icon: Icon(value.isFavourite
                    ? Icons.favorite
                    : Icons.favorite_border)),
          ),
          backgroundColor: Colors.black.withOpacity(0.7),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
              onPressed: (() {
                cart.addItem(product.id!, product.price, product.title);
                
              }),
              color: Theme.of(context).accentColor,
              icon: Icon(Icons.shopping_cart)),
        ),
      ),
    );
  }
}
