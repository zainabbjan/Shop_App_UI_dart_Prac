import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udemy_shop_app/providers/cart.dart';
import 'package:udemy_shop_app/providers/order.dart';
import 'package:udemy_shop_app/providers/products_provider.dart';
import 'package:udemy_shop_app/screens/cart_screen.dart';
import 'package:udemy_shop_app/screens/edit_product_screen.dart';
import 'package:udemy_shop_app/screens/order_screen.dart';
import 'package:udemy_shop_app/screens/product_detail_screen.dart';
import 'package:udemy_shop_app/screens/products_overview_screen.dart';
import 'package:udemy_shop_app/screens/user_product_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
ChangeNotifierProvider.value(value: Products()),
ChangeNotifierProvider.value(value: Cart()),
ChangeNotifierProvider.value(value: Orders()),


    ],
    child: Builder(builder: ((context) => 
     MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.deepOrange,
      ),
      home: ProductsOverViewScreen(),
      routes: {
        ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
        CartScreen.routee:(context) => CartScreen(),
        OrdersScreen.routeName:(context) => OrdersScreen(),
        UserProductscreen.routeName: ((context) => UserProductscreen()),
        EditProductScreen.routeName:(context) => EditProductScreen()
      },
    )))
     
    
    );

   
  }
}
