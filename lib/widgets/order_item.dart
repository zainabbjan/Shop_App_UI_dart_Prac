import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:udemy_shop_app/providers/order.dart';

class OrderrItemm extends StatefulWidget {
  final OrderItem orderItem;
  const OrderrItemm({super.key, required this.orderItem});

  @override
  State<OrderrItemm> createState() => _OrderrItemmState();
}

class _OrderrItemmState extends State<OrderrItemm> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$ ${widget.orderItem.amount}'),
            subtitle: Text(DateFormat('dd MM yyyy hh:mm')
                .format(widget.orderItem.dateTime)),
            trailing: IconButton(
                onPressed: (() {
                  setState(() {
                    _expanded = !_expanded;
                  });
                }),
                icon: Icon( _expanded?  Icons.expand_less:  Icons.expand_more)),
          ),
        ],
      ),
    );
  }
}
