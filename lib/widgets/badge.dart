import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Badge extends StatelessWidget {
  final Widget child;
  final String value;
  final Color color;
  const Badge(
      {super.key,
      required this.child,
      required this.value,
       this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
            right: 8,
            top: 8,
            child: Container(
              padding: EdgeInsets.all(2.0),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10.0),
                  color: color != null?color: Theme.of(context).accentColor),
                  
                  constraints:  BoxConstraints(maxHeight: 16,
                  minWidth: 16),

                  child: 
                  Text(value,
                  textAlign:  TextAlign.center,
                  style: TextStyle(fontSize: 10),),
                  ),

            )
      ],
    );
  }
}
