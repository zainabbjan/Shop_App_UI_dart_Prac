import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udemy_shop_app/providers/product.dart';
import 'package:udemy_shop_app/providers/products_provider.dart';
import 'package:udemy_shop_app/providers/products_provider.dart';
import 'package:udemy_shop_app/widgets/product_item.dart';

class productsGrid extends StatelessWidget {
  final bool showFavs;
  productsGrid(this.showFavs);
  @override
  Widget build(BuildContext context) {
    final productsdata = Provider.of<Products>(context);
    
    final products = showFavs ? productsdata.favorieItem : productsdata.items;
    return GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: ((context, index) {
          return ChangeNotifierProvider(
            create: ((context) => products[index]),
            builder: ((context, child) => ProductItem(
                // products[index].id,
                //   products[index].title, products[index].imageUrl
                )),
          );
        }));
  }
}
