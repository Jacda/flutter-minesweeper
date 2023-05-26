import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Tile extends StatelessWidget {
  final Color? color;
  final Widget? child;
  final int index;
  const Tile({super.key, this.color, this.child, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: color,
          margin: const EdgeInsets.all(2),
          child: Center(
              child: Text(
            "$index",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          )),
        ),
      ),
    );
  }
}
