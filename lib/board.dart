import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:minesweeper/tile.dart';

class Board extends StatefulWidget {
  const Board({super.key});

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  bool isActive = false;
  int rowLenth = 8;
  int colLenth = 16;
  List<Brick> bricks = [];

  @override
  void initState() {
    for (int i = 0; i < colLenth * rowLenth; i++) {
      bricks.add(Brick(index: i));
    }
    super.initState();
  }

  void initGame(int startBrick) {
    isActive = true;
    for (int i = 0; i < colLenth * rowLenth; i++) {
      if (i == startBrick || isAdjecant(startBrick, i)) continue;
      if (Random().nextInt((4)) == 1) {
        bricks[i].bomb = true;
      }
    }
  }

  void openBrick(Brick brick) {
    setState(() {
      if (!isActive) initGame(brick.index);
      countBombs(brick.index);
    });
  }

  void countBombs(int index) {
    bricks[index].hidden = false;
    int count = 0;
    for (int i = index - rowLenth - 1; i < index + rowLenth; i += rowLenth) {
      for (int k = 0; k < 3; k++) {
        if (isExternal(index, k + i)) {
          continue;
        }
        if (bricks[i + k].bomb) {
          count++;
        }
      }
    }
    if (count == 0) {
      openAdjecant(index);
    }
    bricks[index].adjec = count;
  }

  void openAdjecant(center) {
    print(center);
    for (int i = center - rowLenth - 1; i < center + rowLenth; i += rowLenth) {
      for (int k = 0; k < 3; k++) {
        if (isExternal(center, k + i) || k + i == center) {
          continue;
        }
        if (!bricks[i + k].hidden) {
          continue;
        }
        countBombs(k + i);
      }
    }
  }

  bool isAdjecant(int center, int index) {
    for (int i = center - rowLenth - 1; i < center + rowLenth; i += rowLenth) {
      for (int k = 0; k < 3; k++) {
        if (isExternal(center, k + i)) {
          continue;
        }
        if (index == i + k) return true;
      }
    }
    return false;
  }

  bool isExternal(int center, int index) {
    if (index > 127 || index < 0) {
      return true;
    } else if (center % 8 == 0 && (index + 1) % 8 == 0) {
      return true;
    } else if (index % 8 == 0 && (center + 1) % 8 == 0) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.fromLTRB(10, 100, 10, 0),
        child: GridView.builder(
          itemCount: rowLenth * colLenth,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: rowLenth,
          ),
          itemBuilder: (context, index) {
            return Tile(
              index: index,
              brick: bricks[index],
              func: openBrick,
            );
          },
        ),
      ),
    );
  }
}
