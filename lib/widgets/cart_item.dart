import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:udemy_shop_app/providers/cart.dart';

class CarttItem extends StatefulWidget {
  final String id;
  final String Productid;
  final double price;
  final int quantity;
  final String title;

  const CarttItem(
      {super.key,
      required this.id,
      required this.price,
      required this.quantity,
      required this.title,
      required this.Productid});

  @override
  State<CarttItem> createState() => _CarttItemState();
}

class _CarttItemState extends State<CarttItem> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(widget.id),
      background: Container(
        color: Colors.purple,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 48,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
      ),
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: ((context) {
              return AlertDialog(
                title: Text('Are you sure?'),
                content: Text('Do you want to ramove the item from the cart'),
                actions: [
                  TextButton(
                      onPressed: (() {
                        Navigator.of(context).pop(false);
                      }),
                      child: Text('No')),
                  TextButton(
                      onPressed: (() {
                        Navigator.of(context).pop(true);
                      }),
                      child: Text('Yes'))
                ],
              );
            }));
      },
      onDismissed: ((direction) {
        Provider.of<Cart>(context, listen: false).removeItem(widget.Productid);
      }),
      direction: DismissDirection.endToStart,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FittedBox(child: Text('\$ ${widget.price}')),
              ),
            ),
            title: Text(widget.title),
            subtitle: Text('Total:  \$${(widget.price * widget.quantity)}'),
            trailing: Text('${widget.quantity} x'),
          ),
        ),
      ),
    );
  }
}
