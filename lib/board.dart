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
  int rowLenth = 8;
  int colLenth = 16;

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
              color: Colors.green,
            );
          },
        ),
      ),
    );
  }
}
