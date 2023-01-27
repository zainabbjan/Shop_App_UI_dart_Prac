import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:udemy_shop_app/providers/products_provider.dart';
import 'package:udemy_shop_app/widgets/app_drawer.dart';
import 'package:udemy_shop_app/widgets/user_product_item.dart';

class UserProductscreen extends StatelessWidget {
  static const routeName = '/user-products';
  const UserProductscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsdata = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Products'),
        actions: [IconButton(onPressed: (() {}), icon: Icon(Icons.add))],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: productsdata.items.length,
            itemBuilder: ((context, index) => Column(
              children: [
               UserProductItem(
                  title: productsdata.items[index].title,
                  imageUrl: productsdata.items[index].imageUrl),
                  Divider(),
              ]
            )
            ),
            ),
      ),
    );
  }
}
