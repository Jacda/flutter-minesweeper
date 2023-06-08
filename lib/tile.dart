import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Tile extends StatelessWidget {
  final Widget? child;
  final int index;
  final Function(Brick) func;
  final Brick brick;

  const Tile({
    super.key,
    this.child,
    required this.brick,
    required this.func,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        func(brick);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: brick.getColor(),
          margin: const EdgeInsets.all(2),
          child: Center(
            child: brick.getNumText(),
          ),
        ),
      ),
    );
  }
}

class Brick {
  late bool hidden;
  late bool bomb;
  late int adjec;
  final int index;

  Brick({required this.index}) {
    hidden = true;
    bomb = false;
    adjec = 0;
  }

  Color getColor() {
    if (hidden) {
      if (index % 2 == 0) return Colors.green[700]!;
      return Colors.green[500]!;
    } else if (bomb) {
      return Colors.black;
    } else {
      return Colors.brown;
    }
  }

  Text getNumText() {
    if (!hidden & !bomb) {
      return Text(
        "$adjec",
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white),
      );
    } else {
      return const Text("");
    }
  }
}
